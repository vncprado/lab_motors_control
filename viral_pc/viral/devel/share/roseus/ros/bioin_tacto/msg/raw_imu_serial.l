;; Auto-generated. Do not edit!


(when (boundp 'bioin_tacto::raw_imu_serial)
  (if (not (find-package "BIOIN_TACTO"))
    (make-package "BIOIN_TACTO"))
  (shadow 'raw_imu_serial (find-package "BIOIN_TACTO")))
(unless (find-package "BIOIN_TACTO::RAW_IMU_SERIAL")
  (make-package "BIOIN_TACTO::RAW_IMU_SERIAL"))

(in-package "ROS")
;;//! \htmlinclude raw_imu_serial.msg.html


(defclass bioin_tacto::raw_imu_serial
  :super ros::object
  :slots (_imus ))

(defmethod bioin_tacto::raw_imu_serial
  (:init
   (&key
    ((:imus __imus) ())
    )
   (send-super :init)
   (setq _imus __imus)
   self)
  (:imus
   (&rest __imus)
   (if (keywordp (car __imus))
       (send* _imus __imus)
     (progn
       (if __imus (setq _imus (car __imus)))
       _imus)))
  (:serialization-length
   ()
   (+
    ;; bioin_tacto/raw_imu[] _imus
    (apply #'+ (send-all _imus :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bioin_tacto/raw_imu[] _imus
     (write-long (length _imus) s)
     (dolist (elem _imus)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bioin_tacto/raw_imu[] _imus
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _imus (let (r) (dotimes (i n) (push (instance bioin_tacto::raw_imu :init) r)) r))
     (dolist (elem- _imus)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get bioin_tacto::raw_imu_serial :md5sum-) "bf6b782ad59ebe5fad0f029c0e04fc49")
(setf (get bioin_tacto::raw_imu_serial :datatype-) "bioin_tacto/raw_imu_serial")
(setf (get bioin_tacto::raw_imu_serial :definition-)
      "bioin_tacto/raw_imu[] imus

================================================================================
MSG: bioin_tacto/raw_imu
Header header
int16 sensor_id
float32 tempe
float32 ax
float32 ay
float32 az
float32 gx
float32 gy
float32 gz
float32 mx
float32 my
float32 mz

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



(provide :bioin_tacto/raw_imu_serial "bf6b782ad59ebe5fad0f029c0e04fc49")


