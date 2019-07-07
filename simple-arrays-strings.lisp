; Here's a bit of a mystery challenge. A string 
; is a vector, as can be seen here:

(char "0123456789" 5)  ; access a character
; => #\5

(aref "0123456789" 5)  ; access a vector element
; => #\5

(describe '"0123456789")  ; with or without the '
; => "0123456789" is a simple 1 dimensional array 
; (vector) of CHARACTERs, of size
; 10 (a ISO-8859-1 string).

; You heard it from the horse's mouth. BUT,
; svref says it *isn't* a simple vector:

(svref "0123456789" 5) ; with or without the '
; *** - SVREF: "0123456789" is not a SIMPLE-VECTOR
; The following restarts are available:
; ABORT          :R1      Abort main loop
; Break 1 [3] >

; Anyone able to explain why that is? I'll update
; this file if I ever find out.

; It might be interesting to fuzz char and aref 
; to see if there are cases where one is more
; efficient than the other,

