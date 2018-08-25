#|    Karsten Johansson's Sudoku Solver  v0.1
      =======================================

Soon to be yet another sudoku solver. It'll pretty much mimic how
I solve them IRL. Then I will have it take advantage of MPI on my
pi cluster.

Right now, does nothing but create and test the grid.

TODO:	- Subject to change on a whim
-----
DONE	- Set up grid and initial (test-grid) 
DONE	- Improve the listp tests 
DONE	- Start (info)
	- (reset-grid) - blank out the grid
	- (print-game) - output in standard game format
	- (test-game) - populate board w/ a built-in solvable game
	- (load-game '<filename>) 
	- (solve-game) 
	- Loop count to abort when stuck in puzzle we can't solve
        - Load single game from file w/ multiple boards
	- MPI

|#

(setq sudoku-grid (make-array '(9 9) :initial-contents
    `(((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))
      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))
      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))

      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))
      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))
      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))

      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))
      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0))
      ((0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)   (0 0) (0 0) (0 0)))))

(defun test-grid ()
    "Call (test-grid) to run some tests from REPL"
    (format t "~%~%Set up cell tests:~%")
    (setf (aref sudoku-grid 0 0) 3)
    (print (aref sudoku-grid 0 0))
    (setf (aref sudoku-grid 0 1) '(0 1 3))
    (print (aref sudoku-grid 0 1))
    (setf (aref sudoku-grid 0 2) 0)
    (print (aref sudoku-grid 0 2))
    (setf (aref sudoku-grid 0 3) '(4))  
    (print (aref sudoku-grid 0 3))
    (setf (aref sudoku-grid 0 4) '())
    (print (aref sudoku-grid 0 4))
    (terpri)
    (print sudoku-grid)				; View the test grid
    (format t "~%~%listp tests:~%")		; Make sure we can detect candidate list vs. solved cell
    (format t "3 Pass if NIL: ~a~%" (listp (aref sudoku-grid 0 0)))
    (format t "\(0 1 3\) Pass if T: ~a~%"(listp (aref sudoku-grid 0 1)))
    (format t "0 Pass if NIL: ~a~%" (listp (aref sudoku-grid 0 2)))
    (format t "\(4\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 3)))
    (format t "\(\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 4)))
    )						; On separate line to facilitate additions

(defun info ()
    "Help Screen"
    (format t "~%Karsten Johansson's Sudoku Solver  v0.1~%")
    (format t "---------------------------------------~%~%")
    (format t "Nothing here yet.~%~%")
    t)

;;;
;;; Begins...
;;;

; (test-grid)					; Here for quick testing on startup. 



