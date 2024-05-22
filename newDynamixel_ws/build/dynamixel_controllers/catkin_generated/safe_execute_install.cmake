execute_process(COMMAND "/home/bioinlab/lab_dynamixel_contol/newDynamixel_ws/build/dynamixel_controllers/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/bioinlab/lab_dynamixel_contol/newDynamixel_ws/build/dynamixel_controllers/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
