#!/usr/bin/env python3
#source https://keras.io/examples/rl/deep_q_network_breakout/
import tensorflow as tf

from robotEnv import RobotEnv
import keras
from keras import layers

import numpy as np
from time import sleep
import time
import csv
env = RobotEnv()

optimizer = keras.optimizers.Adam(learning_rate=0.00025, clipnorm=1.0)
pretrained = True 
epsilon = 0.5  # Epsilon greedy parameter 0.5 if pretrained and 0.9 if not

timestr = time.strftime("%Y%m%d-%H%M%S")
object = 1
pretrain = '01_02_04'
pretrained_path = '/home/bioinlab/Documents/real-OMX-bioin-tacto-grasp-and-lift/src/RL_grasp_and_lift/scripts/trained_01_02_04_A0.keras'
file = open(f'/home/bioinlab/Documents/real-OMX-bioin-tacto-grasp-and-lift/RL_data/recordstep_{timestr}_object{object}_pretained_{pretrain}.csv', 'w')
header = ['pressure_left', 'pressure_right', 
          "imu_left_orientation_x","imu_left_orientation_y","imu_left_orientation_z",
        "imu_right_orientation_x", "imu_right_orientation_y", "imu_right_orientation_z",
    "end-effector_position_x", "end-effector_position_y", "end-effector_position_z",
    "end-effector_orientation_x", "end-effector_orientation_y", "end-effector_orientation_z", "end-effector_orientation_w",
          'reward', 'action', 'episode', 'step', 'success']
csv_writer_step = csv.writer(file)
csv_writer_step.writerow(header)

num_actions = 8
gamma = 0.75  # Discount factor for past rewards
max_steps_per_episode = 10000

# Experience replay buffers
action_history = []
state_history = []
state_next_history = []
rewards_history = []
done_history = []
episode_reward_history = []
running_reward = 0
episode_count = 0
frame_count = 0
epsilon_min = 0.1  # Minimum epsilon greedy parameter
epsilon_max = 1.0  # Maximum epsilon greedy parameter
epsilon_interval = (
    epsilon_max - epsilon_min
)  # Rate at which to reduce chance of random action being taken
batch_size = 32  # Size of batch taken from replay buffer
# Number of frames to take random action and observe output
epsilon_random_frames = 0
# Number of frames for exploration
epsilon_greedy_frames = 200.0 #50
# Maximum replay length
# Note: The Deepmind paper suggests 1000000 however this causes memory issues
max_memory_length = 500
# Train the model after 4 actions
update_after_actions = 4
# How often to update the target network
update_target_network = 8 #20 #maybe reduce
actions_mapping = ['w', 's','a','d','z','x','o','k']
def create_q_model():
    # Network defined by the Deepmind paper
    inputs = layers.Input(shape=(15))

    # Convolutions on the frames on the screen
    layer1 = layers.Dense(64, activation="relu")(inputs)
    layer2 = layers.Dense(32, activation="relu")(layer1)
    layer3 = layers.Dense(16, activation="relu")(layer2)

    layer4 = layers.Flatten()(layer3)

    # layer5 = layers.Dense(512, activation="relu")(layer4)
    layer5 = layers.Dense(num_actions, activation="linear")(layer4) #change 
    action = layers.Dense(num_actions, activation="softmax")(layer5) #change 

    #add a softmax layer
    return keras.Model(inputs=inputs, outputs=action)
if(pretrained):
    model = tf.keras.models.load_model(pretrained_path)
else:
    model = create_q_model()
    model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])




# The first model makes the predictions for Q-values which are used to
# make a action.
#model = create_q_model()
# Build a target model for the prediction of future rewards.
# The weights of a target model get updated every 10000 steps thus when the
# loss between the Q-values is calculated the target Q-value irot_lefts stable.
#model_target = create_q_model()


model_target = tf.keras.models.clone_model(
    model, input_tensors=None, clone_function=None
)

loss_function = keras.losses.Huber()

def convert_space_dict_to_array(state):
    pressure_left = state['pressure_left']
    pressure_right = state['pressure_right']
    left_sensor_orientation = state['left_sensor_orientation']
    right_sensor_orientation = state['right_sensor_orientation']
    ee_orientation = state['ee_orientation']
    ee_position = state['ee_position']

    # Flatten the orientation and concatenate all components
    state_array = np.array([
        pressure_left,
        pressure_right,
        *left_sensor_orientation,
        *right_sensor_orientation,
        *ee_orientation,
        *ee_position
    ])
    return state_array
