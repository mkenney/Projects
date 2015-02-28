#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Implement two types of sorting algorithms: Merge sort and bubble sort.
;;; - This is the merge sort version
;;;
;;; Disclaimer: I don't know anything at all about Lisp so please forgive my
;;; code style, wrong methods and my lists in general :)  I was mostly
;;; interested in the stdin loop anyway.
;;;

(defun merge-sort (arr)
	"Split out the array parts and pass them to merge for sorting"
	(let ((mid (floor (length arr) 2)))
		(if (> mid 0)
			(return-from merge-sort (merge
				'list
				(merge-sort (subseq arr 0 mid))
				(merge-sort (subseq arr mid))
				#'string-lessp
			))

		; else
			(return-from merge-sort arr))))


;;; Continuous loop that promps for strings to add to the list unil "s" is
;;; encountered, then it sorts.  This was really hard to figure out from
;;; scratch.
(let ((arr nil))
	(loop
		(format t "Enter a value add it to the list of values ('s' to sort current values, 'q' to quit): ")
		(let ((item (read-line t)))
			(if (string= "q" item)
				(return))
			(if (string= "s" item)
				(progn
					(setq arr (merge-sort arr))
					(format t "~{~A~^, ~}~%~%" arr)
					(setq arr '())
				)

			; else
				(push item arr)))))
