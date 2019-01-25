
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
;;;; If you enter something like: myname rm insecure-greeting.lisp
;;;; it will write: Hello Myname
;;;; and then delete itself. I shit you not.
;;;;
;;;; Quotes make it work right, but this is a very important gotcha.
;;;; Suck it up and don't do this in production code. Bad things will 
;;;; happen.
;;;;
