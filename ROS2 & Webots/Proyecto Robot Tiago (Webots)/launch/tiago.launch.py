#!/usr/bin/env python

# Copyright 1996-2021 Cyberbotics Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Modification in line:
# L29 - 37 => from launch ...
# L47 => 'package': 'webots_ros2_tiago'
# L49 => 'Labs.wbt'
#
#
#

"""Launch Webots and the controller."""

import os
import launch
import launch_ros.actions
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory

def generate_launch_description():
    package_dir = get_package_share_directory('webots_tiago')
    world = LaunchConfiguration('world')
    
    webots = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(get_package_share_directory('webots_ros2_core'), 'launch', 'robot_launch.py')
        ),
        launch_arguments=[
        	('package', 'webots_tiago'),
        	('executable', 'tiago_driver'),
        	('world', PathJoinSubstitution([package_dir, 'worlds', world])),
        ]
    )

    # Rviz node
    use_rviz = launch.substitutions.LaunchConfiguration('rviz', default=False)
    rviz_config = os.path.join(get_package_share_directory('webots_tiago'), 'resource', 'odometry.rviz')
    rviz = launch_ros.actions.Node(
        package='rviz2',
        executable='rviz2',
        output='screen',
        arguments=['--display-config=' + rviz_config],
        condition=launch.conditions.IfCondition(use_rviz)
    )

    return launch.LaunchDescription([
	DeclareLaunchArgument(

	      'world',

	      default_value='Labs_2.wbt',

	      description='Choose one of the world files from `/webots_tiago/world` directory'

	),
	webots,
	rviz
    ])
    
