
(cl:in-package :asdf)

(defsystem "bioin_tacto-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "bias_srv" :depends-on ("_package_bias_srv"))
    (:file "_package_bias_srv" :depends-on ("_package"))
  ))