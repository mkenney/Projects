#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Checks if the string entered by the user is a palindrome. That is that it
;;; reads the same forwards as backwards like "racecar"
;;;

(defun is-palindrome (word)
	(setq word (string-downcase word))
	(let
		(
			(word-symbols (coerce word 'list))
			(counter 0)
		)

		(loop for letter in word-symbols do
			(if (string/= letter (nth (- (- (list-length word-symbols) counter) 1) word-symbols))
				(return-from is-palindrome nil))
			(setq counter (+ 1 counter)))

		(return-from is-palindrome t)))


;;;
;;; Continuous loop that promps for options and prints the encoded or decoded word.
;;;
(loop
	(let ((word "") (result nil))
		(format t "~%Enter the word to check ('q' to quit): ")
		(setq word (read-line t))
		(if (string= "q" word) (return))

		(if (is-palindrome word)
			(format t "~%~%    '~A' is a palindrome!~%~%" word)
			(format t "~%~%    '~A' is NOT a palindrome :(~%~%" word))))
