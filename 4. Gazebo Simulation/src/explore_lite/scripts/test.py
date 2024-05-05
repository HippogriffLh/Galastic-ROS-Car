#!/usr/bin/env python3 

import rclpy
import math
import tf2_ros
from rclpy.node import Node
from rclpy.qos import QoSProfile, QoSReliabilityPolicy, QoSHistoryPolicy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import PoseStamped, Quaternion
from transforms3d.euler import euler2quat
from nav2_simple_commander.robot_navigator import BasicNavigator, TaskResult

# distance desired to move
distance_desired = 2.0

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
            print(self.current_pose.pose.position.x, self.current_pose.pose.position.y)

            x_offset = distance_desired * math.cos(self.free_direction)
            y_offset = distance_desired * math.sin(self.free_direction)
            print(x_offset, y_offset)

            self.target_position = PoseStamped()
            self.target_position.header.frame_id = "map"
            self.target_position.pose.position.x = self.current_pose.pose.position.x + x_offset
            self.target_position.pose.position.y = self.current_pose.pose.position.y + y_offset
            q = euler2quat(0, 0, self.free_direction)
            self.target_position.pose.orientation = Quaternion(x=q[1], y=q[2], z=q[3], w=q[0])

        except tf2_ros.LookupException as e:
            self.get_logger().error(f'Failed to get transform: {e}')

def main(args=None):
    rclpy.init(args=args)
    calculator = TargetPositionCalculator(45* (math.pi/180))
    for _ in range(300):
            rclpy.spin_once(calculator, timeout_sec=0.1)
    calculator.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()