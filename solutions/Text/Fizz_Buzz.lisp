#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Write a program that prints the numbers from 1 to 100. But for multiples of
;;; three print "Fizz" instead of the number and for the multiples of five print
;;; "Buzz". For numbers which are multiples of both three and five print
;;; "FizzBuzz".
;;;

(loop for a from 1 to 100 do
	(if (and (< 0 (mod a 3)) (< 0 (mod a 5)))
		(format t "~A" a)
		(progn
			(if (= 0 (mod a 3))
				(format t "Fizz"))
			(if (= 0 (mod a 5))
				(format t "Buzz"))))
	(format t "~%"))
