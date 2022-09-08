import rclpy
from webots_ros2_core.webots_differential_drive_node import WebotsDifferentialDriveNode


class TiagoDriver(WebotsDifferentialDriveNode):
    def __init__(self, args):
        super().__init__(
            'tiago_driver',
            args,
            left_encoder='wheel_left_joint_sensor',
            left_joint='wheel_left_joint',
            right_encoder='wheel_right_joint_sensor',
            right_joint='wheel_right_joint',
            robot_base_frame='base_link',
            wheel_distance=0.5,
            wheel_radius=0.12
        )
        self.start_device_manager({
            'robot': {'publish_base_footprint': True},
            'Hokuyo URG-04LX-UG01': {'topic_name': '/scan'},
            'kinect color': {'topic_name': '/image_color'},
            'kinect range': {'topic_name': '/image_range'},
            'inertial_unit+accelerometer+gyro': {'frame_id': 'imu_link', 'topic_name': '/imu'}
        })
        

        self.names = ["head_2_joint",      "head_1_joint",      "torso_lift_joint",  "arm_right_1_joint",
                                "arm_right_2_joint", "arm_right_3_joint", "arm_right_4_joint", "arm_right_5_joint",
                                "arm_right_6_joint", "arm_right_7_joint", "arm_left_1_joint",  "arm_left_2_joint",
                                "arm_left_3_joint",  "arm_left_4_joint",  "arm_left_5_joint",  "arm_left_6_joint",
                                "arm_left_7_joint",  "wheel_left_joint",  "wheel_right_joint"]
        self.target_pos = [0.0, 0.0, # GIRO DEL CUELLO, Y GIRO DE CABEZA
                           0.0,      # TORSO
                           -1.11, 1.5, 3.00, 2.0, 0.0,     0.0,     0.00,  # BRAZO DERECHO
                           -1.11, 1.5, 3.00, 2.0, 0.0,     0.0,     0.00,  # BRAZO IZQUIERDO
                           float('inf'), float('inf')]   # RUEDA IZQ, RUEDA DER
        self.robot_parts=[]

        # configures and achieves the robot's position desired
        for i in range(0,19):
            self.robot_parts.append(self.robot.getDevice(self.names[i]))
            self.robot_parts[i].setVelocity(1.0)
            self.robot_parts[i].setPosition(self.target_pos[i])
        for i in range(17,19):
            self.robot_parts[i].setVelocity(0.0)
            self.robot_parts[i].setPosition(self.target_pos[i])
        self.service_node_vel_timestep = 32
        self.img_color = self.robot.getDevice("kinect color")
        self.img_color.enable(self.service_node_vel_timestep)
        self.img_range = self.robot.getDevice("kinect range")
        self.img_range.enable(self.service_node_vel_timestep)

        

def main(args=None):
    rclpy.init(args=args)
    driver = TiagoDriver(args=args)
    rclpy.spin(driver)
    rclpy.shutdown()


if __name__ == '__main__':
    main()
