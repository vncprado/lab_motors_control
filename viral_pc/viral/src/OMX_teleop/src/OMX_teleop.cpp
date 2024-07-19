/*********************************************************************
 * Software License Agreement (BSD License)
 *
 *  Copyright (c) 2012, Willow Garage, Inc.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of Willow Garage nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *********************************************************************/

/* Author: Sachin Chitta, Michael Lautman*/

#include <ros/ros.h>

// MoveIt
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>

#include <geometry_msgs/TransformStamped.h>
#include <std_msgs/Float64MultiArray.h>
#include <math.h>

#define DELTA 0.01
#define DELTA_PITCH 10.0

int main(int argc, char** argv)
{
  ros::init(argc, argv, "OMX_teleop");
  // ros::AsyncSpinner spinner(1);
  // spinner.start();

  ros::NodeHandle node;
  
  static tf2_ros::TransformBroadcaster br;

  tf2_ros::Buffer tfBuffer;
  tf2_ros::TransformListener tfListener(tfBuffer);
    ros::NodeHandle nh;
    ros::Publisher end_effector_back_joints_pub = nh.advertise<std_msgs::Float64MultiArray>("end_effector_back_joints", 1000);
  ros::Rate rate(10.0);

  while (node.ok()){


    // Broadcast frames with respective distances from the original
    tf2_ros::TransformBroadcaster tfBroadcaster;

      // Broadcast end_effector_center
    // creating an empty TF to prevent repetitive instantiation.
      geometry_msgs::TransformStamped transform_zero;
      transform_zero.header.frame_id = "end_effector_link";
      transform_zero.transform.translation.x = 0.0;
      transform_zero.transform.translation.y = 0.0;
      transform_zero.transform.translation.z = 0.0;
      transform_zero.transform.rotation.x = 0.0;
      transform_zero.transform.rotation.y = 0.0;
      transform_zero.transform.rotation.z = 0.0;
      transform_zero.transform.rotation.w = 1;

      transform_zero.header.stamp = ros::Time::now();

    // Broadcast end_effector_back (1mm to the back)
    // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    geometry_msgs::TransformStamped transformBack = transform_zero;
    transformBack.child_frame_id = "end_effector_back";
    transformBack.transform.translation.x -= DELTA;
    tfBroadcaster.sendTransform(transformBack);


    // Broadcast end_effector_front (1mm to the front)
    // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    geometry_msgs::TransformStamped transformFront = transform_zero;
    transformFront.child_frame_id = "end_effector_front";
    transformFront.transform.translation.x += DELTA;
    tfBroadcaster.sendTransform(transformFront);

    // creating an updated timestamp
//      transform_zero.header.stamp = ros::Time::now();

    // Broadcast end_effector_left (1mm to the left)
     geometry_msgs::TransformStamped transformStamped;
     try{
         transformStamped = tfBuffer.lookupTransform("world", "end_effector_link", ros::Time(0));
     }
     catch (tf2::TransformException &ex) {
         ROS_WARN("%s",ex.what());
         ros::Duration(1.0).sleep();
         continue;
     }

    //  convert to catesian add angle to theta/minus angle change back to polar?
    //need to account for orientation changes
   double delta_theta_degree =  2;
   double radius = sqrt(pow(transformStamped.transform.translation.y,2) + pow(transformStamped.transform.translation.x,2));
   double thetaLeft = atan(transformStamped.transform.translation.y/transformStamped.transform.translation.x) + delta_theta_degree * M_PI / 180.0;
     geometry_msgs::TransformStamped transformLeft = transformStamped;
     transformLeft.child_frame_id = "end_effector_left";
     transformLeft.transform.translation.x = radius * cos(thetaLeft);
     transformLeft.transform.translation.y = radius * sin(thetaLeft);


     // creating an updated timestamp
     transform_zero.header.stamp = ros::Time::now();
      tf2::Quaternion quatPitchLeft;
     // Broadcast end_effector_pitch_up (1degree pitch up)
     quatPitchLeft.setRPY(0.0, 0.0, thetaLeft); // negative pitch
    //  tf2::Quaternion RobotQuat(
    //          transformLeft.transform.rotation.x,
    //          transformLeft.transform.rotation.y,
    //          transformLeft.transform.rotation.z,
    //          transformLeft.transform.rotation.w);
    //  tf2::Quaternion RobotQuatNew =  quatPitch * RobotQuat ;

     transformLeft.transform.rotation.x = quatPitchLeft.x();
     transformLeft.transform.rotation.y = quatPitchLeft.y();
     transformLeft.transform.rotation.z = quatPitchLeft.z();
     transformLeft.transform.rotation.w = quatPitchLeft.w();
   tfBroadcaster.sendTransform(transformLeft);

         geometry_msgs::TransformStamped transformRight = transformStamped;

   double thetaRight = atan(transformStamped.transform.translation.y/transformStamped.transform.translation.x) - delta_theta_degree * M_PI / 180.0;
     transformRight.child_frame_id = "end_effector_right";
     transformRight.transform.translation.x = radius * cos(thetaRight);
     transformRight.transform.translation.y = radius * sin(thetaRight);


     // creating an updated timestamp
      tf2::Quaternion quatPitchRight;
     // Broadcast end_effector_pitch_up (1degree pitch up)
     quatPitchRight.setRPY(0.0, 0.0, thetaRight); // negative pitch
    //  tf2::Quaternion RobotQuat(
    //          transformLeft.transform.rotation.x,
    //          transformLeft.transform.rotation.y,
    //          transformLeft.transform.rotation.z,
    //          transformLeft.transform.rotation.w);
    //  tf2::Quaternion RobotQuatNew =  quatPitch * RobotQuat ;
     transformRight.transform.rotation.x = quatPitchRight.x();
     transformRight.transform.rotation.y = quatPitchRight.y();
     transformRight.transform.rotation.z = quatPitchRight.z();
     transformRight.transform.rotation.w = quatPitchRight.w();
   tfBroadcaster.sendTransform(transformRight);

//    // Broadcast end_effector_right (1mm to the right)
//    // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
//    geometry_msgs::TransformStamped transformRight = transform_zero;
//    transformRight.child_frame_id = "end_effector_right";
//    transformRight.header.frame_id = "end_effector_link";
//    transformRight.transform.translation.y -= DELTA;
//    tfBroadcaster.sendTransform(transformRight);

    // Broadcast end_effector_up (1mm upward)
    // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    geometry_msgs::TransformStamped transformUp = transform_zero;
    transformUp.child_frame_id = "end_effector_up";
    transformUp.header.frame_id = "end_effector_link";
    transformUp.transform.translation.x = 0.0;
    transformUp.transform.translation.y = 0.0;
    transformUp.transform.translation.z = DELTA;
    transformUp.transform.rotation.x = 0.0;
    transformUp.transform.rotation.y = 0.0;
    transformUp.transform.rotation.z = 0.0;
    transformUp.transform.rotation.w = 1;
    tfBroadcaster.sendTransform(transformUp);

      // Broadcast end_effector_down (1mm downward)
      // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    geometry_msgs::TransformStamped transformDown = transform_zero;
    transformDown.child_frame_id = "end_effector_down";
    transformDown.transform.translation.z -= DELTA;
    tfBroadcaster.sendTransform(transformDown);

      // Calculating the pitch angle (DELTA_PITCH)
      // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    double pitch_angle = DELTA_PITCH;  // degrees
    double pitch_angle_rad = pitch_angle * M_PI / 180.0;
    // Set the quaternion pitch up

      //      // Set the quaternion pitch up
      tf2::Quaternion quat;
    // Broadcast end_effector_pitch_up (1degree pitch up)
    // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    geometry_msgs::TransformStamped transformPitchUp = transform_zero;
    transformPitchUp.child_frame_id = "end_effector_pitch_up";
    quat.setRPY(0.0, -pitch_angle_rad, 0.0); // negative pitch
    transformPitchUp.transform.rotation.x = quat.x();
    transformPitchUp.transform.rotation.y = quat.y();
    transformPitchUp.transform.rotation.z = quat.z();
    transformPitchUp.transform.rotation.w = quat.w();
    tfBroadcaster.sendTransform(transformPitchUp);

    // Broadcast end_effector_pitch_down (1degree pitch down)
    // creating an updated timestamp
//    transform_zero.header.stamp = ros::Time::now();
    geometry_msgs::TransformStamped transformPitchDown = transform_zero;
    transformPitchDown.child_frame_id = "end_effector_pitch_down";
    quat.setRPY(0.0, pitch_angle_rad, 0.0); 
    transformPitchDown.transform.rotation.x = quat.x();
    transformPitchDown.transform.rotation.y = quat.y();
    transformPitchDown.transform.rotation.z = quat.z();
    transformPitchDown.transform.rotation.w = quat.w();
    // transformPitchDown.transform.translation.z -= 0.1;
    tfBroadcaster.sendTransform(transformPitchDown);
//    ros::spinOnce();
    rate.sleep();
  }
  ros::shutdown();
  return 0;
}