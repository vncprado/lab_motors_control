#include <ros.h>
#include <std_msgs/Int16.h>
#include <FingerLib.h>

ros::NodeHandle nh;
std_msgs::Int16 str_msg;
ros::Publisher position("position", &str_msg);
std_msgs::Int16 teste1;
std_msgs::Int16 teste2;
ros::Publisher batata("PID", &teste1);
ros::Publisher constraint("PIDCONSTRAINT", &teste2);
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
  nh.advertise(batata);
  nh.advertise(constraint);
}
void loop() {
  teste1.data=finger.getPID();
  batata.publish(&teste1);
  teste2.data=finger.getPIDConstrain();
  constraint.publish(&teste2);

  str_msg.data = finger.readPos();
  position.publish(&str_msg);
  nh.spinOnce();
  delay(10);
  
  
}
