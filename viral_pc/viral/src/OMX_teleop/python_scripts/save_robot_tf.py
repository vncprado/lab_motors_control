#!/usr/bin/env python3

import rospy
import tf2_ros
from geometry_msgs.msg import TransformStamped
import csv

if __name__ == '__main__':
    rospy.init_node('publish_tf')
    tfBuffer = tf2_ros.Buffer()
    tf_listener = tf2_ros.TransformListener(tfBuffer)
    file_path = '/home/bioinlab/Documents/real-OMX-bioin-tacto-grasp-and-lift/bags/Object2/tf/robot_O2_T4_A0_2024-01-09-12-37-55.csv'
    
    with open(file_path, 'w') as file:
        csv_writer = csv.writer(file)
        header = ['time',
                   'end-effector_position_x', 'end-effector_position_y', 'end-effector_position_z', 
                  'end-effector_orientation_x', 'end-effector_orientation_y', 'end-effector_orientation_z', 'end-effector_orientation_w',
                  'imu_left_orientation_x','imu_left_orientation_y','imu_left_orientation_z','imu_left_orientation_w',
                  'imu_right_orientation_x','imu_right_orientation_y','imu_right_orientation_z','imu_right_orientation_w',
                  ]
        csv_writer.writerow(header)
        
        rate = rospy.Rate(10)  # Adjust the rate according to your requirements
        while not rospy.is_shutdown():
            try:
                ee_transform = tfBuffer.lookup_transform('world', 'gripper_link', rospy.Time())
                ee_translation = ee_transform.transform.translation
                ee_rotation = ee_transform.transform.rotation
                print("line29")
                imu_left_transform = tfBuffer.lookup_transform('world', 'imu_frame_left1', rospy.Time())
                imu_left_rotation = imu_left_transform.transform.rotation
                print("line32")

                imu_right_transform = tfBuffer.lookup_transform('world', 'imu_frame_right1', rospy.Time())
                imu_right_rotation = imu_right_transform.transform.rotation
                print("line36")

                
                
                csv_writer.writerow([ee_transform.header.stamp.to_sec(),
                                     ee_translation.x, ee_translation.y, ee_translation.z,
                                     ee_rotation.x, ee_rotation.y, ee_rotation.z, ee_rotation.w,
                                     imu_left_rotation.x, imu_left_rotation.y, imu_left_rotation.z, imu_left_rotation.w,
                                     imu_right_rotation.x, imu_right_rotation.y, imu_right_rotation.z, imu_right_rotation.w
                                     ])
                

            except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                rospy.logwarn("Transform EE lookup failed.")
                
            rate.sleep()
