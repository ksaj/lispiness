#|    Karsten Johansson's Sudoku Solver  v0.1
      =======================================

Soon to be yet another sudoku solver. It'll pretty much mimic how
I solve them IRL. Then I will have it take advantage of MPI on my
pi cluster.

Right now, does nothing but create and test the grid.

TODO:	- Subject to change on a whim
-----
DONE	- Set up grid and initial (test-grid) 
DONE	- Start (info)
	- (test-game) - populate board w/ a built-in solvable game
	- (print-game) - output in standard game format
	- (load-game '<filename>) 
	- (solve-game) 
	- Loop count to abort when stuck in puzzle we can't solve
        - Load specific or random game from multi-game text file
	- Enable command line executable functionality 
	- MPI
|#

(setq sudoku-grid (make-array '(9 9)))

(defun test-grid ()
    "Call (test-grid) to run some tests from REPL. Remove from v1.0."
    (format t "~%Set up cell tests:~%")
    (setf (aref sudoku-grid 0 0) 3)		; This is what a solved cell looks like
    (print (aref sudoku-grid 0 0))
    (setf (aref sudoku-grid 0 1) '(1 3))	; This is what a cell with 2 candidates looks like
    (print (aref sudoku-grid 0 1))
    (setf (aref sudoku-grid 0 2) 0)		; This case shouldn't ever happen, but we should be
    (print (aref sudoku-grid 0 2))		;   able to handle it without croaking
    (setf (aref sudoku-grid 0 3) '(4)) 		; This case as well... 
    (print (aref sudoku-grid 0 3))
    (setf (aref sudoku-grid 0 4) '())		; Nil is the default, so that sure better work well
    (print (aref sudoku-grid 0 4))
    (fresh-line)
    (print sudoku-grid)				; Display the test grid
    (fresh-line)
    (format t "~%listp tests:~%~%")		; Make sure we can detect candidate list vs. solved
    (format t "3 Pass if NIL: ~a~%" (listp (aref sudoku-grid 0 0)))		; cell.  Useless if
    (format t "\(0 1 3\) Pass if T: ~a~%"(listp (aref sudoku-grid 0 1)))	; we can't...
    (format t "0 Pass if NIL: ~a~%" (listp (aref sudoku-grid 0 2)))
    (format t "\(4\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 3)))
    (format t "\(\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 4)))
    (terpri))					; Keep as last line for close paren

(defun info ()
    "Help Screen"
    (format t "~%Karsten Johansson's Sudoku Solver  v0.1~%")
    (format t "---------------------------------------~%~%")
    (format t "Nothing here yet.~%~%")
    t)

(defun test-game ()
    "Populate grid with test game"
    (print "Coming next...")
    t)

;; Solve Strategies

(defun sure-thing-rows ()	; will eventally run concurrently
    "Search rows for cases with only one possible candidate. Return solution to pencil"
    (print "Coming Soon...")
    )

(defun sure-thing-cols ()	; will eventally run concurrently
      "Search columns for cases with only one possible candidate. Return solution to pencil"
      (print "Coming Soon...")
      )

(defun twin-pairs ()		; will eventally run concurrently
    "Search each box for twin pairs. Return candidates as lists to pencil. If solution found,
     return as non-list digit."
    (print "Coming Soon...")
    )

(defun unk-strategy ()		; will eventually run concurrntly
    "Not sure which strategy will go here yet, but one more strategy is needed before we
     resort to guessing. Will get to this last."
    (print "Coming eventually...")
    )

(defun pencil ()		; will be run from dispach loop
    "Collect output from twin-pairs and sure-thing-*, and apply them to sudoku-grid. Return 
     updated sudoku grid to dispacher and repeat until fully solved or stuck. Seems roundabout, 
     but this will prep for mpi concurrency later"
    (print "Coming Soon...")
    )

(defun eraser ()		; probably will be run from twin-pairs
    "Clean up solved or partly solved twin-pair lists. Might conduct other per-loop fixes
    and adjustments as required. For example, sometimes twin-pairs lists will have a third
    candidate that can be canceled out to solve a third cell."
    (print "coming Soon...")
    )

;;;
;;; The Action Begins...
;;;

sudoku-grid


