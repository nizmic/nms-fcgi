(in-package :cl-user)

(asdf:defsystem :nms-fcgi
    :version "0.1.0"
    :serial t
    :components ((:file "packages")
		 (:file "api")))
