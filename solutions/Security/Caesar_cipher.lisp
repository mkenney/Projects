#!/usr/bin/env clisp

;;;
;;; https://github.com/mkenney/Projects
;;; Implement a Caesar cipher, both encoding and decoding. The key is an integer
;;; from 1 to 25. This cipher rotates the letters of the alphabet (A to Z). The
;;; encoding replaces each letter with the 1st to 25th next letter in the
;;; alphabet (wrapping Z to A). So key 2 encrypts "HI" to "JK", but key 20
;;; encrypts "HI" to "BC". This simple "monoalphabetic substitution cipher"
;;; provides almost no security, because an attacker who has the encoded message
;;; can either use frequency analysis to guess the key, or just try all 25 keys.
;;;

(defun caesar-encrypt (enc-mode enc-key enc-str)
	(let
		(
			(upper (list #\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z))
			(lower (list #\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z))

			(char-list '())
			(enc-char "")
			(offset 0)
			(pos 0)
			(result-str "")
			(str (coerce enc-str 'list))
		)
		(loop for letter in str do

			; Only act on letters
			(setq enc-char letter)
			(if (or (position letter upper) (position letter lower))

				(progn
					(if (position letter upper)
						(progn
							(setq pos (position letter upper))
							(setq char-list upper)
						)

					; else
						(progn
							(setq pos (position letter lower))
							(setq char-list lower)
						)
					)

					(if (= enc-mode 1)
						(if (> (+ pos enc-key) 25)
							(setq offset (- (+ pos enc-key) 26))
							(setq offset (+ pos enc-key))
						)

					; else
						(if (> 0 (- pos enc-key))
							(setq offset (+ (- pos enc-key) 26))
							(setq offset (- pos enc-key))
						)

					)

					(setq enc-char (string (nth offset char-list)))
					(setq result-str (concatenate 'string result-str enc-char))
				)
			)
		)
		(return-from caesar-encrypt result-str)
	)
)


;;;
;;; Continuous loop that promps for options and prints the encoded or decoded word.
;;;
(loop
	(let ((enc-mode 1) (enc-key 0) (enc-str "") (result-str ""))
		(format t "Enter the encryption mode (1 to encrypt, 2 to decrypt, 'q' to quit): ")

		(setq enc-mode (read-line t))
		(if (string= "q" enc-mode) (return))
		(setq enc-mode (parse-integer enc-mode))

		(if (or (> enc-mode 2) (< enc-mode 1))
			(format t "Invalid encryption mode")

		; else
			(progn
				(format t "Enter the encryption key to use (1 to 25, 'q' to quit): ")

				(setq enc-key (read-line t))
				(if (string= "q" enc-key) (return))
				(setq enc-key (parse-integer enc-key))

				(if (or (> enc-key 25) (< enc-key 1))
					(format t "Invalid encryption mode")

				; else
					(progn
						(format t "Enter the string to ~[encrypt~;decrypt~;~] ('q' to quit): " (- enc-mode 1))
						(setq enc-str (read-line t))
						(if (string= "q" enc-str) (return))
						(setq result-str (caesar-encrypt enc-mode enc-key enc-str))
						(format t "~%~%Result:~%~%~A~%~%" result-str)))))))
