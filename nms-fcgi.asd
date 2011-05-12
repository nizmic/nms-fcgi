(in-package :cl-user)

(asdf:defsystem :nms-fcgi
    :version "0.9.0"
    :serial t
    :components ((:file "packages")
		 (:file "api")))
