#include <ros.h>
#include <std_msgs/Int16.h>
#include <FingerLib.h>

ros::NodeHandle nh;
std_msgs::Int16 str_msg;
ros::Publisher position("position", &str_msg);
Finger finger;

void writePosition(const std_msgs::Int16& msg) {
  int aux = msg.data;
  finger.writePos(aux);
}

ros::Subscriber<std_msgs::Int16> goPosition("goPosition2", &writePosition);


void setup() {
  // put your setup code here, to run once:
  Serial.begin(38400);
  finger.attach(5, 2, A0);
  nh.initNode();
  nh.subscribe(goPosition);
  nh.advertise(position);
}
void loop() {
  str_msg.data = finger.readPos();
  position.publish(&str_msg);
  nh.spinOnce();
  delay(10);
}
