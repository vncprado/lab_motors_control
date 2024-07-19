
(cl:in-package :asdf)

(defsystem "OMX_teleop-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RobotInstruction" :depends-on ("_package_RobotInstruction"))
    (:file "_package_RobotInstruction" :depends-on ("_package"))
  ))