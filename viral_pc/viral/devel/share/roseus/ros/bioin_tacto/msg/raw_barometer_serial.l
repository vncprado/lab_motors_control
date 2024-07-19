;; Auto-generated. Do not edit!


(when (boundp 'bioin_tacto::raw_barometer_serial)
  (if (not (find-package "BIOIN_TACTO"))
    (make-package "BIOIN_TACTO"))
  (shadow 'raw_barometer_serial (find-package "BIOIN_TACTO")))
(unless (find-package "BIOIN_TACTO::RAW_BAROMETER_SERIAL")
  (make-package "BIOIN_TACTO::RAW_BAROMETER_SERIAL"))

(in-package "ROS")
;;//! \htmlinclude raw_barometer_serial.msg.html


(defclass bioin_tacto::raw_barometer_serial
  :super ros::object
  :slots (_baros ))

(defmethod bioin_tacto::raw_barometer_serial
  (:init
   (&key
    ((:baros __baros) ())
    )
   (send-super :init)
   (setq _baros __baros)
   self)
  (:baros
   (&rest __baros)
   (if (keywordp (car __baros))
       (send* _baros __baros)
     (progn
       (if __baros (setq _baros (car __baros)))
       _baros)))
  (:serialization-length
   ()
   (+
    ;; bioin_tacto/raw_barometer[] _baros
    (apply #'+ (send-all _baros :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bioin_tacto/raw_barometer[] _baros
     (write-long (length _baros) s)
     (dolist (elem _baros)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bioin_tacto/raw_barometer[] _baros
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _baros (let (r) (dotimes (i n) (push (instance bioin_tacto::raw_barometer :init) r)) r))
     (dolist (elem- _baros)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get bioin_tacto::raw_barometer_serial :md5sum-) "7f630d488162f2fb9ae8cc4e653b1937")
(setf (get bioin_tacto::raw_barometer_serial :datatype-) "bioin_tacto/raw_barometer_serial")
(setf (get bioin_tacto::raw_barometer_serial :definition-)
      "bioin_tacto/raw_barometer[] baros

================================================================================
MSG: bioin_tacto/raw_barometer
Header header
int16 sensor_id
float32 tempe
float32 baro_level

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :bioin_tacto/raw_barometer_serial "7f630d488162f2fb9ae8cc4e653b1937")


