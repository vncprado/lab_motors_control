# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bioin_tacto: 4 messages, 1 services")

set(MSG_I_FLAGS "-Ibioin_tacto:/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bioin_tacto_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" NAME_WE)
add_custom_target(_bioin_tacto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioin_tacto" "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" "bioin_tacto/raw_barometer:std_msgs/Header"
)

get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" NAME_WE)
add_custom_target(_bioin_tacto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioin_tacto" "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" "bioin_tacto/raw_imu:std_msgs/Header"
)

get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" NAME_WE)
add_custom_target(_bioin_tacto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioin_tacto" "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" NAME_WE)
add_custom_target(_bioin_tacto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioin_tacto" "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" NAME_WE)
add_custom_target(_bioin_tacto_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioin_tacto" "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
)
_generate_msg_cpp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
)
_generate_msg_cpp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
)
_generate_msg_cpp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
)

### Generating Services
_generate_srv_cpp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
)

### Generating Module File
_generate_module_cpp(bioin_tacto
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bioin_tacto_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bioin_tacto_generate_messages bioin_tacto_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_cpp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_cpp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_cpp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_cpp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_cpp _bioin_tacto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioin_tacto_gencpp)
add_dependencies(bioin_tacto_gencpp bioin_tacto_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioin_tacto_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
)
_generate_msg_eus(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
)
_generate_msg_eus(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
)
_generate_msg_eus(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
)

### Generating Services
_generate_srv_eus(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
)

### Generating Module File
_generate_module_eus(bioin_tacto
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(bioin_tacto_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(bioin_tacto_generate_messages bioin_tacto_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_eus _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_eus _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_eus _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_eus _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_eus _bioin_tacto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioin_tacto_geneus)
add_dependencies(bioin_tacto_geneus bioin_tacto_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioin_tacto_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
)
_generate_msg_lisp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
)
_generate_msg_lisp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
)
_generate_msg_lisp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
)

### Generating Services
_generate_srv_lisp(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
)

### Generating Module File
_generate_module_lisp(bioin_tacto
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bioin_tacto_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bioin_tacto_generate_messages bioin_tacto_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_lisp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_lisp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_lisp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_lisp _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_lisp _bioin_tacto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioin_tacto_genlisp)
add_dependencies(bioin_tacto_genlisp bioin_tacto_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioin_tacto_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
)
_generate_msg_nodejs(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
)
_generate_msg_nodejs(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
)
_generate_msg_nodejs(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
)

### Generating Services
_generate_srv_nodejs(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
)

### Generating Module File
_generate_module_nodejs(bioin_tacto
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(bioin_tacto_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(bioin_tacto_generate_messages bioin_tacto_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_nodejs _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_nodejs _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_nodejs _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_nodejs _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_nodejs _bioin_tacto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioin_tacto_gennodejs)
add_dependencies(bioin_tacto_gennodejs bioin_tacto_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioin_tacto_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
)
_generate_msg_py(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg"
  "${MSG_I_FLAGS}"
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
)
_generate_msg_py(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
)
_generate_msg_py(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
)

### Generating Services
_generate_srv_py(bioin_tacto
  "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
)

### Generating Module File
_generate_module_py(bioin_tacto
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bioin_tacto_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bioin_tacto_generate_messages bioin_tacto_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_py _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu_serial.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_py _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_barometer.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_py _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/msg/raw_imu.msg" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_py _bioin_tacto_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/bioinlab/viral_pc/viral/src/bioin_tacto/srv/bias_srv.srv" NAME_WE)
add_dependencies(bioin_tacto_generate_messages_py _bioin_tacto_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioin_tacto_genpy)
add_dependencies(bioin_tacto_genpy bioin_tacto_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioin_tacto_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioin_tacto
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(bioin_tacto_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioin_tacto
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(bioin_tacto_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioin_tacto
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(bioin_tacto_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioin_tacto
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(bioin_tacto_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioin_tacto
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(bioin_tacto_generate_messages_py std_msgs_generate_messages_py)
endif()
