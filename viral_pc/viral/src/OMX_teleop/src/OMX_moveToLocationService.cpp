#include "OMX_teleop/OMX_moveToLocationService.h"

SetRobotPosition::SetRobotPosition()
	: tfListener_(tfBuffer_),
	  priv_node_handle_("~"),
	  node_handle_("")
{
	open_manipulator_joint_states_sub_ = node_handle_.subscribe("joint_states", 10, &SetRobotPosition::jointStatesCallback, this);
	present_joint_angle_.resize(NUM_OF_JOINT_AND_TOOL);
	goal_joint_space_path_from_present_client_ = node_handle_.serviceClient<open_manipulator_msgs::SetJointPosition>("goal_joint_space_path_from_present");
	goal_tool_control_client_ = node_handle_.serviceClient<open_manipulator_msgs::SetJointPosition>("goal_tool_control");
	goal_task_space_path_from_present_position_only_client_ = node_handle_.serviceClient<open_manipulator_msgs::SetKinematicsPose>("goal_task_space_path_from_present_position_only");
	goal_joint_space_path_client_ = node_handle_.serviceClient<open_manipulator_msgs::SetJointPosition>("goal_joint_space_path");
};
bool SetRobotPosition::setTaskSpacePathFromPresentPositionOnly(std::vector<double> kinematics_pose, double path_time)
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
bool SetRobotPosition::setJointSpacePath(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time)
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
void SetRobotPosition::jointStatesCallback(const sensor_msgs::JointState::ConstPtr &msg)
{

	std::vector<double> temp_angle;
	temp_angle.resize(NUM_OF_JOINT_AND_TOOL);
	for (int i = 0; i < msg->name.size(); i++)
	{
		if (!msg->name.at(i).compare("joint1"))
			temp_angle.at(0) = (msg->position.at(i));
		else if (!msg->name.at(i).compare("joint2"))
			temp_angle.at(1) = (msg->position.at(i));
		else if (!msg->name.at(i).compare("joint3"))
			temp_angle.at(2) = (msg->position.at(i));
		else if (!msg->name.at(i).compare("joint4"))
			temp_angle.at(3) = (msg->position.at(i));
		if (!msg->name.at(i).compare("gripper"))
		{
			temp_angle.at(4) = (msg->position.at(i));
		}
	}
	present_joint_angle_ = temp_angle;
}

bool SetRobotPosition::setToolControl(std::vector<double> joint_angle)
{
	open_manipulator_msgs::SetJointPosition srv;
	srv.request.joint_position.joint_name.push_back("gripper");
	srv.request.joint_position.position = joint_angle;

	if (goal_tool_control_client_.call(srv))
	{
		return srv.response.is_planned;
	}
	return false;
}
bool SetRobotPosition::setJointSpacePathFromPresent(std::vector<std::string> joint_name, std::vector<double> joint_angle, double path_time)
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
void SetRobotPosition::moveToLocation(std::string location)
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
// void SetRobotPosition::charServiceCallbackStatic(OMX_teleop::RobotInstruction::Request &req,
// 												 OMX_teleop::RobotInstruction::Response &res)
// {
// 	if (instance_)
// 	{
// 		        res.response_message = instance_->charServiceCallback(req, res);  // Ensure the return value is captured
// 	}
// }

