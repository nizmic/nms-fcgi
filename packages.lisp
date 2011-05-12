(in-package :cl-user)

(defpackage :nms-fcgi
  (:use :common-lisp
	:sb-alien)
  (:export :fcgx-request
	   :fcgx-iscgi
	   :fcgx-init
	   :fcgx-opensocket
	   :fcgx-initrequest
	   :fcgx-accept-r
	   :fcgx-finish-r
	   :fcgx-free
	   :fcgx-accept
	   :fcgx-finish
	   :fcgx-startfilterdata
	   :fcgx-setexitstatus
	   :fcgx-getparam
	   :fcgx-getchar
	   :fcgx-ungetchar
	   :fcgx-getstr
	   :fcgx-getline
	   :fcgx-hasseeneof
	   :fcgx-putchar
	   :fcgx-putstr
	   :fcgx-puts
	   :fcgx-fflush
	   :fcgx-fclose
	   :fcgx-geterror
	   :fcgx-clearerror
	   :fcgx-createwriter
	   :fcgx-freestream
	   :fcgx-shutdownpending))
