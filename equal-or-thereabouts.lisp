#|

WIP: Don't refer to this document yet. If you use it and it formats your hard drive...

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

; More Notes:
#|
* Use eql to compare Symbols, Pointers (such as Pointers to Lists), and Integers
* Use = to compare most numeric values
* Use string-equal for case-insensitive String comparison
* Use string= for case-sensitive String comparison
* Use equal to compare other types of objects (such as Lists and single characters)
* For comparing floating-point Numbers which may differ by a very small margin, but should still be considered equal, the safest technique is to take the absolute value of their difference, and compare this with an “epsilon” value within a tolerance of zero. In Figure 3.2 is a simple Function which does this, which assumes that a global parameter is defined, *zero-epsilon*, as a numeric value very close to zero:
```lisp
(defun nearly-equal? (num1 num2
                      &optional
                      (tolerance *zero-epsilon*))
  (< (abs (- num1 num2)) tolerance))
```
|#
