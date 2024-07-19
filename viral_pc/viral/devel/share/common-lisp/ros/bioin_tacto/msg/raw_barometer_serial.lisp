; Auto-generated. Do not edit!


(cl:in-package bioin_tacto-msg)


;//! \htmlinclude raw_barometer_serial.msg.html

(cl:defclass <raw_barometer_serial> (roslisp-msg-protocol:ros-message)
  ((baros
    :reader baros
    :initarg :baros
    :type (cl:vector bioin_tacto-msg:raw_barometer)
   :initform (cl:make-array 0 :element-type 'bioin_tacto-msg:raw_barometer :initial-element (cl:make-instance 'bioin_tacto-msg:raw_barometer))))
)

(cl:defclass raw_barometer_serial (<raw_barometer_serial>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <raw_barometer_serial>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'raw_barometer_serial)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioin_tacto-msg:<raw_barometer_serial> is deprecated: use bioin_tacto-msg:raw_barometer_serial instead.")))

(cl:ensure-generic-function 'baros-val :lambda-list '(m))
(cl:defmethod baros-val ((m <raw_barometer_serial>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:baros-val is deprecated.  Use bioin_tacto-msg:baros instead.")
  (baros m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <raw_barometer_serial>) ostream)
  "Serializes a message object of type '<raw_barometer_serial>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'baros))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'baros))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <raw_barometer_serial>) istream)
  "Deserializes a message object of type '<raw_barometer_serial>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'baros) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'baros)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'bioin_tacto-msg:raw_barometer))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<raw_barometer_serial>)))
  "Returns string type for a message object of type '<raw_barometer_serial>"
  "bioin_tacto/raw_barometer_serial")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'raw_barometer_serial)))
  "Returns string type for a message object of type 'raw_barometer_serial"
  "bioin_tacto/raw_barometer_serial")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<raw_barometer_serial>)))
  "Returns md5sum for a message object of type '<raw_barometer_serial>"
  "7f630d488162f2fb9ae8cc4e653b1937")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'raw_barometer_serial)))
  "Returns md5sum for a message object of type 'raw_barometer_serial"
  "7f630d488162f2fb9ae8cc4e653b1937")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<raw_barometer_serial>)))
  "Returns full string definition for message of type '<raw_barometer_serial>"
  (cl:format cl:nil "bioin_tacto/raw_barometer[] baros~%~%================================================================================~%MSG: bioin_tacto/raw_barometer~%Header header~%int16 sensor_id~%float32 tempe~%float32 baro_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'raw_barometer_serial)))
  "Returns full string definition for message of type 'raw_barometer_serial"
  (cl:format cl:nil "bioin_tacto/raw_barometer[] baros~%~%================================================================================~%MSG: bioin_tacto/raw_barometer~%Header header~%int16 sensor_id~%float32 tempe~%float32 baro_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <raw_barometer_serial>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'baros) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <raw_barometer_serial>))
  "Converts a ROS message object to a list"
  (cl:list 'raw_barometer_serial
    (cl:cons ':baros (baros msg))
))
