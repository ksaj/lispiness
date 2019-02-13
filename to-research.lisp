;;;;
;;;; Stuff found in lisp repos that need further research
;;;;


;; Why is this a thing? What is its purpose above just issuing a '(c)?
(defun copy-cons (c)            ; or recons
  (cons (car c) (cdr c)))

; (copy-cons '(a b c)) => (A B C)


;; 







