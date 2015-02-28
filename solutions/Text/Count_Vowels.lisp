#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Enter a string and the program counts the number of vowels in the text. For
;;; added complexity have it report a sum of each vowel found.
;;;

(defun print-vowel-count (str)
	(let (
        (vowels (list #\a #\e #\i #\o #\u #\y)) ; because coerce returns a list of symbols...
        (counts (make-hash-table)))

        (setq str (coerce str 'list)) ; Split str into a list of symbols
		(loop for vowel in vowels do
			(setf (gethash vowel counts) 0))

		(loop for letter in str do
			(if (find letter vowels :test #'equal)
				(setf (gethash letter counts) (+ 1 (gethash letter counts)))))

		(loop for vowel in vowels do
			(format t "~{~A~^: ~}~%" (list vowel (gethash vowel counts))))
		(format t "~%")))


;;; Continuous loop that promps for strings and prints the vowel count
(let ((str nil))
	(loop
		(format t "Enter a string and I'll count the vowels for you ('q' to quit): ")
		(let ((str (read-line t)))
			(if (string= "q" str)
				(return))
			; else
				(print-vowel-count str))))
