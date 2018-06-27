;;;; Basically I haven't written LISP since the early
;;;; 90's and have decided to get back to it since I
;;;; was always able to get results just about as fast
;;;; as I could think up potential solutions.
;;;;
;;;; Go ahead and glean what you will from my 
;;;; re-progress. Since Lisp has grown, I'm starting
;;;; over. I'll include notes from really important
;;;; stuff I remember from 'way_back_when. Including
;;;; the security warning at the end of this first 
;;;; program.

(setq *print-case* :capitalize)         ; pretty looking input

;;; Function for creating the output
(defun heya (name)
        (format t "Yo, ~a.~%" name))    ; BTW: ~% is \n

;;; Get some input. * read the warning below
(format t "Halt! Who goes there? ")
(defvar *name* (read))

;;; Deliver the goods
(heya *name*)

;;;;
;;;; WARNING
;;;; -------
;;;;
;;;; If you enter something like: myname rm 1.lisp
;;;; it will write: Hello Myname
;;;; and then delete itself. I shit you not.
;;;;
;;;; Quotes make it work right, but this is a very important gotcha.
;;;; Suck it up and don't do this in production code. Bad things will 
;;;; happen.  Welcome to Secure Coding 101.
;;;;
