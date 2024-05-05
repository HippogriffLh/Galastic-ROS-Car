#!/usr/bin/env python3
# Copyright 2024 Samsung Research America
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import rclpy
from rclpy.node import Node
from nav_msgs.msg import OccupancyGrid
from geometry_msgs.msg import PoseStamped

class FullCoveragePathPlanner(Node):
    def __init__(self):
        super().__init__('full_coverage_path_planner')
        self.subscription = self.create_subscription(
            OccupancyGrid,
            'map',
            self.map_callback,
            10)
        self.publisher = self.create_publisher(
            PoseStamped,
            'goal_pose',
            10)
        self.visited = []
        self.grid = []

    def map_callback(self, msg):
        self.get_logger().info('Received a map')
        self.grid = self.occupancy_grid_to_2d_array(msg)
        self.visited = [[False for _ in range(len(self.grid[0]))] for _ in range(len(self.grid))]
        start_x, start_y = 0, 0  # 假设起始点为(0, 0)，根据实际情况调整
        self.dfs(start_x, start_y)

    def dfs(self, x, y):
        if x < 0 or x >= len(self.grid[0]) or y < 0 or y >= len(self.grid) or self.visited[y][x] or self.grid[y][x] == 1:
            return
        self.visited[y][x] = True

        # 发布当前位置的坐标（此处仅为示例，应根据实际机器人位置调整）
        self.publish_goal_pose(x, y)
        
        # 访问邻居
        self.dfs(x+1, y)  # 右
        self.dfs(x-1, y)  # 左
        self.dfs(x, y+1)  # 下
        self.dfs(x, y-1)  # 上

    def occupancy_grid_to_2d_array(self, occupancy_grid):
        width = occupancy_grid.info.width
        height = occupancy_grid.info.height
        data = occupancy_grid.data
        grid = [[0 for _ in range(width)] for _ in range(height)]
        for i in range(height):
            for j in range(width):
                grid[i][j] = 0 if data[i * width + j] == 0 else 1
        return grid

    def publish_goal_pose(self, x, y):
        goal_pose = PoseStamped()
        goal_pose.header.stamp = self.get_clock().now().to_msg()
        goal_pose.header.frame_id = "map"
        # 将栅格坐标转换为实际坐标（这需要根据地图的分辨率和原点进行调整）
        goal_pose.pose.position.x = x * 1.0  # 假设每个栅格代表0.05m
        goal_pose.pose.position.y = y * 1.0
        goal_pose.pose.orientation.w = 1.0
        self.publisher.publish(goal_pose)
        self.get_logger().info(f'Published goal pose at ({x}, {y})')

def main(args=None):
    rclpy.init(args=args)
    full_coverage_path_planner = FullCoveragePathPlanner()
    rclpy.spin(full_coverage_path_planner)
    full_coverage_path_planner.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()