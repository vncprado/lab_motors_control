; Auto-generated. Do not edit!


(cl:in-package bioin_tacto-msg)


;//! \htmlinclude raw_imu_serial.msg.html

(cl:defclass <raw_imu_serial> (roslisp-msg-protocol:ros-message)
  ((imus
    :reader imus
    :initarg :imus
    :type (cl:vector bioin_tacto-msg:raw_imu)
   :initform (cl:make-array 0 :element-type 'bioin_tacto-msg:raw_imu :initial-element (cl:make-instance 'bioin_tacto-msg:raw_imu))))
)

(cl:defclass raw_imu_serial (<raw_imu_serial>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <raw_imu_serial>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'raw_imu_serial)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioin_tacto-msg:<raw_imu_serial> is deprecated: use bioin_tacto-msg:raw_imu_serial instead.")))

(cl:ensure-generic-function 'imus-val :lambda-list '(m))
(cl:defmethod imus-val ((m <raw_imu_serial>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:imus-val is deprecated.  Use bioin_tacto-msg:imus instead.")
  (imus m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <raw_imu_serial>) ostream)
  "Serializes a message object of type '<raw_imu_serial>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'imus))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'imus))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <raw_imu_serial>) istream)
  "Deserializes a message object of type '<raw_imu_serial>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'imus) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'imus)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'bioin_tacto-msg:raw_imu))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<raw_imu_serial>)))
  "Returns string type for a message object of type '<raw_imu_serial>"
  "bioin_tacto/raw_imu_serial")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'raw_imu_serial)))
  "Returns string type for a message object of type 'raw_imu_serial"
  "bioin_tacto/raw_imu_serial")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<raw_imu_serial>)))
  "Returns md5sum for a message object of type '<raw_imu_serial>"
  "bf6b782ad59ebe5fad0f029c0e04fc49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'raw_imu_serial)))
  "Returns md5sum for a message object of type 'raw_imu_serial"
  "bf6b782ad59ebe5fad0f029c0e04fc49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<raw_imu_serial>)))
  "Returns full string definition for message of type '<raw_imu_serial>"
  (cl:format cl:nil "bioin_tacto/raw_imu[] imus~%~%================================================================================~%MSG: bioin_tacto/raw_imu~%Header header~%int16 sensor_id~%float32 tempe~%float32 ax~%float32 ay~%float32 az~%float32 gx~%float32 gy~%float32 gz~%float32 mx~%float32 my~%float32 mz~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'raw_imu_serial)))
  "Returns full string definition for message of type 'raw_imu_serial"
  (cl:format cl:nil "bioin_tacto/raw_imu[] imus~%~%================================================================================~%MSG: bioin_tacto/raw_imu~%Header header~%int16 sensor_id~%float32 tempe~%float32 ax~%float32 ay~%float32 az~%float32 gx~%float32 gy~%float32 gz~%float32 mx~%float32 my~%float32 mz~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <raw_imu_serial>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'imus) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <raw_imu_serial>))
  "Converts a ROS message object to a list"
  (cl:list 'raw_imu_serial
    (cl:cons ':imus (imus msg))
))
