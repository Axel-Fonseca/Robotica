"""webots_ros2 package setup file."""

# Setup webots_tiago
# Version final
# 
# 
# 
# 
# Autores: Aldo A. Z;	Axel A. F;  Dennis Ivan P. M;	Kathia Paola B. C.	



# Anexos en las lineas: 
#
# L21-23 => data_files.append(('share/' + package_name + '/protos', ['protos/Tiago.proto']))
# L28 => 'worlds/Labs.wbt', 'worlds/.Labs.wbproj'
# L42 => 'Aldo AZ', 'Axel AF', 'Dennis Iván PM', 'Kathia Paola BC',
#
#
#
#

from setuptools import setup

package_name = 'webots_tiago'
data_files = []
data_files.append(
    ('share/ament_index/resource_index/packages', ['resource/' + package_name]))
data_files.append(('share/' + package_name, ['launch/tiago.launch.py']))

data_files.append(('share/' + package_name + '/protos', [
    'protos/Tiago++.proto'
]))

data_files.append(('share/' + package_name + '/worlds', [
    'worlds/Labs_2.wbt', 'worlds/.Labs_2.wbproj',
]))
data_files.append(('share/' + package_name + '/resource',
                   ['resource/odometry.rviz', 'resource/tiago.yaml']))
data_files.append(('share/' + package_name, ['package.xml']))


setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files = data_files,
    install_requires=['setuptools', 'launch'],
    zip_safe=True,
    maintainer='dennis', 
    maintainer_email='dennis@todo.todo',
    description='TODO: Package description',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'tiago_driver = webots_tiago.tiago_driver:main'
        ],
        'launch.frontend.launch_extension': ['launch_ros = launch_ros']
    },
)
