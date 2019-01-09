;;;; Self-Replicating Code That Cleans Up After Itself...

;;;; An interactive Quine in Clojure 
;;;; http://blog.klipse.tech/clojure/2019/01/08/quines-in-clojure.html

;;;; Refactored for Common Lisp by Karsten Johansson.

((LAMBDA (X) (LIST X (LIST 'QUOTE X))) '(LAMBDA (X) (LIST X (LIST 'QUOTE X))))

