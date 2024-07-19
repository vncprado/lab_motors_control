#include "OMX_teleop/OMX_moveToLocation.h"

void printText()
{
	printf("\n");
	printf("---------------------------\n");
	printf("Control Your OpenManipulator!\n");
	printf("---------------------------\n");
	printf("k : end_effector pitch down/decrease(--) joint 4 angle\n");
	printf("o : end_effector pitch up/increase(++) joint 4 angle\n");
	printf("w : end_effector front\n");
	printf("s : end_effector back\n");
	printf("a : end_effector left\n");
	printf("d : end_effector right\n");
	printf("z : end_effector up\n");
	printf("x : end_effector up\n");
	printf("\n");
	printf("g : gripper open\n");
	printf("f : gripper close\n");
	printf("       \n");
	printf("1 : init pose\n");
	printf("2 : home pose\n");
	printf("       \n");
	printf("q to quit\n");
	printf("---------------------------\n");
}

ros::ServiceClient goal_joint_space_path_from_present_client_;
ros::ServiceClient goal_joint_space_path_client_;
ros::ServiceClient goal_task_space_path_from_present_position_only_client_;
ros::ServiceClient goal_tool_control_client_;

KinematicsSolver::KinematicsSolver()
		: tfListener_(tfBuffer_),
			priv_node_handle_("~"),
			node_handle_("")
			{
  open_manipulator_joint_states_sub_ = node_handle_.subscribe("joint_states", 10, &KinematicsSolver::jointStatesCallback, this);
  present_joint_angle_.resize(NUM_OF_JOINT_AND_TOOL);

			};

void KinematicsSolver::jointStatesCallback(const sensor_msgs::JointState::ConstPtr &msg)
{

  std::vector<double> temp_angle;
  temp_angle.resize(NUM_OF_JOINT_AND_TOOL);
  for(int i = 0; i < msg->name.size(); i ++)
  {
     if(!msg->name.at(i).compare("joint1"))  temp_angle.at(0) = (msg->position.at(i));
     else if(!msg->name.at(i).compare("joint2"))  temp_angle.at(1) = (msg->position.at(i));
     else if(!msg->name.at(i).compare("joint3"))  temp_angle.at(2) = (msg->position.at(i));
     else if(!msg->name.at(i).compare("joint4"))  temp_angle.at(3) = (msg->position.at(i));
    if(!msg->name.at(i).compare("gripper"))  {temp_angle.at(4) = (msg->position.at(i));

		}
  }
  present_joint_angle_ = temp_angle;
}

std::vector<double> KinematicsSolver::getPresentJointAngle()
{
  return present_joint_angle_;
}

  bool KinematicsSolver::setToolControl(std::vector<double> joint_angle)
  {
    open_manipulator_msgs::SetJointPosition srv;
    srv.request.joint_position.joint_name.push_back("gripper");
    srv.request.joint_position.position = joint_angle;

    if(goal_tool_control_client_.call(srv))
    {
      return srv.response.is_planned;
    }
    return false;
  }

bool KinematicsSolver::setJointSpacePathFromPresent(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time)
{
	open_manipulator_msgs::SetJointPosition srv;
	srv.request.joint_position.joint_name = joint_name;
	srv.request.joint_position.position = joint_angle;
	srv.request.path_time = path_time;

	if (goal_joint_space_path_from_present_client_.call(srv))
	{
		return srv.response.is_planned;
	}
	return false;
}
bool KinematicsSolver::setJointSpacePath(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time)
{
	open_manipulator_msgs::SetJointPosition srv;
	srv.request.joint_position.joint_name = joint_name;
	srv.request.joint_position.position = joint_angle;
	srv.request.path_time = path_time;

	if (goal_joint_space_path_client_.call(srv))
	{
		return srv.response.is_planned;
	}
	return false;
}
bool KinematicsSolver::setTaskSpacePathFromPresentPositionOnly(std::vector<double> kinematics_pose, double path_time)
{
	open_manipulator_msgs::SetKinematicsPose srv;
	srv.request.planning_group = priv_node_handle_.param<std::string>("end_effector_name", "gripper");
	srv.request.kinematics_pose.pose.position.x = kinematics_pose.at(0);
	srv.request.kinematics_pose.pose.position.y = kinematics_pose.at(1);
	srv.request.kinematics_pose.pose.position.z = kinematics_pose.at(2);
	srv.request.path_time = path_time;

	if (goal_task_space_path_from_present_position_only_client_.call(srv))
	{
		return srv.response.is_planned;
	}
	return false;
}

