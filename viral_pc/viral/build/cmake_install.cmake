# Install script for directory: /home/bioinlab/viral_pc/viral/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/bioinlab/viral_pc/viral/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/bioinlab/viral_pc/viral/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/bioinlab/viral_pc/viral/install" TYPE PROGRAM FILES "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/bioinlab/viral_pc/viral/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/bioinlab/viral_pc/viral/install" TYPE PROGRAM FILES "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/bioinlab/viral_pc/viral/install/setup.bash;/home/bioinlab/viral_pc/viral/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/bioinlab/viral_pc/viral/install" TYPE FILE FILES
    "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/setup.bash"
    "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/bioinlab/viral_pc/viral/install/setup.sh;/home/bioinlab/viral_pc/viral/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/bioinlab/viral_pc/viral/install" TYPE FILE FILES
    "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/setup.sh"
    "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/bioinlab/viral_pc/viral/install/setup.zsh;/home/bioinlab/viral_pc/viral/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/bioinlab/viral_pc/viral/install" TYPE FILE FILES
    "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/setup.zsh"
    "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/bioinlab/viral_pc/viral/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/bioinlab/viral_pc/viral/install" TYPE FILE FILES "/home/bioinlab/viral_pc/viral/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/bioinlab/viral_pc/viral/build/gtest/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/RL_grasp_and_lift/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator/open_manipulator/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_controls/open_manipulator_controls/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_simulations/open_manipulator_simulations/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_arduino/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_chibios/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_mbed/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_msgs/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_python/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_tivac/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_vex_cortex/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_vex_v5/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_xbee/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_client/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/tf2/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator/open_manipulator_libs/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_controls/open_manipulator_hw/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_server/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator/open_manipulator_control_gui/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator/open_manipulator_controller/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator/open_manipulator_teleop/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/bioin_tacto/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_dependencies/roboticsgroup_gazebo_plugins/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_embeddedlinux/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_test/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/rosserial/rosserial_windows/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_controls/open_manipulator_controllers/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/OMX_teleop/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator/open_manipulator_description/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_simulations/open_manipulator_gazebo/cmake_install.cmake")
  include("/home/bioinlab/viral_pc/viral/build/open_manipulator_controls/open_manipulator_moveit_config/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/bioinlab/viral_pc/viral/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
