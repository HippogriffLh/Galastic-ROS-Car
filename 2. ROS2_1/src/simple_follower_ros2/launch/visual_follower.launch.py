import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import (DeclareLaunchArgument, GroupAction,
                            IncludeLaunchDescription, SetEnvironmentVariable)
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
import launch_ros.actions
from launch.conditions import IfCondition

#def launch(launch_descriptor, argv):
def generate_launch_description():
    bringup_dir = get_package_share_directory('turn_on_wheeltec_robot')
    launch_dir = os.path.join(bringup_dir, 'launch')

    wheeltec_robot = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(launch_dir, 'turn_on_wheeltec_robot.launch.py')),
    )

    wheeltec_camera = IncludeLaunchDescription(
            PythonLaunchDescriptionSource(os.path.join(launch_dir, 'wheeltec_camera.launch.py')),
    )
    return LaunchDescription([
        wheeltec_robot,wheeltec_camera,
                
        launch_ros.actions.Node(
            package='simple_follower_ros2', 
            executable='visualtracker', 
            name='visualtracker',
             ),
        launch_ros.actions.Node(
            package='simple_follower_ros2', 
            executable='visualfollow', 
            name='visualfollow',
            output='screen',
            ),]
            
    )

