#!/usr/bin/env python3

import rospy
import tf2_ros
from geometry_msgs.msg import TransformStamped
from sensor_msgs.msg import Imu
from scipy.spatial.transform import Rotation

right_sensor_rotation = Rotation.from_euler('xz', [0, 0], degrees=True).as_quat()
left_sensor_rotation = Rotation.from_euler('xz', [0, 0], degrees=True).as_quat()
class transform:

    def __init__(self):
        self.set_Imu_world_to_Imu_manipulator_transform = 0
        self.transformation = [0, 0, 0, 0]
    def quaternion_transform(self, q1, q2):
    # Convert the quaternions to rotation matrices
        r1 = Rotation.from_quat(q1)
        r2 = Rotation.from_quat(q2)

        # Calculate the rotation matrix that represents the transformation from q1 to q2
        r_transform = r2 * r1.inv()

        # Convert the rotation matrix back to a quaternion
        q_transform = r_transform.as_quat()

        self.transformation = q_transform

class imu:
    def __init__(self):
        imu_transform1 = transform()
        imu_transform2 = transform()
        self.set_Imu_world_to_Imu_manipulator_transform = 0
        self.transformation = [0, 0, 0, 0]
        self.tfBuffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tfBuffer)
        self.tf_broadcaster = tf2_ros.TransformBroadcaster()

        rospy.sleep(1)
        imu_topic1 = '/imu/data1'  # Replace with the actual IMU topic name
        imu_topic2 = '/imu/data2'  # Replace with the actual IMU topic name

        # Subscribe to the IMU topics and set the callback functions
        rospy.Subscriber(imu_topic1, Imu, self.imu_callback, callback_args=imu_transform1)
        rospy.Subscriber(imu_topic2, Imu, self.imu_callback, callback_args=imu_transform2)
        
    def imu_callback(self, msg, imu_transform):
        

        if not imu_transform.set_Imu_world_to_Imu_manipulator_transform:
            imu_robot_frame_rot = None
            if msg.header.frame_id == 'imu_frame_left':
                print("look up left")
                imu_transform.set_Imu_world_to_Imu_manipulator_transform = 1
                transform_available = False
                timeout_duration = rospy.Duration(4.0)
                timeout_time = rospy.Time.now() + timeout_duration
                while not transform_available and rospy.Time.now() < timeout_time:
                    try:
                        imu_robot_frame = self.tfBuffer.lookup_transform('world', 'sensor_link_left', rospy.Time()).transform
                        imu_robot_frame_rot = imu_robot_frame.rotation
                        self.translation = [imu_robot_frame.translation.x, imu_robot_frame.translation.y, imu_robot_frame.translation.z]
                        transform_available = True
                    except (tf2_ros.LookupException, tf2_ros.ExtrapolationException):
                        rospy.sleep(0.1)
            else:
                print("look up right")
                imu_transform.set_Imu_world_to_Imu_manipulator_transform = 2
                transform_available = False
                timeout_duration = rospy.Duration(4.0)
                timeout_time = rospy.Time.now() + timeout_duration
                while not transform_available and rospy.Time.now() < timeout_time:
                    try:
                        imu_robot_frame = self.tfBuffer.lookup_transform('world', 'sensor_link_right', rospy.Time()).transform
                        imu_robot_frame_rot = imu_robot_frame.rotation
                        self.translation = [imu_robot_frame.translation.x, imu_robot_frame.translation.y, imu_robot_frame.translation.z]
                        transform_available = True
                    except (tf2_ros.LookupException, tf2_ros.ExtrapolationException) as e:
                        rospy.sleep(0.1)
                        print(str(e))
            roll = msg.orientation.x
            pitch = msg.orientation.y
            yaw = msg.orientation.z
            quaternion = msg.orientation.w
            imu_world_frame = [roll, pitch, yaw, quaternion]
            imu_robot_frame_rot = [imu_robot_frame_rot.x, imu_robot_frame_rot.y, imu_robot_frame_rot.z, imu_robot_frame_rot.w]
            imu_transform.quaternion_transform(imu_world_frame, imu_robot_frame_rot)
        else:
            transform_msg = TransformStamped()
            transform_msg.header.stamp = msg.header.stamp
            
            if msg.header.frame_id == 'imu_frame_left':
                transform_msg.header.frame_id = 'world'
                transform_msg.child_frame_id = 'imu_frame_left1'
                transform_msg.transform.translation = self.tfBuffer.lookup_transform('world', 'sensor_link_left', rospy.Time()).transform.translation
                sensor_rotation_correction = left_sensor_rotation
            else:
                transform_msg.header.frame_id = 'world'
                transform_msg.child_frame_id = 'imu_frame_right1'
                transform_msg.transform.translation = self.tfBuffer.lookup_transform('world', 'sensor_link_right', rospy.Time()).transform.translation
                sensor_rotation_correction = right_sensor_rotation

            world_frame = [msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w]
            try:
                if msg.header.frame_id == 'imu_frame_right':
                    imu_quat = Rotation.from_quat(imu_transform.transformation)
                    world_quat = Rotation.from_quat(world_frame)
                    rotation_180_rollxy = Rotation.from_euler('y',180, degrees=True)
                    rotated_imu_quat = rotation_180_rollxy * imu_quat
                    robot_frame = (rotated_imu_quat * world_quat).as_quat()
                    # robot_frame = ((Rotation.from_quat(imu_transform.transformation)) * Rotation.from_quat(world_frame) * Rotation.from_quat([0.0, 0.0, 0.0, 0.0])).as_quat()
                else:
                    robot_frame = ((Rotation.from_quat(imu_transform.transformation)) * Rotation.from_quat(world_frame)).as_quat()

                transform_msg.transform.rotation.x = robot_frame[0]
                transform_msg.transform.rotation.y = robot_frame[1]
                transform_msg.transform.rotation.z = robot_frame[2]
                transform_msg.transform.rotation.w = robot_frame[3]

                self.tf_broadcaster.sendTransform(transform_msg)
            except:
                rospy.logwarn("Transformation failed")
                imu_transform.set_Imu_world_to_Imu_manipulator_transform = 0

if __name__ == '__main__':
    rospy.init_node('static_transform_publisher')

    transform = imu()  # Initialize the Transform class
    rospy.spin()  # Start ROS node