bool SetRobotPosition::charServiceCallback(OMX_teleop::RobotInstruction::Request &req,
										   OMX_teleop::RobotInstruction::Response &res)
{ROS_INFO("Service callback started.");
	// Process the received character
	std::string input_string = req.input_char;
	char ch = input_string[0];
	printf("%s", input_string.c_str());
	if (ch == 'k' || ch == 'K')
	{
		printf("input : k \tdecrease(--) joint 4 angle\n");
		std::vector<std::string> joint_name;
		std::vector<double> goalJoint;
		goalJoint.resize(NUM_OF_JOINT, 0.0);

		joint_name.push_back("joint1");
		joint_name.push_back("joint2");
		joint_name.push_back("joint3");
		goalJoint.at(3) = -JOINT_DELTA;
		joint_name.push_back("joint4");
		setJointSpacePathFromPresent(joint_name, goalJoint, PATH_TIME);
	}
	else if (ch == 'o' || ch == 'O')
	{

		std::vector<double> goalJoint;
		goalJoint.resize(NUM_OF_JOINT, 0.0);



		printf("input : o \tincrease(++) joint 4 angle\n");
		std::vector<std::string> joint_name;
		joint_name.push_back("joint1");
		joint_name.push_back("joint2");
		joint_name.push_back("joint3");
		goalJoint.at(3) = JOINT_DELTA;
		joint_name.push_back("joint4");
		setJointSpacePathFromPresent(joint_name, goalJoint, PATH_TIME);

	}
	else if (ch == 'w' || ch == 'W')
	{

		printf("input : w \tend_effector front\n");
		moveToLocation("end_effector_front");
				ros::Duration(PATH_TIME).sleep();


	}
	else if (ch == 's' || ch == 'S')

	{
		printf("input : s \tend_effector back\n");
		moveToLocation("end_effector_back");
						ros::Duration(PATH_TIME).sleep();

	}

	else if (ch == 'z' || ch == 'Z')
	{
		printf("input : z \tend_effector up");
		moveToLocation("end_effector_up");
						ros::Duration(PATH_TIME).sleep();

	}
	else if (ch == 'x' || ch == 'X')
	{
		printf("input : x \tend_effector down");
		moveToLocation("end_effector_down");
						ros::Duration(PATH_TIME).sleep();

	}

	else if (ch == 'a' || ch == 'A')
	{
		printf("input : a \tend_effector left");
		moveToLocation("end_effector_left");
		ros::Duration(PATH_TIME).sleep();

	}

	else if (ch == 'D' || ch == 'd')
	{
		printf("input : d \tend_effector right");

		moveToLocation("end_effector_right");
		ros::Duration(PATH_TIME).sleep();

	}

	else if (ch == 'F' || ch == 'f')
	{
		printf("input : f \tclosing gripper");
		// printf("Present Kinematics Position X: %.3lf ", kinematics_solver.getPresentJointAngle().at(4));
		std::vector<double> joint_angle;
		joint_angle.push_back(present_joint_angle_.at(4) - 0.001);
		setToolControl(joint_angle);
		ros::Duration(PATH_TIME).sleep();

	}

	else if (ch == 'g' || ch == 'G')
	{
		printf("input : g \tOpening gripper");
		// printf("Present Kinematics Position X: %.3lf ", kinematics_solver.getPresentJointAngle().at(4));
		std::vector<double> joint_angle;
		joint_angle.push_back(present_joint_angle_.at(4) + 0.001);
		setToolControl(joint_angle);
		ros::Duration(PATH_TIME).sleep();	
		// kinematics_solver.setGripperJointVal(-0.0002);
	}
	else if (ch == '2')
	{
		printf("input : 2 \thome pose\n");
		std::vector<std::string> joint_name;
		std::vector<double> joint_angle;

		double path_time = 2.0;
		std::vector<double> tool_angle;
		tool_angle.push_back(0.016);
		setToolControl(tool_angle);
		printf("opened tools");
		ros::Duration(2).sleep();

		joint_name.push_back("joint1");
		joint_angle.push_back(0.0);
		joint_name.push_back("joint2");
		joint_angle.push_back(0.144);
		joint_name.push_back("joint3");
		joint_angle.push_back(0.354);
		joint_name.push_back("joint4");
		joint_angle.push_back(0.927);
		setJointSpacePath(joint_name, joint_angle, path_time);

		ros::Duration(2).sleep();
		tool_angle.clear();
		tool_angle.push_back(0.01);
		setToolControl(tool_angle);
		ros::Duration(0.5).sleep();
	}
	else if (ch == '1' || ch == '1')
	{
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
		setJointSpacePath(joint_name, joint_angle, path_time);
		ros::Duration(path_time).sleep();
	}
	else if (ch == '3')
	{
		printf("input : 3 \tend pose\n");
		std::vector<std::string> joint_name;
		std::vector<double> joint_angle;
		double path_time = 2.0;

		std::vector<double> tool_angle;
		tool_angle.push_back(0.016);
		setToolControl(tool_angle);
		ros::Duration(2.0).sleep();
		joint_name.push_back("joint1");
		joint_angle.push_back(-0.229);
		joint_name.push_back("joint2");
		joint_angle.push_back(0.161);
		joint_name.push_back("joint3");
		joint_angle.push_back(0.318);
		joint_name.push_back("joint4");
		joint_angle.push_back(1.132);

		setJointSpacePath(joint_name, joint_angle, path_time);
				ros::Duration(path_time).sleep();

	}
		else if (ch == '4') 
	{	//move to the edge
		//successful finishing sequence
		printf("input : 4 \tinit pose\n");
		std::vector<std::string> joint_name;
		std::vector<double> joint_angle;
		double path_time = 2.0;
		joint_name.push_back("joint1");
		joint_angle.push_back(-0.611);
		joint_name.push_back("joint2");
		joint_angle.push_back(-0.025);
		joint_name.push_back("joint3");
		joint_angle.push_back(0.057);
		joint_name.push_back("joint4");
		joint_angle.push_back(1.379);
				printf("313\n");

		bool service = setJointSpacePath(joint_name, joint_angle, path_time);
				printf("316\n");


		//ros::Duration(PATH_TIME).sleep();	

	}
	else if (ch == '5') 
	{
		//successful finishing sequence
		printf("input : 5 \tinit pose\n");
		std::vector<std::string> joint_name;
		std::vector<double> joint_angle;
		double path_time = 2.0;
		//ros::Duration(2.1).sleep();

		std::vector<double> tool_angle;	
				printf("32");

		tool_angle.push_back(0.016);
		setToolControl(tool_angle);
		//ros::Duration(PATH_TIME).sleep();	
		printf("321");

		joint_name.clear();
		path_time = 2.0;
		joint_name.push_back("joint1");
		joint_angle.push_back(0);
		joint_name.push_back("joint2");
		joint_angle.push_back(-0.025);
		joint_name.push_back("joint3");
		joint_angle.push_back(0.057);
		joint_name.push_back("joint4");
		joint_angle.push_back(1.379);
		setJointSpacePath(joint_name, joint_angle, path_time);
		ros::Duration(1.1).sleep();
				printf("line315");
	}

	// Add your logic here based on the received character

	// Prepare the response message
	res.response_message = true;
	 return true;

}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "set_robot_instruction_service_server");
	ros::NodeHandle nh;
	SetRobotPosition setRobotPosition;
	// Create a ROS service server
	ROS_INFO("Char service is ready.");
ros::ServiceServer service = nh.advertiseService("/robot_instruction_service", &SetRobotPosition::charServiceCallback, &setRobotPosition);
	ros::spin();

	return 0;
}
