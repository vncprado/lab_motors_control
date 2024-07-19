; Auto-generated. Do not edit!


(cl:in-package bioin_tacto-msg)


;//! \htmlinclude raw_imu.msg.html

(cl:defclass <raw_imu> (roslisp-msg-protocol:ros-message)
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
   (ax
    :reader ax
    :initarg :ax
    :type cl:float
    :initform 0.0)
   (ay
    :reader ay
    :initarg :ay
    :type cl:float
    :initform 0.0)
   (az
    :reader az
    :initarg :az
    :type cl:float
    :initform 0.0)
   (gx
    :reader gx
    :initarg :gx
    :type cl:float
    :initform 0.0)
   (gy
    :reader gy
    :initarg :gy
    :type cl:float
    :initform 0.0)
   (gz
    :reader gz
    :initarg :gz
    :type cl:float
    :initform 0.0)
   (mx
    :reader mx
    :initarg :mx
    :type cl:float
    :initform 0.0)
   (my
    :reader my
    :initarg :my
    :type cl:float
    :initform 0.0)
   (mz
    :reader mz
    :initarg :mz
    :type cl:float
    :initform 0.0))
)

(cl:defclass raw_imu (<raw_imu>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <raw_imu>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'raw_imu)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioin_tacto-msg:<raw_imu> is deprecated: use bioin_tacto-msg:raw_imu instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:header-val is deprecated.  Use bioin_tacto-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sensor_id-val :lambda-list '(m))
(cl:defmethod sensor_id-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:sensor_id-val is deprecated.  Use bioin_tacto-msg:sensor_id instead.")
  (sensor_id m))

(cl:ensure-generic-function 'tempe-val :lambda-list '(m))
(cl:defmethod tempe-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:tempe-val is deprecated.  Use bioin_tacto-msg:tempe instead.")
  (tempe m))

(cl:ensure-generic-function 'ax-val :lambda-list '(m))
(cl:defmethod ax-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:ax-val is deprecated.  Use bioin_tacto-msg:ax instead.")
  (ax m))

(cl:ensure-generic-function 'ay-val :lambda-list '(m))
(cl:defmethod ay-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:ay-val is deprecated.  Use bioin_tacto-msg:ay instead.")
  (ay m))

(cl:ensure-generic-function 'az-val :lambda-list '(m))
(cl:defmethod az-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:az-val is deprecated.  Use bioin_tacto-msg:az instead.")
  (az m))

(cl:ensure-generic-function 'gx-val :lambda-list '(m))
(cl:defmethod gx-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:gx-val is deprecated.  Use bioin_tacto-msg:gx instead.")
  (gx m))

(cl:ensure-generic-function 'gy-val :lambda-list '(m))
(cl:defmethod gy-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:gy-val is deprecated.  Use bioin_tacto-msg:gy instead.")
  (gy m))

(cl:ensure-generic-function 'gz-val :lambda-list '(m))
(cl:defmethod gz-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:gz-val is deprecated.  Use bioin_tacto-msg:gz instead.")
  (gz m))

(cl:ensure-generic-function 'mx-val :lambda-list '(m))
(cl:defmethod mx-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:mx-val is deprecated.  Use bioin_tacto-msg:mx instead.")
  (mx m))

(cl:ensure-generic-function 'my-val :lambda-list '(m))
(cl:defmethod my-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:my-val is deprecated.  Use bioin_tacto-msg:my instead.")
  (my m))

(cl:ensure-generic-function 'mz-val :lambda-list '(m))
(cl:defmethod mz-val ((m <raw_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-msg:mz-val is deprecated.  Use bioin_tacto-msg:mz instead.")
  (mz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <raw_imu>) ostream)
  "Serializes a message object of type '<raw_imu>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ay))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'az))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'my))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <raw_imu>) istream)
  "Deserializes a message object of type '<raw_imu>"
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
    (cl:setf (cl:slot-value msg 'ax) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ay) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'az) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gz) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'my) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mz) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<raw_imu>)))
  "Returns string type for a message object of type '<raw_imu>"
  "bioin_tacto/raw_imu")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'raw_imu)))
  "Returns string type for a message object of type 'raw_imu"
  "bioin_tacto/raw_imu")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<raw_imu>)))
  "Returns md5sum for a message object of type '<raw_imu>"
  "51eb1d8b736b5695bb58dc3c4b5e4c55")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'raw_imu)))
  "Returns md5sum for a message object of type 'raw_imu"
  "51eb1d8b736b5695bb58dc3c4b5e4c55")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<raw_imu>)))
  "Returns full string definition for message of type '<raw_imu>"
  (cl:format cl:nil "Header header~%int16 sensor_id~%float32 tempe~%float32 ax~%float32 ay~%float32 az~%float32 gx~%float32 gy~%float32 gz~%float32 mx~%float32 my~%float32 mz~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'raw_imu)))
  "Returns full string definition for message of type 'raw_imu"
  (cl:format cl:nil "Header header~%int16 sensor_id~%float32 tempe~%float32 ax~%float32 ay~%float32 az~%float32 gx~%float32 gy~%float32 gz~%float32 mx~%float32 my~%float32 mz~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <raw_imu>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <raw_imu>))
  "Converts a ROS message object to a list"
  (cl:list 'raw_imu
    (cl:cons ':header (header msg))
    (cl:cons ':sensor_id (sensor_id msg))
    (cl:cons ':tempe (tempe msg))
    (cl:cons ':ax (ax msg))
    (cl:cons ':ay (ay msg))
    (cl:cons ':az (az msg))
    (cl:cons ':gx (gx msg))
    (cl:cons ':gy (gy msg))
    (cl:cons ':gz (gz msg))
    (cl:cons ':mx (mx msg))
    (cl:cons ':my (my msg))
    (cl:cons ':mz (mz msg))
))
