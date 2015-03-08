#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Have the program find prime numbers until the user chooses to stop asking for
;;; the next one.
;;;

;;;
;;; Return true if n is prime, else false
;;;
(defun is-prime(n)
	(let ((ret_val t))
		(if (/= 2 n)
			(if (or (> 2 n) (= 0 (mod n 2)))
				(setq ret_val nil)
				(progn
					(setq low_range (+ (sqrt n) 1))
					(loop for a from 3 to low_range by 2 do
						(if (= 0 (mod n a))
							(setq ret_val nil))))))
		(return-from is-prime ret_val)))


;;;
;;; List prime numbers until the user quits
;;;
(let ((n 2) (input ""))
	(loop while (string/= "q" input) do
		(if (= 2 n)
			(setq str "        The first ")
			(setq str "        The next "))

		(format t "~%~%~Aprime number is: ~A~%" str n)
		(format t "~%~%Press <enter> to see the next prime number ('q' to quit): ")
		(setq input (read-line t))
		(if (string/= "q" input)
			(progn
				(setq is_prime nil)
				(loop while (null is_prime) do
					(setq n (+ 1 n))
					(setq is_prime (is-prime n)))))))
