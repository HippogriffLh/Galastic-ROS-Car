import os
from pathlib import Path
import launch_ros.actions
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import (DeclareLaunchArgument, GroupAction,
                            IncludeLaunchDescription, SetEnvironmentVariable)
from launch.launch_description_sources import PythonLaunchDescriptionSource

def generate_launch_description():
    
    Lslidar_dir = get_package_share_directory('lslidar_driver')
    Lslidar_launch_dir = os.path.join(Lslidar_dir, 'launch')
    
    LslidarN10P_dir = get_package_share_directory('lslidar_driver_n10p')
             
    Ld14_dir = get_package_share_directory('ldlidar_sl_ros2')
    Ld14_launch_dir = os.path.join(Ld14_dir, 'launch')
    
    Ld06_dir = get_package_share_directory('ldlidar_stl_ros2')
    Ld06_launch_dir = os.path.join(Ld14_dir, 'launch')

    Ydlidar_dir = get_package_share_directory('ydlidar_ros2_driver')
    Ydlidar_launch_dir = os.path.join(Ydlidar_dir, 'launch')
           
    Lsm10_m10_uart = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Lslidar_launch_dir, 'lsm10_uart_launch.py')),)
            
    Lsm10_m10_net = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Lslidar_launch_dir, 'lsm10_net_launch.py')),)
            
    Lsm10_m10p_uart = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Lslidar_launch_dir, 'lsm10p_uart_launch.py')),)
            
    Lsm10_m10p_net = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Lslidar_launch_dir, 'lsm10p_net_launch.py')),)
             
    Lsn10 = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Lslidar_launch_dir, 'lsn10_launch.py')),)
    Lsn10p = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(LslidarN10P_dir, 'launch','lslidar_launch.py')),)
                    
    Ld14 = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Ld14_launch_dir, 'ld14.launch.py')),)
    Ld06 = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Ld06_launch_dir, 'ld06.launch.py')),)
    
    # Add the path of the launch file for Ydlidar 
    Ydld = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(Ydlidar_launch_dir, 'ydlidar_launch.py')),)
                  
    # Create the launch description and populate
    ld = LaunchDescription()
    '''
    Please select your lidar here, options include:
    Lsm10_m10p_uart、Lsm10_m10p_net、Lsm10_m10_net、Lsm10_m10_uart、Lsn10、Ld14、Ld06.
    1.If you are using LS* lidar (including lsn10, lsm10*), please don't forget to 
    modify the tf conversion parameters of robot_mode_description.launch.py
    according to the user guide file.
    2.If you are using m10 lidar, please pay attention to distinguish whether it is m10p or not.
    '''
    ld.add_action(Ydld)

    return ld
