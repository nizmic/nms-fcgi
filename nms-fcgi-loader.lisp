(defvar *nms-fcgi-library-dir*
  (make-pathname :name nil :type nil :defaults *load-truename*))

(load (merge-pathnames "nms-fcgi-package.lisp" *nms-fcgi-library-dir*))
(load (merge-pathnames "nms-fcgi.lisp" *nms-fcgi-library-dir*))
