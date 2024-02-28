import os
 
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import ExecuteProcess, DeclareLaunchArgument
from launch_ros.actions import Node
from launch.substitutions import LaunchConfiguration
 
# this is the function launch  system will look for
 
def generate_launch_description():
 
    package_name = 'robot_simulation'
 
    # full  path to urdf and world file
    world = os.path.join(get_package_share_directory(package_name), 'world', 'botroom.world')
    urdf = os.path.join(get_package_share_directory(package_name), 'urdf', 'robot.urdf')

    spawn_robot = Node(
        package='gazebo_ros',
        executable='spawn_entity.py',
        name='spawn_entity',
        namespace="robot",
        output='screen',
        # emulate_tty=True,
        arguments=['-entity', 'robot1',
                   '-x', '3.5', '-y', '1.0', '-z', '0.1',
                   '-file', urdf
                   ]
    )

    launch_gazebo = ExecuteProcess(
        cmd=['gazebo', 
            '--verbose', world, 
            '-s', 'libgazebo_ros_factory.so'],
        output='screen'
    )

    # create and return launch description object
    return LaunchDescription([
        # start gazebo, notice we are using libgazebo_ros_factory.so instead of libgazebo_ros_init.so
        # That is because only libgazebo_ros_factory.so contains the service call to /spawn_entity
        launch_gazebo,
        spawn_robot,
    ])
