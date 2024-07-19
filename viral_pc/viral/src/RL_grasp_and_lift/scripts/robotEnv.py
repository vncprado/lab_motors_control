
import gymnasium
import rospy    
from sensor_msgs.msg import JointState
from actionlib_msgs.msg import GoalStatus
from gymnasium import spaces
import numpy as np
from bioin_tacto.msg import raw_barometer
from scipy.spatial.transform import Rotation as R

from fiducial_msgs.msg import FiducialTransformArray
import random
import csv
import time
from OMX_teleop.srv import RobotInstruction
import tf2_ros

class RobotEnv(gymnasium.Env):

    def __init__(self, render_mode=None):
        rospy.init_node('evironment', anonymous=True)
        self.tfBuffer = tf2_ros.Buffer()
        self.listener = tf2_ros.TransformListener(self.tfBuffer)
        self.observation_space = spaces.Dict(
            {
                "pressure_left": spaces.Box(low=np.array([0]), high=np.array([1.5]), dtype=np.float32),
                "pressure_right": spaces.Box(low=np.array([0]), high=np.array([1.5]), dtype=np.float32),
                # "orientation_left": spaces.Box(low=np.array([-1, -1, -1, -1]), high=np.array([1, 1, 1, 1]),
                #                                       dtype=np.float32),
                # "orientation_right": spaces.Box(low=np.array([-1, -1, -1, -1]), high=np.array([1, 1, 1, 1]),
                #                                       dtype=np.float32),
                "orientation_left": spaces.Box(low=np.array([-1, -1, -1]), high=np.array([1, 1, 1 ]),
                                                      dtype=np.float32),
                "orientation_right": spaces.Box(low=np.array([-1, -1, -1]), high=np.array([1, 1, 1]),
                                                      dtype=np.float32),
                                                      
                "ee_position": spaces.Box(low=np.array([-1, -1, -1]),
                                             high=np.array([1,1,1]), dtype=np.float32),
                "ee_orientation": spaces.Box(low=np.array([-1, -1, -1, -1]), high=np.array([1, 1, 1, 1]),
                                                       dtype=np.float32),

            })
        
        self.baro_left = 0
        self.baro_right = 0
        self.action_space = spaces.Discrete(8)
        self.current_step = 0
        self.actions = ['w', 's','a','d','z','x','o','k']
        self.pressure_normalization_left = 500
        self.pressure_normalization_right = 500
        self.previous_orientation_left =  R.from_quat([0,0,0,1])
        self.previous_orientation_right =  R.from_quat([0,0,0,1])
        self.previous_orientation_init = True
        self.total_reward = 0
        self.previous_height = 0
        self.teensy_baro_left_sub = rospy.Subscriber("raw_barometers_teensy1", raw_barometer,
                                                     self.callback_raw_baro)
        self.teensy_baro_right_sub = rospy.Subscriber("raw_barometers_teensy2", raw_barometer,
                                                     self.callback_raw_baro)
    def callRobotInstructionservice(self, char):
        rospy.wait_for_service('/robot_instruction_service')
        try:
            send_robot_insruction = rospy.ServiceProxy('/robot_instruction_service', RobotInstruction)
            resp1 = send_robot_insruction(char)
            return resp1.response_message
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
            
    def callback_raw_baro(self, msg):
        if (msg.header.frame_id == 'baro_frame_right'):
            self.baro_right = msg.baro_level
            # if(self.pressure_normalization_right == 0):
            #     self.pressure_normalization_right = msg.baro_level
        elif(msg.header.frame_id == 'baro_frame_left'):
            self.baro_left = msg.baro_level
            # if(self.pressure_normalization_left == 0):
            #     self.pressure_normalization_left = msg.baro_level   

    def angle_difference(self, q1, q2):
        r1 = R.from_quat(q1)
        r2 = R.from_quat(q2)
        r_diff = r2 * r1.inv()  # Rotation representing the shortest rotation from q1 to q2
        euler_angles = r_diff.as_euler('xyz', degrees=True)
        return (euler_angles)
    
    def checkPressureLimit(self, pressure_left, pressure_right, rewardsum):
        done = False
        reward = rewardsum
        if (pressure_left > 1) or (pressure_right > 0.9):
            print("Too little pressure", pressure_left, "right", pressure_right)
            reward = rewardsum - 0.5
            done = True

        elif (pressure_left < 0.1) or (pressure_right < 0.1):
            print("Too much pressure")
            print("pressure left", pressure_left)
            print("pressure right", pressure_right)
            reward = rewardsum - 0.5

            done = True
            

        return reward, done

    def reset(self, seed=None, options=None):
        rospy.wait_for_service('/robot_instruction_service')
        try:

            send_robot_insruction = rospy.ServiceProxy('/robot_instruction_service', RobotInstruction)
            resp1 = send_robot_insruction('2')

            resp1.response_message
        except rospy.ServiceException as e:
            print("Service call failed: %s"%e)
    
        obs1 = self._get_obs()
        self.total_reward = 0
        self.current_step = 0
        self.previous_height = obs1['ee_position'][2]
        return obs1

    def _get_obs(self):

        pressure_left = (np.array(self.baro_left) / self.pressure_normalization_left)  ## min max
        pressure_right = (np.array(self.baro_right) / self.pressure_normalization_right)  ## min max

        transform = self.tfBuffer.lookup_transform('world', 'imu_frame_right1', rospy.Time(0))
        current_rot_right = ([transform.transform.rotation.x, transform.transform.rotation.y, transform.transform.rotation.z,
                     transform.transform.rotation.w])
        transform = self.tfBuffer.lookup_transform('world', 'imu_frame_left1', rospy.Time(0))
        current_rot_left = ([transform.transform.rotation.x, transform.transform.rotation.y, transform.transform.rotation.z,
                    transform.transform.rotation.w])
        transform = self.tfBuffer.lookup_transform('world', 'end_effector_link', rospy.Time(0))
        ee_orientation = [transform.transform.rotation.x, transform.transform.rotation.y, transform.transform.rotation.z,
                    transform.transform.rotation.w]
        ee_position= [transform.transform.translation.x, transform.transform.translation.y, transform.transform.translation.z]

        if(self.previous_orientation_init):
            self.previous_orientation_left = current_rot_left
            self.previous_orientation_right = current_rot_right
            self.previous_orientation_init = False
        
        rot_left = self.angle_difference(self.previous_orientation_left, current_rot_left)
        rot_right =  self.angle_difference(self.previous_orientation_right, current_rot_right )
        self.previous_orientation_left = current_rot_left
        self.previous_orientation_right = current_rot_right
        # print("left rot", current_rot_right.as_euler('zyx', degrees=True))
        # print("right rot", current_rot_left.as_euler('zyx', degrees=True))
        # print("left rot", current_rot_right.as_euler('zyx', degrees=True))
        # print("right rot", current_rot_left.as_euler('zyx', degrees=True))
        obs = {"left_sensor_orientation": rot_left,
               "right_sensor_orientation": rot_right,
               "ee_orientation": ee_orientation,
               "ee_position": ee_position,
               "pressure_left": pressure_left,
               "pressure_right": pressure_right}
        print("obes: ",obs)
        return obs

    def step(self, action):
        success = False
        self.current_step += 1
       # self.total_reward  =  self.total_reward - 0.05 * self.current_step
        #reward =- 0.05 * self.current_step
        reward = 0
        print("current step", self.current_step)
        self._take_action(self.actions[action])
        obs1 = self._get_obs()
        hight_of_ee = obs1['ee_position'][2]
        pressure_left = obs1['pressure_left']
        pressure_right = obs1['pressure_right']
        pressure_reward, done = self.checkPressureLimit(pressure_left, pressure_right,reward)
        reward= pressure_reward
        # if(abs(obs1['left_sensor_orientation'][0])^2 or 
        #    abs(obs1['left_sensor_orientation'][1]) > 20 or 
        #    abs(obs1['left_sensor_orientation'][2]) > 20 or 
        #    abs(obs1['right_sensor_orientation'][0]) > 20 or
        #    abs(obs1['right_sensor_orientation'][1]) > 20 or
        #    abs(obs1['right_sensor_orientation'][2]) > 20):
        print("left sensor mag: ", np.linalg.norm(obs1['left_sensor_orientation']))
        print("right sensor mag: ", np.linalg.norm(obs1['right_sensor_orientation']))
        if( np.linalg.norm(obs1['left_sensor_orientation'])> 20
           or np.linalg.norm(obs1['right_sensor_orientation'])> 20):
            print("left sensor mag: ", np.linalg.norm(obs1['left_sensor_orientation']))
            print("right sensor mag: ", np.linalg.norm(obs1['right_sensor_orientation']))
            reward -= 0.7
            done = True
        if(hight_of_ee < 0.01):
            reward -= 0.7
            done = True
        if(hight_of_ee > 0.08):
            reward += 0.7
            done = True
            success = True
        else:
            reward += + hight_of_ee * 20 - self.previous_height * 20
            self.total_reward += reward
            self.previous_height = hight_of_ee
            print("previous height: ", self.previous_height)
            print("total reward: ", self.total_reward)



     #   print("step: ", self.current_step, "episode: ", self.move.episode)
        return obs1, reward, done, success

    def _take_action(self, action):
        done = False

        print(action)
        # reward based on joint 1 angle. As ot gets closer to the object the bigger it gets. 
        service_sucessful  = self.callRobotInstructionservice(action)
        rospy.sleep(2)
    
    def success_manuver(self):
        print("Success")
        self.callRobotInstructionservice('4')
        rospy.sleep(2)
        self.callRobotInstructionservice('5')
        rospy.sleep(1)

    def lift(self):
        self.callRobotInstructionservice('5')



        

