;; Auto-generated. Do not edit!


(when (boundp 'bioin_tacto::bias_srv)
  (if (not (find-package "BIOIN_TACTO"))
    (make-package "BIOIN_TACTO"))
  (shadow 'bias_srv (find-package "BIOIN_TACTO")))
(unless (find-package "BIOIN_TACTO::BIAS_SRV")
  (make-package "BIOIN_TACTO::BIAS_SRV"))
(unless (find-package "BIOIN_TACTO::BIAS_SRVREQUEST")
  (make-package "BIOIN_TACTO::BIAS_SRVREQUEST"))
(unless (find-package "BIOIN_TACTO::BIAS_SRVRESPONSE")
  (make-package "BIOIN_TACTO::BIAS_SRVRESPONSE"))

(in-package "ROS")





(defclass bioin_tacto::bias_srvRequest
  :super ros::object
  :slots (_num_secs ))

(defmethod bioin_tacto::bias_srvRequest
  (:init
   (&key
    ((:num_secs __num_secs) 0)
    )
   (send-super :init)
   (setq _num_secs (round __num_secs))
   self)
  (:num_secs
   (&optional __num_secs)
   (if __num_secs (setq _num_secs __num_secs)) _num_secs)
  (:serialization-length
   ()
   (+
    ;; int16 _num_secs
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _num_secs
       (write-word _num_secs s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _num_secs
     (setq _num_secs (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass bioin_tacto::bias_srvResponse
  :super ros::object
  :slots (_b_ax _b_ay _b_az _b_gx _b_gy _b_gz ))

(defmethod bioin_tacto::bias_srvResponse
  (:init
   (&key
    ((:b_ax __b_ax) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:b_ay __b_ay) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:b_az __b_az) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:b_gx __b_gx) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:b_gy __b_gy) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:b_gz __b_gz) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _b_ax __b_ax)
   (setq _b_ay __b_ay)
   (setq _b_az __b_az)
   (setq _b_gx __b_gx)
   (setq _b_gy __b_gy)
   (setq _b_gz __b_gz)
   self)
  (:b_ax
   (&optional __b_ax)
   (if __b_ax (setq _b_ax __b_ax)) _b_ax)
  (:b_ay
   (&optional __b_ay)
   (if __b_ay (setq _b_ay __b_ay)) _b_ay)
  (:b_az
   (&optional __b_az)
   (if __b_az (setq _b_az __b_az)) _b_az)
  (:b_gx
   (&optional __b_gx)
   (if __b_gx (setq _b_gx __b_gx)) _b_gx)
  (:b_gy
   (&optional __b_gy)
   (if __b_gy (setq _b_gy __b_gy)) _b_gy)
  (:b_gz
   (&optional __b_gz)
   (if __b_gz (setq _b_gz __b_gz)) _b_gz)
  (:serialization-length
   ()
   (+
    ;; float32[] _b_ax
    (* 4    (length _b_ax)) 4
    ;; float32[] _b_ay
    (* 4    (length _b_ay)) 4
    ;; float32[] _b_az
    (* 4    (length _b_az)) 4
    ;; float32[] _b_gx
    (* 4    (length _b_gx)) 4
    ;; float32[] _b_gy
    (* 4    (length _b_gy)) 4
    ;; float32[] _b_gz
    (* 4    (length _b_gz)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _b_ax
     (write-long (length _b_ax) s)
     (dotimes (i (length _b_ax))
       (sys::poke (elt _b_ax i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _b_ay
     (write-long (length _b_ay) s)
     (dotimes (i (length _b_ay))
       (sys::poke (elt _b_ay i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _b_az
     (write-long (length _b_az) s)
     (dotimes (i (length _b_az))
       (sys::poke (elt _b_az i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _b_gx
     (write-long (length _b_gx) s)
     (dotimes (i (length _b_gx))
       (sys::poke (elt _b_gx i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _b_gy
     (write-long (length _b_gy) s)
     (dotimes (i (length _b_gy))
       (sys::poke (elt _b_gy i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _b_gz
     (write-long (length _b_gz) s)
     (dotimes (i (length _b_gz))
       (sys::poke (elt _b_gz i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _b_ax
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b_ax (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b_ax i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _b_ay
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b_ay (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b_ay i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _b_az
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b_az (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b_az i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _b_gx
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b_gx (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b_gx i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _b_gy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b_gy (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b_gy i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _b_gz
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b_gz (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b_gz i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass bioin_tacto::bias_srv
  :super ros::object
  :slots ())

(setf (get bioin_tacto::bias_srv :md5sum-) "0d0a8123fd19891ee9460281609e26cf")
(setf (get bioin_tacto::bias_srv :datatype-) "bioin_tacto/bias_srv")
(setf (get bioin_tacto::bias_srv :request) bioin_tacto::bias_srvRequest)
(setf (get bioin_tacto::bias_srv :response) bioin_tacto::bias_srvResponse)

(defmethod bioin_tacto::bias_srvRequest
  (:response () (instance bioin_tacto::bias_srvResponse :init)))

(setf (get bioin_tacto::bias_srvRequest :md5sum-) "0d0a8123fd19891ee9460281609e26cf")
(setf (get bioin_tacto::bias_srvRequest :datatype-) "bioin_tacto/bias_srvRequest")
(setf (get bioin_tacto::bias_srvRequest :definition-)
      "int16 num_secs
---
float32[] b_ax
float32[] b_ay
float32[] b_az
float32[] b_gx
float32[] b_gy
float32[] b_gz
")

(setf (get bioin_tacto::bias_srvResponse :md5sum-) "0d0a8123fd19891ee9460281609e26cf")
(setf (get bioin_tacto::bias_srvResponse :datatype-) "bioin_tacto/bias_srvResponse")
(setf (get bioin_tacto::bias_srvResponse :definition-)
      "int16 num_secs
---
float32[] b_ax
float32[] b_ay
float32[] b_az
float32[] b_gx
float32[] b_gy
float32[] b_gz
")



(provide :bioin_tacto/bias_srv "0d0a8123fd19891ee9460281609e26cf")


