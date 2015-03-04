#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; The Factorial of a positive integer, n, is defined as the product of the
;;; sequence n, n-1, n-2, ...1 and the factorial of zero, 0, is defined as being
;;; 1. Solve this using both loops and recursion.
;;;

(defun fact-recurse (num)
	(if (> 2 num) (return-from fact-recurse 1))
	(return-from fact-recurse (* num (fact-recurse (- num 1)))))


(defun fact-loop (num)
	(let ((ret-val num))
		(if (> 2 num)
			(setq ret-val 1)
			(loop for a from 2 to num do
				(setq ret-val (* ret-val (- a 1)))))
		(return-from fact-loop ret-val)))


;;;
;;; Continuous loop that promps for an integer and calculates it's factorial
;;;
(loop
	(format t "~%Enter a positive integer to calculate the factorial for ('q' to quit): ")
	(setq num (read-line t))
	(if (string= "q" num) (return))
	(setq num (parse-integer num))

	(format t "~%~%    Factorial found using recursion method: ~A~%" (fact-recurse num))
	(format t "~%~%    Factorial found using iteration method: ~A~%" (fact-loop num)))
