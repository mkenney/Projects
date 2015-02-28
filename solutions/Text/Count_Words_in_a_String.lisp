#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Enter a string and the program counts the number of vowels in the text. For
;;; added complexity have it report a sum of each vowel found.
;;;

;;;
;;; Count all the words in a list and print the totals for each word
;;; Still need to cleanup all the non-alphanumeric characters beofore counting
;;;
(defun print-word-count (strs)
	(let ((counts (make-hash-table)))

		(loop for word in strs do
			(setq word (string-downcase word))
				(if (string/= word "")
					(if (eq (gethash (intern word) counts) nil)
						(setf (gethash (intern word) counts) 1)
					; else
						(setf (gethash (intern word) counts) (+ 1 (gethash (intern word) counts)))
					)
				)
		)

		(loop for key being the hash-keys of counts
			using (hash-value value)
			do (format t "~S: ~S~%" key value))

		(format t "~%")))


;;;
;;; Replace strings
;;; From http://cl-cookbook.sourceforge.net/strings.html#manip
;;;
(defun replace-all (string part replacement &key (test #'char=))
	"Returns a new string in which all the occurences of the part is replaced with replacement."
	(with-output-to-string (out)
		(loop with part-length = (length part)
			for old-pos = 0 then (+ pos part-length)
			for pos = (search part string :start2 old-pos :test test)
				do (write-string string out
					:start old-pos
					:end (or pos (length string)))
			when pos do (write-string replacement out)
			while pos)))

;;;
;;; Split a string into a list on a delimiter
;;;
(defun split (chars str &optional (lst nil) (accm ""))
	(cond
		((= (length str) 0) (reverse (cons accm lst)))
		(t
		 (let ((c (char str 0)))
			 (if (member c chars)
				(split chars (subseq str 1) (cons accm lst) "")
			; else
				(split chars (subseq str 1) lst (concatenate 'string accm (string c))))
		))))


;;;
;;; Continuous loop that promps for text and prints the word count.
;;;
(let ((str nil) (strs nil))
	(loop
		(format t "Enter some text and I'll count the words for you ('q' to quit, 'l' to load 'Count_Words_in_a_String.txt'): ")
		(let ((str (read-line t)))
			(if (string= "q" str)
				(return))
			(if (string= "l" str)
				(let ((fp (open "Count_Words_in_a_String.txt" :if-does-not-exist nil)))
					(when fp
						(setq str nil)
						(loop for line = (read-line fp nil)
							while line do
								(setq line (split '(#\space) (string-downcase line)))
								(setq strs (append strs line))
						)
					)
				)
			; else
				(setq strs (split '(#\space) (string-downcase str))))
			;(print str)
			(print-word-count strs)
)))
