#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Enter a number and have the program generate the Fibonacci sequence to that
;;; number or to the Nth number.
;;;

(let ((iterations nil) (cur 1) (last 1) (tmp nil))
    (if (= 0 (list-length *args*))
        (progn
            (format t "How many Fibonacci numbers do you want? ")
            (setq iterations (parse-integer (read-line t))))
        (setq iterations (parse-integer (nth 0 *args*))))

    (loop for a from 1 to iterations do
        (format t "~A~%" cur)
        (setq tmp cur)
        (setq cur (+ cur last))
        (setq last tmp)))
