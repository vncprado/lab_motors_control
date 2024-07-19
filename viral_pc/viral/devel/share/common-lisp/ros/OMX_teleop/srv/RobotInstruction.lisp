; Auto-generated. Do not edit!


(cl:in-package OMX_teleop-srv)


;//! \htmlinclude RobotInstruction-request.msg.html

(cl:defclass <RobotInstruction-request> (roslisp-msg-protocol:ros-message)
  ((input_char
    :reader input_char
    :initarg :input_char
    :type cl:string
    :initform ""))
)

(cl:defclass RobotInstruction-request (<RobotInstruction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotInstruction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotInstruction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name OMX_teleop-srv:<RobotInstruction-request> is deprecated: use OMX_teleop-srv:RobotInstruction-request instead.")))

(cl:ensure-generic-function 'input_char-val :lambda-list '(m))
(cl:defmethod input_char-val ((m <RobotInstruction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader OMX_teleop-srv:input_char-val is deprecated.  Use OMX_teleop-srv:input_char instead.")
  (input_char m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotInstruction-request>) ostream)
  "Serializes a message object of type '<RobotInstruction-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_char))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_char))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotInstruction-request>) istream)
  "Deserializes a message object of type '<RobotInstruction-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input_char) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'input_char) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotInstruction-request>)))
  "Returns string type for a service object of type '<RobotInstruction-request>"
  "OMX_teleop/RobotInstructionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotInstruction-request)))
  "Returns string type for a service object of type 'RobotInstruction-request"
  "OMX_teleop/RobotInstructionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotInstruction-request>)))
  "Returns md5sum for a message object of type '<RobotInstruction-request>"
  "a2e1ae7e967fda15b1538c5096b55b1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotInstruction-request)))
  "Returns md5sum for a message object of type 'RobotInstruction-request"
  "a2e1ae7e967fda15b1538c5096b55b1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotInstruction-request>)))
  "Returns full string definition for message of type '<RobotInstruction-request>"
  (cl:format cl:nil "string input_char~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotInstruction-request)))
  "Returns full string definition for message of type 'RobotInstruction-request"
  (cl:format cl:nil "string input_char~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotInstruction-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_char))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotInstruction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotInstruction-request
    (cl:cons ':input_char (input_char msg))
))
;//! \htmlinclude RobotInstruction-response.msg.html

(cl:defclass <RobotInstruction-response> (roslisp-msg-protocol:ros-message)
  ((response_message
    :reader response_message
    :initarg :response_message
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotInstruction-response (<RobotInstruction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotInstruction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotInstruction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name OMX_teleop-srv:<RobotInstruction-response> is deprecated: use OMX_teleop-srv:RobotInstruction-response instead.")))

(cl:ensure-generic-function 'response_message-val :lambda-list '(m))
(cl:defmethod response_message-val ((m <RobotInstruction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader OMX_teleop-srv:response_message-val is deprecated.  Use OMX_teleop-srv:response_message instead.")
  (response_message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotInstruction-response>) ostream)
  "Serializes a message object of type '<RobotInstruction-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'response_message) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotInstruction-response>) istream)
  "Deserializes a message object of type '<RobotInstruction-response>"
    (cl:setf (cl:slot-value msg 'response_message) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotInstruction-response>)))
  "Returns string type for a service object of type '<RobotInstruction-response>"
  "OMX_teleop/RobotInstructionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotInstruction-response)))
  "Returns string type for a service object of type 'RobotInstruction-response"
  "OMX_teleop/RobotInstructionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotInstruction-response>)))
  "Returns md5sum for a message object of type '<RobotInstruction-response>"
  "a2e1ae7e967fda15b1538c5096b55b1f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotInstruction-response)))
  "Returns md5sum for a message object of type 'RobotInstruction-response"
  "a2e1ae7e967fda15b1538c5096b55b1f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotInstruction-response>)))
  "Returns full string definition for message of type '<RobotInstruction-response>"
  (cl:format cl:nil "bool response_message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotInstruction-response)))
  "Returns full string definition for message of type 'RobotInstruction-response"
  (cl:format cl:nil "bool response_message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotInstruction-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotInstruction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotInstruction-response
    (cl:cons ':response_message (response_message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotInstruction)))
  'RobotInstruction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotInstruction)))
  'RobotInstruction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotInstruction)))
  "Returns string type for a service object of type '<RobotInstruction>"
  "OMX_teleop/RobotInstruction")