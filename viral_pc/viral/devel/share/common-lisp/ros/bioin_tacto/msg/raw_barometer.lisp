; Auto-generated. Do not edit!


(cl:in-package bioin_tacto-msg)


;//! \htmlinclude raw_barometer.msg.html

(cl:defclass <raw_barometer> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sensor_id
    :reader sensor_id
    :initarg :sensor_id
    :type cl:fixnum
    :initform 0)
   (tempe
    :reader tempe
    :initarg :tempe
    :type cl:float
    :initform 0.0)
   (baro_level
    :reader baro_level
    :initarg :baro_level
    :type cl:float
    :initform 0.0))
)

(cl:defclass raw_barometer (<raw_barometer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <raw_barometer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'raw_barometer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioin_tacto-msg:<raw_barometer> is deprecated: use bioin_tacto-msg:raw_barometer instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <raw_barometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:header-val is deprecated.  Use bioin_tacto-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensor_id-val :lambda-list '(m))
(cl:defmethod sensor_id-val ((m <raw_barometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:sensor_id-val is deprecated.  Use bioin_tacto-msg:sensor_id instead.")
  (sensor_id m))

(cl:ensure-generic-function 'tempe-val :lambda-list '(m))
(cl:defmethod tempe-val ((m <raw_barometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:tempe-val is deprecated.  Use bioin_tacto-msg:tempe instead.")
  (tempe m))

(cl:ensure-generic-function 'baro_level-val :lambda-list '(m))
(cl:defmethod baro_level-val ((m <raw_barometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:baro_level-val is deprecated.  Use bioin_tacto-msg:baro_level instead.")
  (baro_level m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <raw_barometer>) ostream)
  "Serializes a message object of type '<raw_barometer>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'sensor_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tempe))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'baro_level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <raw_barometer>) istream)
  "Deserializes a message object of type '<raw_barometer>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tempe) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'baro_level) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<raw_barometer>)))
  "Returns string type for a message object of type '<raw_barometer>"
  "bioin_tacto/raw_barometer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'raw_barometer)))
  "Returns string type for a message object of type 'raw_barometer"
  "bioin_tacto/raw_barometer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<raw_barometer>)))
  "Returns md5sum for a message object of type '<raw_barometer>"
  "5f8059946af2eac503e357862e785812")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'raw_barometer)))
  "Returns md5sum for a message object of type 'raw_barometer"
  "5f8059946af2eac503e357862e785812")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<raw_barometer>)))
  "Returns full string definition for message of type '<raw_barometer>"
  (cl:format cl:nil "Header header~%int16 sensor_id~%float32 tempe~%float32 baro_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'raw_barometer)))
  "Returns full string definition for message of type 'raw_barometer"
  (cl:format cl:nil "Header header~%int16 sensor_id~%float32 tempe~%float32 baro_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <raw_barometer>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <raw_barometer>))
  "Converts a ROS message object to a list"
  (cl:list 'raw_barometer
    (cl:cons ':header (header msg))
    (cl:cons ':sensor_id (sensor_id msg))
    (cl:cons ':tempe (tempe msg))
    (cl:cons ':baro_level (baro_level msg))
))
