;; Auto-generated. Do not edit!


(when (boundp 'OMX_teleop::RobotInstruction)
  (if (not (find-package "OMX_TELEOP"))
    (make-package "OMX_TELEOP"))
  (shadow 'RobotInstruction (find-package "OMX_TELEOP")))
(unless (find-package "OMX_TELEOP::ROBOTINSTRUCTION")
  (make-package "OMX_TELEOP::ROBOTINSTRUCTION"))
(unless (find-package "OMX_TELEOP::ROBOTINSTRUCTIONREQUEST")
  (make-package "OMX_TELEOP::ROBOTINSTRUCTIONREQUEST"))
(unless (find-package "OMX_TELEOP::ROBOTINSTRUCTIONRESPONSE")
  (make-package "OMX_TELEOP::ROBOTINSTRUCTIONRESPONSE"))

(in-package "ROS")





(defclass OMX_teleop::RobotInstructionRequest
  :super ros::object
  :slots (_input_char ))

(defmethod OMX_teleop::RobotInstructionRequest
  (:init
   (&key
    ((:input_char __input_char) "")
    )
   (send-super :init)
   (setq _input_char (string __input_char))
   self)
  (:input_char
   (&optional __input_char)
   (if __input_char (setq _input_char __input_char)) _input_char)
  (:serialization-length
   ()
   (+
    ;; string _input_char
    4 (length _input_char)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input_char
       (write-long (length _input_char) s) (princ _input_char s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input_char
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input_char (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass OMX_teleop::RobotInstructionResponse
  :super ros::object
  :slots (_response_message ))

(defmethod OMX_teleop::RobotInstructionResponse
  (:init
   (&key
    ((:response_message __response_message) nil)
    )
   (send-super :init)
   (setq _response_message __response_message)
   self)
  (:response_message
   (&optional (__response_message :null))
   (if (not (eq __response_message :null)) (setq _response_message __response_message)) _response_message)
  (:serialization-length
   ()
   (+
    ;; bool _response_message
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _response_message
       (if _response_message (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _response_message
     (setq _response_message (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass OMX_teleop::RobotInstruction
  :super ros::object
  :slots ())

(setf (get OMX_teleop::RobotInstruction :md5sum-) "a2e1ae7e967fda15b1538c5096b55b1f")
(setf (get OMX_teleop::RobotInstruction :datatype-) "OMX_teleop/RobotInstruction")
(setf (get OMX_teleop::RobotInstruction :request) OMX_teleop::RobotInstructionRequest)
(setf (get OMX_teleop::RobotInstruction :response) OMX_teleop::RobotInstructionResponse)

(defmethod OMX_teleop::RobotInstructionRequest
  (:response () (instance OMX_teleop::RobotInstructionResponse :init)))

(setf (get OMX_teleop::RobotInstructionRequest :md5sum-) "a2e1ae7e967fda15b1538c5096b55b1f")
(setf (get OMX_teleop::RobotInstructionRequest :datatype-) "OMX_teleop/RobotInstructionRequest")
(setf (get OMX_teleop::RobotInstructionRequest :definition-)
      "string input_char
---
bool response_message

")

(setf (get OMX_teleop::RobotInstructionResponse :md5sum-) "a2e1ae7e967fda15b1538c5096b55b1f")
(setf (get OMX_teleop::RobotInstructionResponse :datatype-) "OMX_teleop/RobotInstructionResponse")
(setf (get OMX_teleop::RobotInstructionResponse :definition-)
      "string input_char
---
bool response_message

")



(provide :OMX_teleop/RobotInstruction "a2e1ae7e967fda15b1538c5096b55b1f")


