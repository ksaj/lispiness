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

(defun test-grid ()				; Delete funtion and (info) reference when no longer needed.
    "Call (test-grid) to run some tests from REPL. Remove from v1.0."
    (format t "~%Set up cell tests:~%")
    (setf (aref sudoku-grid 0 0) 3)		; This is what a solved cell looks like
    (print (aref sudoku-grid 0 0))
    (setf (aref sudoku-grid 0 1) '(1 3))	; This is what a cell with 2 candidates looks like
    (print (aref sudoku-grid 0 1))
    (setf (aref sudoku-grid 0 2) 0)		; This case shouldn't ever happen, but we should be
    (print (aref sudoku-grid 0 2))		;   able to handle it without croaking
    (setf (aref sudoku-grid 0 3) '(4)) 		; A partly olved cell with only one candidate 
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
    (format t "\(\) Pass if T: ~a~%" (listp (aref sudoku-grid 0 4)))		; NIL is a list, but
    (format t "\(\) Pass if NIL: ~a~%" (consp (aref sudoku-grid 0 4)))		; NIL is not a cons
    (reset-grid)				; clean up
    (terpri))					; Keep as last line for close paren

(defun info ()
    "Help Screen"
    (format t "~%Karsten Johansson's Sudoku Solver  v0.1~%")
    (format t "---------------------------------------~%~%")
    (format t "(reset-grid)	- Blank game grid~%")
    (format t "(test-grid)	- Run some tests~%")	; Will be deleted when no longer needed
    (format t "(test-game)	- Populate with sample game~%")
    (format t "(load-game)	- Not yet...~%")
    (format t "(solve-game)	- One can only hope and dream...~%")
    (format t "(print-game)	- Not yet...~%")
    (format t "sudoku-grid	- Display the current game grid~%~%")
    t)

(defun reset-grid ()
    "Create a blank sudoku grid with all cells set to NIL"
    (setq sudoku-grid (make-array '(9 9))))

(defun test-game ()
    "Populate grid with test game"	; Ugly as sin. Turn into a loop...
    (setf (aref sudoku-grid 0 1) 7)
    (setf (aref sudoku-grid 0 3) 3)
    (setf (aref sudoku-grid 0 5) 6)
    (setf (aref sudoku-grid 0 7) 9)
    (setf (aref sudoku-grid 1 0) 8)
    (setf (aref sudoku-grid 1 4) 4)
    (setf (aref sudoku-grid 1 8) 7)
    (setf (aref sudoku-grid 2 0) 5)
    (setf (aref sudoku-grid 2 1) 1)
    (setf (aref sudoku-grid 2 7) 2)
    (setf (aref sudoku-grid 2 8) 4)
    (setf (aref sudoku-grid 3 0) 4)
    (setf (aref sudoku-grid 3 3) 8)
    (setf (aref sudoku-grid 3 5) 3)
    (setf (aref sudoku-grid 3 8) 2)
    (setf (aref sudoku-grid 4 1) 3)
    (setf (aref sudoku-grid 4 4) 2)
    (setf (aref sudoku-grid 4 7) 5)
    (setf (aref sudoku-grid 5 0) 9)
    (setf (aref sudoku-grid 5 3) 6)
    (setf (aref sudoku-grid 5 5) 5)
    (setf (aref sudoku-grid 5 8) 3)
    (setf (aref sudoku-grid 6 0) 1)
    (setf (aref sudoku-grid 6 1) 5)
    (setf (aref sudoku-grid 6 7) 3)
    (setf (aref sudoku-grid 6 8) 9)
    (setf (aref sudoku-grid 7 0) 3)
    (setf (aref sudoku-grid 7 4) 9)
    (setf (aref sudoku-grid 7 8) 6)
    (setf (aref sudoku-grid 8 1) 2)
    (setf (aref sudoku-grid 8 3) 4)
    (setf (aref sudoku-grid 8 5) 8)
    (setf (aref sudoku-grid 8 7) 7)
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

(reset-grid)			; Start with a blank grid

sudoku-grid


