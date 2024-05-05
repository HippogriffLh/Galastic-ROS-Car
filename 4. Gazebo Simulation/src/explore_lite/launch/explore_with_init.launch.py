import os
from ament_index_python.packages import get_package_share_directory
from launch_ros.actions import Node
from launch import LaunchDescription
from launch.event_handlers import OnProcessExit
from launch.actions import DeclareLaunchArgument, RegisterEventHandler
from launch.substitutions import LaunchConfiguration

def generate_launch_description():
    ld = LaunchDescription()
    config = os.path.join(
        get_package_share_directory("explore_lite"), "config", "params.yaml"
    )
    use_sim_time = LaunchConfiguration("use_sim_time")
    namespace = LaunchConfiguration("namespace")

    declare_use_sim_time_argument = DeclareLaunchArgument(
        "use_sim_time", 
        default_value="true", 
        description="Use simulation/Gazebo clock"
    )
    declare_namespace_argument = DeclareLaunchArgument(
        "namespace",
        default_value="",
        description="Namespace for the explore node",
    )

    # Map fully qualified names to relative ones so the node's namespace can be prepended.
    # In case of the transforms (tf), currently, there doesn't seem to be a better alternative
    # https://github.com/ros/geometry2/issues/32
    # https://github.com/ros/robot_state_publisher/pull/30
    remappings = [("/tf", "tf"), ("/tf_static", "tf_static")]

    node_init = Node(
        package='explore_lite',
        name='explore_init',
        namespace=namespace,
        executable='navigate_init.py',
        output='screen'
    )

    node_explore = Node(
        package="explore_lite",
        name="explore_node",
        namespace=namespace,
        executable="explore",
        parameters=[config, {"use_sim_time": use_sim_time}],
        output="screen",
        remappings=remappings,
    )

    event_handler = RegisterEventHandler(
        event_handler=OnProcessExit(
            target_action=node_init,
            on_exit=[node_explore]
        )
    )

    ld.add_action(declare_use_sim_time_argument)
    ld.add_action(declare_namespace_argument)
    ld.add_action(node_init)
    ld.add_action(event_handler)

    return ld