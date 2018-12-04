;;;; Just stuff everyone learning ends up coding
;;;; I'll be throwing them all into here since
;;;; they aren't truly worthy of dedicated files.


;; Mathy Stuff ---------------------------------

(defun average (&rest nums)
       "Calculate the average from a sequence of numbers"
       (if (null nums)
            0
            (/ (apply #'+ nums) (length nums))))

(average 19 23 26 47)
         

(defun circle-area (rad)
       "Calculates the area of a circle"
        (* pi rad rad))

(format t "Area of circle with radius of 10 is ~d.~%" (circle-area 10))


(defun factorial (num)
       "Calculates factorial of a number"
       (cond ((zerop num) 1)
             (t (* num (factorial (1- num))))))

(format t "Factorial of 6 is ~d.~%" (factorial 6))


(defun mkrand (x y)
        "Return random uniformly distributed number from range x to y"
        (+ x (random  (1+ (- y x)))))

(mkrand 4 24)


(defun fp-random ()
    "Return random non-zero floating point number less than 1.
     Add to random int if something more than 0.x is needed."
    (/ (the fixnum (random most-positive-fixnum))
            #.(/ most-positive-fixnum 1.0)))

(fp-random)


(defun prime-sieve (maximum)
    "Prime numbers sieve, limiting to odd numbers right from the start. Returns primes up to the input number" 
       (loop :with maxi = (ash (1- maximum) -1)
             :with stop = (ash (isqrt maximum) -1)
             :with sieve = (make-array (1+ maxi) :element-type 'bit :initial-element 0)
             :for i :from 1 :to maxi
             :for odd-number = (1+ (ash i 1))
             :when (zerop (sbit sieve i))
             :collect odd-number :into values
             :when (<= i stop)
             :do (loop :for j :from (* i (1+ i) 2) :to maxi :by odd-number
             :do (setf (sbit sieve j) 1))
             :finally (return (cons 2 values))))

(prime-sieve 1000000)
# obviousoy gets slower and slower as the max number rises. 10000000 starts to challenge raspberry pi memory (but not cpu, so this could be improved on...)


(defun dec-hex (value &optional (size 4))
  "Convert a decimal value to hexadecimal. Number of hex bytes optional."
  (format t "~v,'0X" size value))

(dec-hex 123 2)


(defun dec-bin (value &optional (size 8))
  "Convert a decomal value to binary. Number of bits optional."
  (format t "~v,'0B" size value))

(dec-bin 123)


;; Strings and things

(defun split (string &optional (split-character #\Space))
  "Splits a string into a list of its elements."
  (let ((result '())
        (stream (make-string-output-stream)))
   (loop for char across string
         if (char= char split-character)
         do (push (get-output-stream-string stream) result)
         else
         do (write-char char stream))
   (push (get-output-stream-string stream) result)
   (nreverse result)))

(split "A bunch of things.")
;-> ("A" "bunch" "of" "things.")
(split "A_bunch_of_things." #\_)
;->("A" "bunch" "of" "things.")


(defun kudos ()
     "Returns random string"
     (let ((kudos-str "")
            (kudos))
        (setf kudos-str
              '("String 1"
                "String 2"
                "String 3"
                "String 4"
                "String n"))
        (setf kudos (nth (random (length kudos-str)) kudos-str))
        (format t kudos)))

(kudos)


(defun piglatin (word)
   "Convert a word to its Pig Latin form"
   (let* ((init (char word 0)))
     (if (find init "aeiou")
         (concatenate 'string word "way")
         (concatenate 'string (subseq word 1) (subseq word 0 1) "ay"))))

(piglatin "index")
(piglatin "windex")
(piglatin "ant")
(piglatin "want")


(defun random-from-list (list)
   "Input a list, Output a random item from that list"
    (nth (random (length list)) list))

(random-from-list '(one two three))


; Applying AND to a list. AND is a macro, so it can't be applied to a list.
; However, either (every #'identity list) or (notany #'null list) will accomplish
; the same thing, returnung T if no items are NIL. Will probably need this in my
; Sudoku project.

;; Handy hacks that don't fit in the other categories

(defmacro nop (&body body)
    "No OPeration. For adding comments inside macros, etc."
    (declare (ignore body)))

(nop this is a comment string)


(defun leap-year-p (year)
    "Check if input is a leap year"
    (cond ((zerop (rem year 400)))
          ((zerop (rem year 100)) nil)
          ((zerop (rem year 4)))
          (t nil)))

(leap-year-p 1984)


(defun fahrenheit->celsius (temp)
    "Convert a number in Celsius to Fahrenheit"
    (format nil "~1$" (* (- temp 32) .55)))

(fahrenheit->celsius 60)


(defun celsius->fahrenheit (temp)
  "Convert a number in Fahrenheit to Celsius"
  (format nil "~1$" (+ (* 60 1.8) 32)))

(celsius->fahrenheit 60)


;; Games and other diversions

(defun rock-paper-scissors (a b)
    "Input both player's choice of rock, paper, or scissors. Output who wins, or if they tie."
    (cond ((or (and (eq a 'paper)    (eq b 'rock))
               (and (eq a 'rock)     (eq b 'scissors))
               (and (eq a 'scissors) (eq b 'paper)))   'player-1)
          ((or (and (eq a 'scissors) (eq b 'rock))
               (and (eq a 'paper)    (eq b 'scissors))
               (and (eq a 'rock)     (eq b 'paper)))   'player-2)
          ((eq a b) 'tie)))

(rock-paper-scissors 'rock 'paper)

