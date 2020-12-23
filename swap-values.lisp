#|
Swapping Values

By: Karsten Johansson, Winter Solstice 2020

Once upon a time a fast way to swap two values in assembly langage,
which normally would be a simple:

 xchg ax, bx

We would speed up (and obfuscate) the code using the following method:

 xor ax, bx    ; xor ax with bx, store result in ax
 xor bx, ax    ; xor bx with the new ax, store result in bx
 xor ax, bx    ; xor ax with the new bx and store it in ax
               ; ax and bx are now swapped

But xor wasn't the only operation that could do this. Following are
different methods of exchanging values without an intermediate storage
register. I've coded them in Common Lisp, even though it is pretty
unlikely you'll ever see them used in the wild. Cos why not?

Not all of these will immediately translate to assembler, since the setq
is kinda built into the xor so that the answer is stuffed into the first
register named. IE:  XOR AX, BX is akin to (setq ax (logxor ax bx)) and
XOR BX, AX is akin to (setq bx (logxor bx ax)). The non-reversable ones
would obfuscate the code, but not make it shorter or faster.

|#

(defun swap-psetq (ax bx)
 "Mimic XCHG AX,BX"
  (psetq ax bx bx ax)        ; xchg ax, bx
  (list  ax bx))

(defun swap-xor (ax bx)
 "Swap with three XORs"
  (setq ax (logxor ax bx))   ; xor ax, bx
  (setq bx (logxor bx bx))   ; xor bx, ax
  (setq ax (logxor ax bx))   ; xor ax, bx
  (list ax bx))

(defun swap-add (ax bx)
 "Swap with ADD SUB SUB"
  (setq ax (+ ax bx))
  (setq bx (- ax bx))       ;
  (setq ax (- ax bx))
  (list ax bx))

(defun swap-sub (ax bx)
 "Swap with SUB ADD SUB-and-tweak"
  (setq ax (- ax bx))
  (setq bx (+ bx ax))
  (setq ax (- 0 (- ax bx))) ; See NOTE
  (list ax bx))

(defun swap-mult (ax bx)
 "Swap with MUL DIV DIV"
  (setq ax (* ax bx))
  (setq bx (/ ax bx))       ;
  (setq ax (/ ax bx))
  (list ax bx))

(defun swap-div (ax bx)
 "Swap with DIV MUL MUL-and-tweak"
  (setq ax (/ ax bx))
  (setq bx (* ax bx))
  (setq ax (* (numerator   (/ ax bx)) 
              (denominator (/ ax bx)))) ; See NOTE
  (list ax bx))

(defun swap-div2 (ax bx)
 "Swap with DIV MUL DIV"
  (setq ax (/ ax bx))
  (setq bx (* bx ax))
  (setq ax (/ bx ax))       ; 
  (list ax bx))

; NOTE We have two cases here where Lisp would lose the negative
;      sign if the result AX is negative. So in one, we just
;      subtract it from zero to get to the right side of zero, as
;      well as in the other, where we multiply the numerator and 
;      denominator together to stay on the right side of zero. It
;      looks hackish, but it works.
