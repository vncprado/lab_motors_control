;; Auto-generated. Do not edit!


(when (boundp 'bioin_tacto::raw_barometer)
  (if (not (find-package "BIOIN_TACTO"))
    (make-package "BIOIN_TACTO"))
  (shadow 'raw_barometer (find-package "BIOIN_TACTO")))
(unless (find-package "BIOIN_TACTO::RAW_BAROMETER")
  (make-package "BIOIN_TACTO::RAW_BAROMETER"))

(in-package "ROS")
;;//! \htmlinclude raw_barometer.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass bioin_tacto::raw_barometer
  :super ros::object
  :slots (_header _sensor_id _tempe _baro_level ))

(defmethod bioin_tacto::raw_barometer
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensor_id __sensor_id) 0)
    ((:tempe __tempe) 0.0)
    ((:baro_level __baro_level) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensor_id (round __sensor_id))
   (setq _tempe (float __tempe))
   (setq _baro_level (float __baro_level))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sensor_id
   (&optional __sensor_id)
   (if __sensor_id (setq _sensor_id __sensor_id)) _sensor_id)
  (:tempe
   (&optional __tempe)
   (if __tempe (setq _tempe __tempe)) _tempe)
  (:baro_level
   (&optional __baro_level)
   (if __baro_level (setq _baro_level __baro_level)) _baro_level)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16 _sensor_id
    2
    ;; float32 _tempe
    4
    ;; float32 _baro_level
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int16 _sensor_id
       (write-word _sensor_id s)
     ;; float32 _tempe
       (sys::poke _tempe (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _baro_level
       (sys::poke _baro_level (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int16 _sensor_id
     (setq _sensor_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _tempe
     (setq _tempe (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _baro_level
     (setq _baro_level (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get bioin_tacto::raw_barometer :md5sum-) "5f8059946af2eac503e357862e785812")
(setf (get bioin_tacto::raw_barometer :datatype-) "bioin_tacto/raw_barometer")
(setf (get bioin_tacto::raw_barometer :definition-)
      "Header header
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



(provide :bioin_tacto/raw_barometer "5f8059946af2eac503e357862e785812")


