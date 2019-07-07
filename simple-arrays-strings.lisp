; Here's a bit of a mystery challenge. A string 
; is a vector, as can be seen here:

(char "0123456789" 5)  ; access a character
; => #\5

(aref "0123456789" 5)  ; access a vector element
; => #\5

; But oddly, it isn't a SIMPLE vector:

(svref "0123456789" 5)
; *** - SVREF: "0123456789" is not a SIMPLE-VECTOR
; The following restarts are available:
; ABORT          :R1      Abort main loop
; Break 1 [3] >

; Anyone able to explain why that is? I'll update
; this file if I ever find out.

; It might be interesting to fuzz char and aref 
; to see if there are cases where one is more
; efficient than the other,

