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

(in-package :nms-fcgi)

(load-shared-object "/usr/lib/libfcgi.so")

(define-alien-type fcgx-request
    (struct fcgx-request
	    (request-id int)
	    (role int)
	    (in (* t))   ; (* t) is like (void *) in C
	    (out (* t))
	    (err (* t))
	    (envp (* c-string))
	    ; C header says not to use anything below
	    (params-ptr (* t))
	    (ipc-fd int)
	    (is-begin-processed int)
	    (keep-connection int)
	    (app-status int)
	    (n-writers int)
	    (flags int)
	    (listen-sock int)))

(define-alien-routine ("FCGX_IsCGI" fcgx-iscgi)
    int)

(define-alien-routine ("FCGX_Init" fcgx-init)
    int)

(define-alien-routine ("FCGX_OpenSocket" fcgx-opensocket)
    int
  (path c-string)
  (backlog int))

(define-alien-routine ("FCGX_InitRequest" fcgx-initrequest)
    int
  (request (* (struct fcgx-request)))
  (sock int)
  (flags int))

(define-alien-routine ("FCGX_Accept_r" fcgx-accept-r)
    int
  (request (* (struct fcgx-request))))

(define-alien-routine ("FCGX_Finish_r" fcgx-finish-r)
    void
  (request (* (struct fcgx-request))))

(define-alien-routine ("FCGX_Free" fcgx-free)
    void
  (request (* (struct fcgx-request)))
  (close int))

(define-alien-routine ("FCGX_Accept" fcgx-accept)
    int
  (in (* (* t)))
  (out (* (* t)))
  (err (* (* t)))
  (envp (* c-string)))

(define-alien-routine ("FCGX_Finish" fcgx-finish)
    void)

(define-alien-routine ("FCGX_StartFilterData" fcgx-startfilterdata)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_SetExitStatus" fcgx-setexitstatus)
    void
  (status int)
  (stream (* t)))

(define-alien-routine ("FCGX_GetParam" fcgx-getparam)
    c-string
  (name c-string)
  (envp (* c-string)))

(define-alien-routine ("FCGX_GetChar" fcgx-getchar)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_UnGetChar" fcgx-ungetchar)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_GetStr" fcgx-getstr)
    int
  (str c-string)
  (n int)
  (stream (* t)))

(define-alien-routine ("FCGX_GetLine" fcgx-getline)
    c-string
  (str c-string)
  (n int)
  (stream (* t)))

(define-alien-routine ("FCGX_HasSeenEOF" fcgx-hasseeneof)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_PutChar" fcgx-putchar)
    int
  (c int)
  (stream (* t)))

(define-alien-routine ("FCGX_PutStr" fcgx-putstr)
    int
  (str c-string)
  (n int)
  (stream (* t)))

(define-alien-routine ("FCGX_PutS" fcgx-puts)
    int
  (str c-string)
  (stream (* t)))

; Apparently there is no easy way to define an alien routine that takes
; a variable number of args. (va_list stuff)  See below link for some
; more info:
;
; http://osdir.com/ml/lisp.steel-bank.general/2005-04/msg00060.html

;; (define-alien-routine ("FCGX_FPrintF" fcgx-fprintf)
;;     int
;;   (stream (* t))
;;   (format c-string)) ; hmm - how to do variable # of args?

(define-alien-routine ("FCGX_FFlush" fcgx-fflush)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_FClose" fcgx-fclose)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_GetError" fcgx-geterror)
    int
  (stream (* t)))

(define-alien-routine ("FCGX_ClearError" fcgx-clearerror)
    void
  (stream (* t)))

(define-alien-routine ("FCGX_CreateWriter" fcgx-createwriter)
    (* t)
  (socket int)
  (request-id int)
  (bufflen int)
  (stream-type int))

(define-alien-routine ("FCGX_FreeStream" fcgx-freestream)
    void
  (stream (* (* t))))

(define-alien-routine ("FCGX_ShutdownPending" fcgx-shutdownpending)
    void)
