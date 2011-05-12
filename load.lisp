(in-package :cl-user)

(defvar *nms-fcgi-library-dir*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(let ((html-template-base-directory
       (make-pathname :name nil :type nil :version nil
		      :defaults (parse-namestring *load-truename*)))
      must-compile)
  (with-compilation-unit ()
    (loop for file in '("packages"
                        "api")
       do (let ((pathname (make-pathname :name file :type "lisp" :version nil
					 :defaults html-template-base-directory)))
	    #-:cormanlisp
	    (let ((compiled-pathname (compile-file-pathname pathname)))
	      (unless (and (not must-compile)
			   (probe-file compiled-pathname)
			   (< (file-write-date pathname)
			      (file-write-date compiled-pathname)))
		(setq must-compile t)
		(compile-file pathname))
	      (setq pathname compiled-pathname))
	    (load pathname)))))
