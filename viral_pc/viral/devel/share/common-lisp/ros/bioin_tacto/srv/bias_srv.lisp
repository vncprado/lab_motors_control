; Auto-generated. Do not edit!


(cl:in-package bioin_tacto-srv)


;//! \htmlinclude bias_srv-request.msg.html

(cl:defclass <bias_srv-request> (roslisp-msg-protocol:ros-message)
  ((num_secs
    :reader num_secs
    :initarg :num_secs
    :type cl:fixnum
    :initform 0))
)

(cl:defclass bias_srv-request (<bias_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bias_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bias_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioin_tacto-srv:<bias_srv-request> is deprecated: use bioin_tacto-srv:bias_srv-request instead.")))

(cl:ensure-generic-function 'num_secs-val :lambda-list '(m))
(cl:defmethod num_secs-val ((m <bias_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:num_secs-val is deprecated.  Use bioin_tacto-srv:num_secs instead.")
  (num_secs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bias_srv-request>) ostream)
  "Serializes a message object of type '<bias_srv-request>"
  (cl:let* ((signed (cl:slot-value msg 'num_secs)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bias_srv-request>) istream)
  "Deserializes a message object of type '<bias_srv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_secs) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bias_srv-request>)))
  "Returns string type for a service object of type '<bias_srv-request>"
  "bioin_tacto/bias_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bias_srv-request)))
  "Returns string type for a service object of type 'bias_srv-request"
  "bioin_tacto/bias_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bias_srv-request>)))
  "Returns md5sum for a message object of type '<bias_srv-request>"
  "0d0a8123fd19891ee9460281609e26cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bias_srv-request)))
  "Returns md5sum for a message object of type 'bias_srv-request"
  "0d0a8123fd19891ee9460281609e26cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bias_srv-request>)))
  "Returns full string definition for message of type '<bias_srv-request>"
  (cl:format cl:nil "int16 num_secs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bias_srv-request)))
  "Returns full string definition for message of type 'bias_srv-request"
  (cl:format cl:nil "int16 num_secs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bias_srv-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bias_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'bias_srv-request
    (cl:cons ':num_secs (num_secs msg))
))
;//! \htmlinclude bias_srv-response.msg.html

(cl:defclass <bias_srv-response> (roslisp-msg-protocol:ros-message)
  ((b_ax
    :reader b_ax
    :initarg :b_ax
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (b_ay
    :reader b_ay
    :initarg :b_ay
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (b_az
    :reader b_az
    :initarg :b_az
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (b_gx
    :reader b_gx
    :initarg :b_gx
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (b_gy
    :reader b_gy
    :initarg :b_gy
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (b_gz
    :reader b_gz
    :initarg :b_gz
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass bias_srv-response (<bias_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bias_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bias_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioin_tacto-srv:<bias_srv-response> is deprecated: use bioin_tacto-srv:bias_srv-response instead.")))

(cl:ensure-generic-function 'b_ax-val :lambda-list '(m))
(cl:defmethod b_ax-val ((m <bias_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:b_ax-val is deprecated.  Use bioin_tacto-srv:b_ax instead.")
  (b_ax m))

(cl:ensure-generic-function 'b_ay-val :lambda-list '(m))
(cl:defmethod b_ay-val ((m <bias_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:b_ay-val is deprecated.  Use bioin_tacto-srv:b_ay instead.")
  (b_ay m))

(cl:ensure-generic-function 'b_az-val :lambda-list '(m))
(cl:defmethod b_az-val ((m <bias_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:b_az-val is deprecated.  Use bioin_tacto-srv:b_az instead.")
  (b_az m))

(cl:ensure-generic-function 'b_gx-val :lambda-list '(m))
(cl:defmethod b_gx-val ((m <bias_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:b_gx-val is deprecated.  Use bioin_tacto-srv:b_gx instead.")
  (b_gx m))

(cl:ensure-generic-function 'b_gy-val :lambda-list '(m))
(cl:defmethod b_gy-val ((m <bias_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:b_gy-val is deprecated.  Use bioin_tacto-srv:b_gy instead.")
  (b_gy m))

(cl:ensure-generic-function 'b_gz-val :lambda-list '(m))
(cl:defmethod b_gz-val ((m <bias_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioin_tacto-srv:b_gz-val is deprecated.  Use bioin_tacto-srv:b_gz instead.")
  (b_gz m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bias_srv-response>) ostream)
  "Serializes a message object of type '<bias_srv-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'b_ax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'b_ax))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'b_ay))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'b_ay))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'b_az))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'b_az))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'b_gx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'b_gx))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'b_gy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'b_gy))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'b_gz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'b_gz))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bias_srv-response>) istream)
  "Deserializes a message object of type '<bias_srv-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'b_ax) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'b_ax)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'b_ay) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'b_ay)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'b_az) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'b_az)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'b_gx) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'b_gx)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'b_gy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'b_gy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'b_gz) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'b_gz)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bias_srv-response>)))
  "Returns string type for a service object of type '<bias_srv-response>"
  "bioin_tacto/bias_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bias_srv-response)))
  "Returns string type for a service object of type 'bias_srv-response"
  "bioin_tacto/bias_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bias_srv-response>)))
  "Returns md5sum for a message object of type '<bias_srv-response>"
  "0d0a8123fd19891ee9460281609e26cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bias_srv-response)))
  "Returns md5sum for a message object of type 'bias_srv-response"
  "0d0a8123fd19891ee9460281609e26cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bias_srv-response>)))
  "Returns full string definition for message of type '<bias_srv-response>"
  (cl:format cl:nil "float32[] b_ax~%float32[] b_ay~%float32[] b_az~%float32[] b_gx~%float32[] b_gy~%float32[] b_gz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bias_srv-response)))
  "Returns full string definition for message of type 'bias_srv-response"
  (cl:format cl:nil "float32[] b_ax~%float32[] b_ay~%float32[] b_az~%float32[] b_gx~%float32[] b_gy~%float32[] b_gz~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bias_srv-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'b_ax) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'b_ay) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'b_az) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'b_gx) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'b_gy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'b_gz) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bias_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'bias_srv-response
    (cl:cons ':b_ax (b_ax msg))
    (cl:cons ':b_ay (b_ay msg))
    (cl:cons ':b_az (b_az msg))
    (cl:cons ':b_gx (b_gx msg))
    (cl:cons ':b_gy (b_gy msg))
    (cl:cons ':b_gz (b_gz msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'bias_srv)))
  'bias_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'bias_srv)))
  'bias_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bias_srv)))
  "Returns string type for a service object of type '<bias_srv>"
  "bioin_tacto/bias_srv")