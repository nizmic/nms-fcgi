(in-package :cl-user)

(defvar *nms-fcgi-library-dir*
  (make-pathname :name nil :type nil :version nil :defaults *load-truename*))

(with-compilation-unit ()
  (loop for file in '("packages"
		      "api")
       do (let ((pathname (make-pathname :name file
					 :type "lisp"
					 :version nil
					 :defaults *nms-fcgi-library-dir*)))
	    (let ((compiled-pathname (compile-file-pathname pathname)))
	      (unless (and (probe-file compiled-pathname)
			   (< (file-write-date pathname)
			      (file-write-date compiled-pathname)))
		(compile-file pathname))
	      (load compiled-pathname)))))
