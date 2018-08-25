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
	- (reset-grid) - zero out the matrix
	- (print-game) - output in standard game format
	- (test-game) - populate board w/ a build-in solvable game
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
    (print sudoku-grid)
    (format t "~%~%listp tests:~%")
    (format t "3 Pass if NIL: ~a~%" (listp (aref sudoku-grid 0 0)))	; 3 should be  NIL 
    (format t "\(0 1 3\) Pass if T: ~a~%"(listp (aref sudoku-grid 0 1)))		; (0 1 3) should be T   
    (format t "0 Pass if NIL: ~a~%" (listp (aref sudoku-grid 0 2)))	; 0 should be NIL 
    (format t "\(4\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 3)))		; (4) should be T
    (format t "\(\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 4)))		; () should be T
    )	; On separate line to facilitate additions

(test-grid)				; DEBUG



