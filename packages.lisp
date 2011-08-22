;;; Copyright (c) 2010-2011, Nathan Sullivan.  All rights reserved.

;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:

;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.

;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.

;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package :cl-user)

(defpackage :nms-fcgi
  (:use :common-lisp
	:sb-alien
	:sb-gray)
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
	   :fcgx-shutdownpending
	   :fcgi-stream
	   :make-stream-from-fcgx-request-out
	   :make-stream-from-fcgx-request-err
	   :stream-write-string
	   :stream-write-char
	   :stream-write-length
	   :stream-write-column))