void KinematicsSolver::moveToLocation(std::string location)
{
			std::vector<double> goalPose;
		goalPose.resize(3, 0.0);
		geometry_msgs::TransformStamped transformStamped;
	geometry_msgs::TransformStamped end_effector_transform;
	geometry_msgs::TransformStamped target_transform;
			end_effector_transform = tfBuffer_.lookupTransform("world", "end_effector_link", ros::Time(0));
			target_transform = tfBuffer_.lookupTransform("world", location, ros::Time(0));
			double target_x = target_transform.transform.translation.x - end_effector_transform.transform.translation.x;
			double target_y = target_transform.transform.translation.y - end_effector_transform.transform.translation.y;
			double target_z = target_transform.transform.translation.z - end_effector_transform.transform.translation.z;
			goalPose.at(0) = target_x;
			goalPose.at(1) = target_y;
			goalPose.at(2) = target_z;
			ROS_INFO("\ngoalPose: %f, %f, %f\n", goalPose.at(0), goalPose.at(1), goalPose.at(2));

			setTaskSpacePathFromPresentPositionOnly(goalPose, PATH_TIME);
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "OMX_moveToLocation");

	// An async spinner to receive the planned kinematics
	ros::AsyncSpinner spinner(1);
	spinner.start();
	ros::NodeHandle node;

	goal_joint_space_path_from_present_client_ = node.serviceClient<open_manipulator_msgs::SetJointPosition>("goal_joint_space_path_from_present");
	goal_joint_space_path_client_ = node.serviceClient<open_manipulator_msgs::SetJointPosition>("goal_joint_space_path");
	goal_task_space_path_from_present_position_only_client_ = node.serviceClient<open_manipulator_msgs::SetKinematicsPose>("goal_task_space_path_from_present_position_only");
  goal_tool_control_client_ = node.serviceClient<open_manipulator_msgs::SetJointPosition>("goal_tool_control");
   ros::Publisher robot_instruction = node.advertise<std_msgs::String>("robot_instruction", 1000);
	std_msgs::String robot_instruction_msg;
	static tf2_ros::TransformBroadcaster br;
	tf2_ros::Buffer tfBuffer;
	tf2_ros::TransformListener tfListener(tfBuffer);
	geometry_msgs::TransformStamped transformStamped;
	geometry_msgs::TransformStamped end_effector_transform;
	geometry_msgs::TransformStamped target_transform;

	KinematicsSolver kinematics_solver;

	struct termios newt;
	struct termios oldt_;
	tcgetattr(0, &oldt_);							/* Save terminal settings */
	newt = oldt_;											/* Init new settings */
	newt.c_lflag &= ~(ICANON | ECHO); /* Change settings */
	tcsetattr(0, TCSANOW, &newt);			/* Apply settings */
	char ch;
	  std::vector<double> goalPose;  goalPose.resize(3, 0.0);
	printText();

	// Update the planning scene with the new joint positions
	while (ros::ok() && (ch = std::getchar()) != 'q')
	{
		ros::spinOnce();
		printText();
		ros::spinOnce();

		std::vector<double> goalPose;
		goalPose.resize(3, 0.0);

  if (ch == 'k' || ch == 'K')
  {
	robot_instruction_msg.data = 'k';
    printf("input : k \tdecrease(--) joint 4 angle\n");
    std::vector<std::string> joint_name;
		std::vector<double> goalJoint; goalJoint.resize(NUM_OF_JOINT, 0.0);

    joint_name.push_back("joint1");
    joint_name.push_back("joint2");
    joint_name.push_back("joint3"); goalJoint.at(3) = -JOINT_DELTA;
    joint_name.push_back("joint4");
    kinematics_solver.setJointSpacePathFromPresent(joint_name, goalJoint, PATH_TIME);
  }
  else if (ch == 'o' || ch == 'O')
  { 
		robot_instruction_msg.data = 'o';
 
	std::vector<double> goalJoint; goalJoint.resize(NUM_OF_JOINT, 0.0);

    printf("input : o \tincrease(++) joint 4 angle\n");
    std::vector<std::string> joint_name;
    joint_name.push_back("joint1");
    joint_name.push_back("joint2");
    joint_name.push_back("joint3");
    joint_name.push_back("joint4"); goalJoint.at(3) = JOINT_DELTA;
    kinematics_solver.setJointSpacePathFromPresent(joint_name, goalJoint, PATH_TIME);
  }
	else	if (ch == 'w' || ch == 'W')
		{
				robot_instruction_msg.data = 'w';

			printf("input : w \tend_effector front\n");
			kinematics_solver.moveToLocation("end_effector_front");
		}	
		else if (ch == 's' || ch == 'S')
		{	robot_instruction_msg.data = 's';

			printf("input : s \tend_effector back\n");
			kinematics_solver.moveToLocation("end_effector_back");
		}

				else if (ch == 'z' || ch == 'Z')
		{
			robot_instruction_msg.data = 'z';
			printf("input : z \tend_effector up");
									kinematics_solver.moveToLocation("end_effector_up");
		}
		else if (ch == 'x' || ch == 'X')
		{
			robot_instruction_msg.data = 'x';
			printf("input : x \tend_effector down");
			kinematics_solver.moveToLocation("end_effector_down");
		}


		else if (ch == 'a' || ch == 'A')
		{  /* std::vector<double> goalJoint; goalJoint.resize(NUM_OF_JOINT, 0.0);


 SETTING JOINT DIRECTLY
			printf("end_effector left");
			//transformStamped = tfBuffer.lookupTransform("world", "end_effector_left", ros::Time(0));
    printf("input : y \tincrease(++) joint 1 angle\n");
    std::vector<std::string> joint_name;
    joint_name.push_back("joint1"); goalJoint.at(0) = JOINT_DELTA;
    joint_name.push_back("joint2");
    joint_name.push_back("joint3");
    joint_name.push_back("joint4");
    kinematics_solver.setJointSpacePathFromPresent(joint_name, goalJoint, PATH_TIME);
*/
			robot_instruction_msg.data = 'a';
			printf("input : a \tend_effector left");
			kinematics_solver.moveToLocation("end_effector_left");

		}
		else if (ch == 'D' || ch == 'd')
		{  /*std::vector<double> goalJoint; goalJoint.resize(NUM_OF_JOINT, 0.0);

			//transformStamped = tfBuffer.lookupTransform("world", "end_effector_right", ros::Time(0));


  SETTING JOINT DIRECTLY
    printf("input : h \tdecrease(--) joint 1 angle\n");
    std::vector<std::string> joint_name;
    joint_name.push_back("joint1"); goalJoint.at(0) = -JOINT_DELTA;
    joint_name.push_back("joint2");
    joint_name.push_back("joint3");
    joint_name.push_back("joint4");
    kinematics_solver.setJointSpacePathFromPresent(joint_name, goalJoint, PATH_TIME);
*/robot_instruction_msg.data = 'd';
			printf("input : d \tend_effector right");

			kinematics_solver.moveToLocation("end_effector_right");

		}

		else if (ch == 'F' || ch == 'f')
		{
			robot_instruction_msg.data = 'f';
			printf("input : f \tclosing gripper");
			//printf("Present Kinematics Position X: %.3lf ", kinematics_solver.getPresentJointAngle().at(4));
			    std::vector<double> joint_angle;
    joint_angle.push_back(kinematics_solver.getPresentJointAngle().at(4) - 0.001);
    kinematics_solver.setToolControl(joint_angle);
		}

		else if (ch == 'g' || ch == 'G')
		{
			robot_instruction_msg.data = 'g';
			printf("input : g \tOpening gripper");
			// printf("Present Kinematics Position X: %.3lf ", kinematics_solver.getPresentJointAngle().at(4));
			    std::vector<double> joint_angle;
			printf("%f", kinematics_solver.getPresentJointAngle().at(4));
    joint_angle.push_back(kinematics_solver.getPresentJointAngle().at(4) + 	0.001);
    kinematics_solver.setToolControl(joint_angle);
			// kinematics_solver.setGripperJointVal(-0.0002);
		}
		else if (ch == '2')
		{
			robot_instruction_msg.data = '2';
			printf("input : 2 \thome pose\n");
			std::vector<std::string> joint_name;
			std::vector<double> joint_angle;
			double path_time = 2.0;
			
			std::vector<double> tool_angle;
			tool_angle.push_back(0.016);
    kinematics_solver.setToolControl(tool_angle);
		 ros::Duration(0.5).sleep();
			joint_name.push_back("joint1");
			joint_angle.push_back(0.0);
			joint_name.push_back("joint2");
			joint_angle.push_back(0.124);
			joint_name.push_back("joint3");
			joint_angle.push_back(0.457);
			joint_name.push_back("joint4");
			joint_angle.push_back(0.818);
			kinematics_solver.setJointSpacePath(joint_name, joint_angle, path_time);

		}
		else if (ch == '1' || ch == '1')
		{robot_instruction_msg.data = '1';
			printf("input : 1 \tinit pose\n");
			std::vector<std::string> joint_name;
			std::vector<double> joint_angle;
			double path_time = 2.0;
			joint_name.push_back("joint1");
			joint_angle.push_back(0.0);
			joint_name.push_back("joint2");
			joint_angle.push_back(0.0);
			joint_name.push_back("joint3");
			joint_angle.push_back(0.0);
			joint_name.push_back("joint4");
			joint_angle.push_back(0.0);
			kinematics_solver.setJointSpacePath(joint_name, joint_angle, path_time);
		}
				else if (ch == '3')
		{
			robot_instruction_msg.data = '3';
			printf("input : 2 \tend pose\n");
			std::vector<std::string> joint_name;
			std::vector<double> joint_angle;
			double path_time = 2.0;

						    std::vector<double> tool_angle;
    tool_angle.push_back(0.016);
    kinematics_solver.setToolControl(tool_angle);
		 ros::Duration(0.5).sleep();
			joint_name.push_back("joint1");
			joint_angle.push_back(-0.229);
			joint_name.push_back("joint2");
			joint_angle.push_back(0.161);
			joint_name.push_back("joint3");
			joint_angle.push_back(0.318);
			joint_name.push_back("joint4");
			joint_angle.push_back(1.132);

			kinematics_solver.setJointSpacePath(joint_name, joint_angle, path_time);

		}
		robot_instruction.publish(robot_instruction_msg);
	}
	spinner.stop();
	tcsetattr(0, TCSANOW, &oldt_); /* Apply saved settings */
}
