;;;; Just stuff everyone learning ends up coding
;;;; I'll be throwing them all into here since
;;;; they aren't truly worthy of dedicated files.


;; Mathy Stuff ---------------------------------

(defun circle-area (rad)
       "Calculates the area of a circle"
        (* pi rad rad))

(format t "Area of circle with radius of 10 is ~d.~%" (circle-area 10))


(defun factorial (num)
       "Calculates factorial of a number"
       (cond ((zerop num) 1)
             (t (* num (factorial (- num 1))))))

(format t "Factorial of 6 is ~d.~%" (factorial 6))

