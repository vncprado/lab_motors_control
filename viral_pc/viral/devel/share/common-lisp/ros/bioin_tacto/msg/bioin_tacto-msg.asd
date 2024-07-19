
(cl:in-package :asdf)

(defsystem "bioin_tacto-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "raw_barometer" :depends-on ("_package_raw_barometer"))
    (:file "_package_raw_barometer" :depends-on ("_package"))
    (:file "raw_barometer_serial" :depends-on ("_package_raw_barometer_serial"))
    (:file "_package_raw_barometer_serial" :depends-on ("_package"))
    (:file "raw_imu" :depends-on ("_package_raw_imu"))
    (:file "_package_raw_imu" :depends-on ("_package"))
    (:file "raw_imu_serial" :depends-on ("_package_raw_imu_serial"))
    (:file "_package_raw_imu_serial" :depends-on ("_package"))
  ))