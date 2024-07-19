#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <tf/transform_datatypes.h>
#include <bioin_tacto/raw_barometer_serial.h>
#include <sensor_msgs/Imu.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf2_ros/transform_listener.h>

#define NUM_SENSORS 16

#include <math.h>

double min_level[NUM_SENSORS];
double max_level[NUM_SENSORS];
double length = 1.0;
bioin_tacto::raw_barometer_serial tmm_baros;
sensor_msgs::Imu imu_data;
geometry_msgs::Quaternion quat1;

// double roll = 0, pitch = 0, yaw = 0.5 * M_PI;

double roll = 0, pitch = 0, yaw = -1 * M_PI / 2;
tf::Quaternion quat;
tf::Quaternion quat2;

void baroReadSCallback(const bioin_tacto::raw_barometer_serialConstPtr &msg) {
    length = msg->baros[0].baro_level;

    if (min_level[0] < length)
        min_level[0] = length;
    if (max_level[0] > length)
        max_level[0] = length;

    length -= max_level[0] - 1;



    //ROS_FATAL("%f, %f, %f", length, min_level[0], max_level[0]);
}


int main(int argc, char **argv) {
    for (int i = 0; i < NUM_SENSORS; i++) {
        min_level[i] = LDBL_MAX;
        max_level[i] = LDBL_MIN;
    }

    ros::init(argc, argv, "pressure_array");

    ros::NodeHandle n;
    ros::Rate r(100);

    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener(tfBuffer);

    ros::Subscriber sub = n.subscribe("/m_baros_serial", 100, baroReadSCallback); //
    ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("pressure_viz", 100);

    std::string frame_id_pressure = argv[1];

    uint32_t shape = visualization_msgs::Marker::ARROW;
    visualization_msgs::Marker marker;

    quat2.setEuler(yaw, pitch, roll);
    quat2 = quat2.inverse();
    ROS_INFO("%lf,%lf,%lf,%lf", (double) quat.getX(), (double) quat.getY(), (double) quat.getZ(), (double) quat.getW());
    while (ros::ok()) {
        std::string parentFrame;
        std::string childFrame;
        if (frame_id_pressure == "pressure_left") {
            marker.header.frame_id = "world";
            parentFrame = "world";
            childFrame = "imu_frame_left1";
            //yaw = -1*M_PI/2;
        }
        else {
            marker.header.frame_id = "world";
            parentFrame = "world";
            childFrame = "imu_frame_right1";
        }
        geometry_msgs::TransformStamped transformStamped;
        if (tfBuffer.canTransform(parentFrame, childFrame, ros::Time(0))) {
            transformStamped = tfBuffer.lookupTransform(parentFrame, childFrame, ros::Time(0));

            quat.setW(transformStamped.transform.rotation.w);
            quat.setX(transformStamped.transform.rotation.x);
            quat.setY(transformStamped.transform.rotation.y);
            quat.setZ(transformStamped.transform.rotation.z);
            ROS_INFO("%lf,%lf,%lf,%lf %s ", (double) quat.getX(), (double) quat.getY(), (double) quat.getZ(),
                     (double) quat.getW(), childFrame.c_str());

            quat.normalize();
            quat = quat * quat2;
            tf::Quaternion quat3;


        }

        // Set the frame ID and timestamp.  See the TF tutorials for information on these.

        marker.header.stamp = ros::Time::now();

        // Set the namespace and id for this marker.  This serves to create a unique ID
        // Any marker sent with the same namespace and id will overwrite the old one
        // marker.ns = "pressure_array";
        marker.id = 0;

        // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
        marker.type = shape;

        // Set the marker action.  Options are ADD, DELETE, and new in ROS Indigo: 3 (DELETEALL)
        marker.action = visualization_msgs::Marker::ADD;

        // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
        marker.pose.position.x = transformStamped.transform.translation.x;
        marker.pose.position.y = transformStamped.transform.translation.y;
        marker.pose.position.z = transformStamped.transform.translation.z;


        marker.pose.orientation.x = quat.getX();
        marker.pose.orientation.y = quat.getY();
        marker.pose.orientation.z = quat.getZ();
        marker.pose.orientation.w = quat.getW();
        //	ROS_WARN("%f", length);

        // Set the scale of the marker -- 1x1x1 here means 1m on a side
        marker.scale.x = (length / 10000) / 2;
        marker.scale.y = 0.5 / 200;//*length / 100;
        marker.scale.z = 0.5 / 200;//*length / 100;

        // Set the color -- be sure to set alpha to something non-zero!
        //TODO: change color according to the temperature
        marker.color.r = 1.0f;
        marker.color.g = 0.0f;
        marker.color.b = 0.0f;
        marker.color.a = 0.6;

        marker.lifetime = ros::Duration();
        //ROS_WARN("working on publishgin  ");
        // Publish the marker
        while (marker_pub.getNumSubscribers() < 1) {

            if (!ros::ok()) {
                return 0;
            }
            ROS_WARN_ONCE("Please create a subscriber to the marker");
            sleep(1);
        }
        marker_pub.publish(marker);

        r.sleep();
        ros::spinOnce();
    }

}
