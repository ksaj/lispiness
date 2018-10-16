#|

This will be about EQU, EQUAL, EQUALP, =, string=, etc, the variant gt and lt constructs, 
as well as pluralization just 'cos it relates in a linguistic sense.

eg:

(format nil "~D tr~:@P/~D win~:P" 7 1)
(format nil "~D tr~:@P/~D win~:P" 1 0)
(format nil "~D tr~:@P/~D win~:P" 1 3)

[01]> (/ (/ 4.0 1 )) 
0.25
[02](/ (/ 4 1 ))
1/4
[03]> (/ 4)
1/4
[04]> (/ 4.0)
0.25

|#

;;
;; How NULL works as a function. I'll call it nullp to avoid clashing
;; with the standard NULL, while still following proper lispy naming 
;; conventions. This also inherently shows why () and NIL are the same.
;;
(defun nullp (x)
  "Really simple way to see why NIL is equiv to an empty list"
  (eq x '()))
;;
;; [01]> (null `a)
;; NIL
;; [02]> (nullp `a)
;; NIL
;; [03]> (null `())
;; T
;; [04]> (nullp `())
;; T
;; [05]> (null nil)
;; T
;; [06]> (nullp nil)
;; T
;;

