#!/usr/bin/env python3 

import rclpy
import math
import tf2_ros
from rclpy.node import Node
from rclpy.qos import QoSProfile, QoSReliabilityPolicy, QoSHistoryPolicy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import PoseStamped, Quaternion
from transforms3d.euler import euler2quat, quat2euler
from nav2_simple_commander.robot_navigator import BasicNavigator, TaskResult

# distance desired to move
distance_desired = 2.0

class ObstacleDetector(Node):

    def __init__(self):
        super().__init__('obstacle_detector')
        qos_profile = QoSProfile(
            history=QoSHistoryPolicy.KEEP_LAST,
            depth=10,
            reliability=QoSReliabilityPolicy.BEST_EFFORT
        )
        self.subscription = self.create_subscription(
            LaserScan,
            '/scan',
            self.listener_callback,
            qos_profile
        )
        self.free_direction = None
        self.free_directions =None
        self.angle_increment = 0.0
        self.ranges = []
        self.distance_desired = distance_desired

    def listener_callback(self, msg):
        self.ranges = msg.ranges
        self.angle_increment = msg.angle_increment
        self.detect_free_direction()

    def detect_free_direction(self):
        directions = {
            "front_center": (-20, 20),
            "left_front": (-65, -20),
            "left_center": (-115, -65),
            "left_back": (-160, -115),
            "right_front": (20, 65),
            "right_center": (65, 115),
            "right_back": (115, 160),
            "back_center": (-160, 160)
        }
        free_directions = []

        for direction, (min_angle, max_angle) in directions.items():
            clear = False
            min_index = math.ceil(min_angle / math.degrees(self.angle_increment) + len(self.ranges) // 2)
            max_index = math.ceil(max_angle / math.degrees(self.angle_increment) + len(self.ranges) // 2)

            if direction != 'back_center':
                if all(r > self.distance_desired for r in self.ranges[min_index:max_index]):
                    clear = True
                    free_directions.append(direction)
            else:
                if all(r > self.distance_desired for r in self.ranges[0:min_index]) and \
                    all(r > self.distance_desired for r in self.ranges[max_index:359]):
                    clear = True
                    free_directions.append(direction)

        if free_directions:
            self.free_directions = free_directions
            if free_directions[0] != "back_center":
                self.free_direction = math.radians(directions.get(free_directions[0])[0] + \
                                    directions.get(free_directions[0])[1])/2
            else:
                self.free_direction = math.pi
        else:
            self.free_direction = None

        self.get_logger().info(f'Free directions: {free_directions} ')
        self.get_logger().info(f'Free direction: {free_directions[0]} '
                               f'Direction angle: {self.free_direction} ')

class TargetPositionCalculator(Node):

    def __init__(self, free_direction):
        super().__init__('target_position_calculator')
        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer, self)
        self.current_pose = None
        self.target_position = None
        self.free_direction = free_direction
        self.timer = self.create_timer(1.0, self.get_robot_pose)
        
    def get_robot_pose(self):
        try:
            self.tf_buffer.can_transform('map', 'base_footprint', rclpy.time.Time(), rclpy.time.Duration(seconds=5.0))
            trans = self.tf_buffer.lookup_transform('map', 'base_footprint', rclpy.time.Time())
            self.current_pose = PoseStamped()
            self.current_pose.header = trans.header
            self.current_pose.pose.position.x = trans.transform.translation.x
            self.current_pose.pose.position.y = trans.transform.translation.y
            self.current_pose.pose.orientation = trans.transform.rotation
            e = quat2euler([self.current_pose.pose.orientation.w,
                                          self.current_pose.pose.orientation.x,
                                          self.current_pose.pose.orientation.y,
                                          self.current_pose.pose.orientation.z])

            x_offset = distance_desired * math.cos(self.free_direction + e[2])
            y_offset = distance_desired * math.sin(self.free_direction + e[2])

            self.target_position = PoseStamped()
            self.target_position.header.frame_id = "map"
            self.target_position.pose.position.x = self.current_pose.pose.position.x + x_offset
            self.target_position.pose.position.y = self.current_pose.pose.position.y + y_offset
            q = euler2quat(0, 0, self.free_direction)
            self.target_position.pose.orientation = Quaternion(x=q[1], y=q[2], z=q[3], w=q[0])

        except tf2_ros.LookupException as e:
            self.get_logger().error(f'Failed to get transform: {e}')

class RobotNavigator(Node):

    def __init__(self):
        super().__init__('robot_navigator')
        self.navigator = BasicNavigator()

    def navigate_to_target(self, target_position):
        self.navigator.goToPose(target_position)

        while not self.navigator.isTaskComplete():
            feedback = self.navigator.getFeedback()
            self.get_logger().info(f'Estimated time remaining: {feedback.estimated_time_remaining}')
            rclpy.spin_once(self, timeout_sec=1.0)

        result = self.navigator.getResult()
        if result == TaskResult.SUCCEEDED:
            self.get_logger().info('Goal succeeded!')
        else:
            self.get_logger().info(f'Goal failed with status code: {result}')

def main(args=None):
    rclpy.init(args=args)
    detector = ObstacleDetector()
    rclpy.spin_once(detector)

    if detector.free_direction is not None:
        calculator = TargetPositionCalculator(detector.free_direction)

        for _ in range(300):
            rclpy.spin_once(calculator, timeout_sec=0.1)

        if calculator.target_position:
            navigator = RobotNavigator()
            navigator.navigate_to_target(calculator.target_position)
            navigator.destroy_node()

        calculator.destroy_node()

    detector.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
