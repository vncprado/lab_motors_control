
#ifndef OMX_MOVE_TO_LOCATION
#define OMX_MOVE_TO_LOCATION

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
#define PATH_TIME 0.5
#define NUM_OF_JOINT_AND_TOOL 5


class KinematicsSolver
{
 public:
  KinematicsSolver();
 // ~KinematicsSolver();


bool setTaskSpacePathFromPresentPositionOnly(std::vector<double> kinematics_pose, double path_time);
bool setJointSpacePathFromPresent(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time);
bool setJointSpacePath(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time);
void moveToLocation(std::string location);
bool setToolControl(std::vector<double> joint_angle);
std::vector<double> getPresentJointAngle();
  ros::NodeHandle node_handle_;

  // update

 private:
  /*****************************************************************************
  ** ROS NodeHandle
  *****************************************************************************/
  //ros::NodeHandle node_handle_;
  tf2_ros::Buffer tfBuffer_;
  tf2_ros::TransformListener tfListener_;
  ros::NodeHandle priv_node_handle_;
    ros::Subscriber open_manipulator_joint_states_sub_;
    void jointStatesCallback(const sensor_msgs::JointState::ConstPtr &msg);

  /*****************************************************************************
  ** Variables
  *****************************************************************************/
  std::vector<double> present_joint_angle_;
  std::vector<double> present_kinematic_position_;

  /*****************************************************************************
  ** Init Functions
  *****************************************************************************/
  void initSubscriber();
  void initClient();

  /*****************************************************************************
  ** ROS Subscribers, Callback Functions and Relevant Functions
  *****************************************************************************/
//   ros::Subscriber joint_states_sub_;
//   ros::Subscriber kinematics_pose_sub_;

//   void jointStatesCallback(const sensor_msgs::JointState::ConstPtr &msg);
//   void kinematicsPoseCallback(const open_manipulator_msgs::KinematicsPose::ConstPtr &msg);

  /*****************************************************************************
  ** ROS Clients and Callback Functions
  *****************************************************************************/
//   ros::ServiceClient goal_joint_space_path_client_;
//   ros::ServiceClient goal_joint_space_path_from_present_client_;
//   ros::ServiceClient goal_task_space_path_from_present_position_only_client_;
//   ros::ServiceClient goal_tool_control_client_;

//   bool setJointSpacePath(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time);
//   bool setJointSpacePathFromPresent(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time);
//   bool setTaskSpacePathFromPresentPositionOnly(std::vector<double> kinematics_pose, double path_time);
//   bool setToolControl(std::vector<double> joint_angle);

  /*****************************************************************************
  ** Others
  *****************************************************************************/
//   struct termios oldt_;

//   void disableWaitingForEnter(void);
//   void restoreTerminalSettings(void);
//   std::vector<double> getPresentJointAngle();
//   std::vector<double> getPresentKinematicsPose();
};

#endif //OMX_MOVE_TO_LOCATION
