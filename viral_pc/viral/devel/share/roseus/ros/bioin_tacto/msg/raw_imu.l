;; Auto-generated. Do not edit!


(when (boundp 'bioin_tacto::raw_imu)
  (if (not (find-package "BIOIN_TACTO"))
    (make-package "BIOIN_TACTO"))
  (shadow 'raw_imu (find-package "BIOIN_TACTO")))
(unless (find-package "BIOIN_TACTO::RAW_IMU")
  (make-package "BIOIN_TACTO::RAW_IMU"))

(in-package "ROS")
;;//! \htmlinclude raw_imu.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass bioin_tacto::raw_imu
  :super ros::object
  :slots (_header _sensor_id _tempe _ax _ay _az _gx _gy _gz _mx _my _mz ))

(defmethod bioin_tacto::raw_imu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sensor_id __sensor_id) 0)
    ((:tempe __tempe) 0.0)
    ((:ax __ax) 0.0)
    ((:ay __ay) 0.0)
    ((:az __az) 0.0)
    ((:gx __gx) 0.0)
    ((:gy __gy) 0.0)
    ((:gz __gz) 0.0)
    ((:mx __mx) 0.0)
    ((:my __my) 0.0)
    ((:mz __mz) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _sensor_id (round __sensor_id))
   (setq _tempe (float __tempe))
   (setq _ax (float __ax))
   (setq _ay (float __ay))
   (setq _az (float __az))
   (setq _gx (float __gx))
   (setq _gy (float __gy))
   (setq _gz (float __gz))
   (setq _mx (float __mx))
   (setq _my (float __my))
   (setq _mz (float __mz))
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
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:az
   (&optional __az)
   (if __az (setq _az __az)) _az)
  (:gx
   (&optional __gx)
   (if __gx (setq _gx __gx)) _gx)
  (:gy
   (&optional __gy)
   (if __gy (setq _gy __gy)) _gy)
  (:gz
   (&optional __gz)
   (if __gz (setq _gz __gz)) _gz)
  (:mx
   (&optional __mx)
   (if __mx (setq _mx __mx)) _mx)
  (:my
   (&optional __my)
   (if __my (setq _my __my)) _my)
  (:mz
   (&optional __mz)
   (if __mz (setq _mz __mz)) _mz)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int16 _sensor_id
    2
    ;; float32 _tempe
    4
    ;; float32 _ax
    4
    ;; float32 _ay
    4
    ;; float32 _az
    4
    ;; float32 _gx
    4
    ;; float32 _gy
    4
    ;; float32 _gz
    4
    ;; float32 _mx
    4
    ;; float32 _my
    4
    ;; float32 _mz
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
     ;; float32 _ax
       (sys::poke _ax (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ay
       (sys::poke _ay (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _az
       (sys::poke _az (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gx
       (sys::poke _gx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gy
       (sys::poke _gy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gz
       (sys::poke _gz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mx
       (sys::poke _mx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _my
       (sys::poke _my (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mz
       (sys::poke _mz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _ax
     (setq _ax (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ay
     (setq _ay (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _az
     (setq _az (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gx
     (setq _gx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gy
     (setq _gy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gz
     (setq _gz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mx
     (setq _mx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _my
     (setq _my (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mz
     (setq _mz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get bioin_tacto::raw_imu :md5sum-) "51eb1d8b736b5695bb58dc3c4b5e4c55")
(setf (get bioin_tacto::raw_imu :datatype-) "bioin_tacto/raw_imu")
(setf (get bioin_tacto::raw_imu :definition-)
      "Header header
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



(provide :bioin_tacto/raw_imu "51eb1d8b736b5695bb58dc3c4b5e4c55")


