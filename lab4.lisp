(defvar n 5) ; matrix size
(defvar last (- n 1)) ; last row or column
(defvar matrix (make-array '(5 5))) ; matrix
(defvar value 1)
(defvar i 0)
(defvar j 0)

(defun test (n)
	; 1st step
	(loop for diag-length from 1 upto n do
		(if (= (mod diag-length 2) 0)
			(let
				(loop for l from 0 upto (- diag-length 1)
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l (- diag-length 1))
						(decf i)
						(incf j)
					)
				)
				(if (= j last)
					(ifcf i)
					; else
					(incf j)
				)
			)
			; else
			(let
				(loop for l from 0 upto (- diag-length 1)
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l (- diag-length 1))
						(incf i)
						(decf j)
					)
				)
				(if (= i last)
					(ifcf j)
					; else
					(incf i)
				)
			)
		)
	)
	; 2nd step
	(loop for diag-length from (- n 1) downto 0 do
		(if (= (mod diag-length 2) 0)
			(let
				(loop for l from 0 upto (- diag-length 1)
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l (- diag-length 1))
						(decf i)
						(incf j)
					)
				)
				(incf i)
			)
			; else
			(let
				(loop for l from 0 upto (- diag-length 1)
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l (- diag-length 1))
						(incf i)
						(decf j)
					)
				)
				(incf j)
			)
		)
	)
)