episode = -1
env.lift()
sleep(1)
while True:
    episode += 1
    print("resetting start")
    state_gym = env.reset()
    print("resetting")
    state = convert_space_dict_to_array(state_gym)
    episode_reward = 0
    print(state_gym)
    for timestep in range(1, max_steps_per_episode):
        sleep(0.1)
        #env.render(); Adding this line would show the attempts
        # of the agent in a pop up window.
        frame_count += 1
        #env.action_space.sample() method will create a random action
        # in any environment. Here it will create a random action in
        # the cartpole environment.
        # action_index = new_model.predict(state)
        # action_index = np.argmax(action_index)
        if frame_count < epsilon_random_frames or epsilon > np.random.rand(1)[0]:
            action = np.random.choice(num_actions)
            print("random action:", action)
        else:
            # Predict action Q-values
            # From environment state
            state_tensor = tf.convert_to_tensor(state)
            state_tensor = tf.expand_dims(state_tensor, 0)
            
            action_probs = model(state_tensor, training=False)
            # Take best action
            action = tf.argmax(action_probs[0]).numpy()
            print("predicted action:",action)

        #print(a
        epsilon -= epsilon_interval / epsilon_greedy_frames
        epsilon = max(epsilon, epsilon_min)
        print("new epsilon", epsilon)
        state_next, reward, done, success = env.step(action)
        fixed = False
        print('presure_left ',state_next['pressure_left'])
        print('presure_right ',state_next['pressure_right'])
        while(state_next['pressure_left'] < -0.2 or state_next['pressure_right'] < -0.2) and not fixed:
            pressures = env._get_obs()
            if(pressures['pressure_left'] > -0.2 and pressures['pressure_right'] > -0.2):
                fixed = True
            else:
                print("Fixing pressure sensors")
            
        print("line 83 done", done)
        print("line 84 reward", reward)
        sleep(0.1)
        state_next = convert_space_dict_to_array(state_next)

        episode_reward += reward

        csv_writer_step.writerow(np.concatenate((state_next,
                [episode_reward, action, episode, timestep, success])))        
        # Save actions and states in replay bufferstep
        action_history.append(action)
        state_history.append(state)
        state_next_history.append(state_next)
        done_history.append(done)
        rewards_history.append(reward)
        state = state_next
        # Update every fourth frame and once batch size is over 32
        if frame_count % update_after_actions == 0 and len(done_history) > batch_size:

            # Get indices of samples for replay buffers
            indices = np.random.choice(range(len(done_history)), size=batch_size)

            # Using list comprehension to sample from replay buffer
            state_sample = np.array([state_history[i] for i in indices])
            state_next_sample = np.array([state_next_history[i] for i in indices])
            rewards_sample = [rewards_history[i] for i in indices]
            action_sample = [action_history[i] for i in indices]
            done_sample = tf.convert_to_tensor(
                [float(done_history[i]) for i in indices]
            )

            # Build the updated Q-values for the sampled future states
            # Use the target model for stability
            future_rewards = model_target.predict(state_next_sample)
            # Q value = reward + discount factor * expected future reward
            updated_q_values = rewards_sample + gamma * tf.reduce_max(
                future_rewards, axis=1
            )

            # If final frame set the last value to -1
            updated_q_values = updated_q_values * (1 - done_sample) - done_sample

            # Create a mask so we only calculate loss on the updated Q-values
            masks = tf.one_hot(action_sample, num_actions)

            with tf.GradientTape() as tape:
                # Train the model on the states and updated Q-values
                q_values = model(state_sample)

                # Apply the masks to the Q-values to get the Q-value for action taken
                q_action = tf.reduce_sum(tf.multiply(q_values, masks), axis=1)
                # Calculate loss between new Q-value and old Q-value
                loss = loss_function(updated_q_values, q_action)

            # Backpropagation
            grads = tape.gradient(loss, model.trainable_variables)
            optimizer.apply_gradients(zip(grads, model.trainable_variables))

        if frame_count % update_target_network == 0:
            # update the the target network with new weights
            model_target.set_weights(model.get_weights())
            # Log details
            template = "running reward: {:.2f} at episode {}, frame count {}"
            print(template.format(running_reward, episode_count, frame_count))

        # Limit the state and reward history
        if len(rewards_history) > max_memory_length:
            del rewards_history[:1]
            del state_history[:1]
            del state_next_history[:1]
            del action_history[:1]
            del done_history[:1]

        if done:
            print('breaking')
            if(success):
                env.success_manuver()
                sleep(5)
                
            break

    # Update running reward to check condition for solving
    episode_reward_history.append(episode_reward)
    if len(episode_reward_history) > 100:
        del episode_reward_history[:1]
    running_reward = np.mean(episode_reward_history)

    episode_count += 1
    print("episode count", episode_count)
    if running_reward > 20:  # Condition to consider the task solved
    
        print('breaking')
        sleep(5)
        print("Solved at episode {}!".format(episode_count))
        break
    
    
model.save("/home/bioinlab/Documents/real-OMX-bioin-tacto-grasp-and-lift/src/RL_grasp_and_lift/scripts/model"+ timestr + ".h5")