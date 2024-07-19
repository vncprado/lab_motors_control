#include <ros/ros.h>
#include <termios.h>
#include "std_msgs/String.h"
// MoveIt
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

#include <tf2_ros/transform_listener.h>
#include <tf2_ros/transform_broadcaster.h>

#include <geometry_msgs/TransformStamped.h>
#include <geometry_msgs/Pose.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include "open_manipulator_teleop/open_manipulator_teleop_keyboard.h"

#include "ros/ros.h"
#include "OMX_teleop/RobotInstruction.h"

#define PATH_TIME 0.5
#define NUM_OF_JOINT_AND_TOOL 5

class SetRobotPosition
{
public:
  SetRobotPosition();
  // ~KinematicsSolver();
  ros::NodeHandle node_handle_;
  bool setToolControl(std::vector<double> joint_angle);
  bool setJointSpacePathFromPresent(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time);
  //  static void charServiceCallbackStatic(OMX_teleop::RobotInstruction::Request &req,
  //                                         OMX_teleop::RobotInstruction::Response &res);

   //static SetRobotPosition *instance_;  // Static member variable to hold an instance of the class
    bool charServiceCallback(OMX_teleop::RobotInstruction::Request &req,
                             OMX_teleop::RobotInstruction::Response &res);
private:
  /*****************************************************************************
  ** ROS NodeHandle
  *****************************************************************************/
  // ros::NodeHandle node_handle_;
  tf2_ros::Buffer tfBuffer_;
  tf2_ros::TransformListener tfListener_;
  ros::NodeHandle priv_node_handle_;
  ros::Subscriber open_manipulator_joint_states_sub_;
  void jointStatesCallback(const sensor_msgs::JointState::ConstPtr &msg);
  ros::ServiceClient goal_tool_control_client_;
  ros::ServiceClient goal_joint_space_path_from_present_client_;
  ros::ServiceClient goal_task_space_path_from_present_position_only_client_;
  ros::ServiceClient goal_joint_space_path_client_;

  void moveToLocation(std::string location);
  bool setTaskSpacePathFromPresentPositionOnly(std::vector<double> kinematics_pose, double path_time);
  bool setJointSpacePath(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time);



  /*****************************************************************************
  ** Variables
  *****************************************************************************/
  std::vector<double> present_joint_angle_;
  std::vector<double> present_kinematic_position_;
};
