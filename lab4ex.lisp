(defvar n 5) ; matrix size
(defvar last (- n 1)) ; last row or column
(defvar matrix (make-array '(5 5))) ; matrix
(defvar value 1)
(defvar i 0)
(defvar j 0)

(defun mprint (board)
  (loop for i below (car (array-dimensions board)) do
        (loop for j below (cadr (array-dimensions board)) do
          (let ((cell (aref board i j)))
            (format t "~a " cell)))
        (format t "~%")))

(defun test ()
	; 1st step
	(loop for diag-length from 1 to n do
		(if (evenp diag-length)
			(let ((end (- diag-length 1)))
				(loop for l from 0 to end do
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l end)
                        (do () ((decf i) (incf j)))
					)
				)
				(if (= j last)
					(incf i)
					; else
					(incf j)
				)
			)
			; else
			(let ((end (- diag-length 1)))
				(loop for l from 0 to end do
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l end)
                        (do () ((incf i)(decf j)))
					)
				)
				(if (= i last)
					(incf j)
					; else
					(incf i)
				)
			)
		)
	)
	; 2nd step
	(loop for diag-length from last to 1 do
		(if (evenp diag-length)
			(let ((end (- diag-length 1)))
				(loop for l from 0 to end do
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l end)
						(do () ((decf i) (incf j)))
					)
				)
				(incf i)
			)
			; else
			(let ((end (- diag-length 1)))
				(loop for l from 0 to end do
					(setf (aref matrix i j) value)
					(incf value)
					(if (/= l end)
						(do () ((incf i) (decf j)))
					)
				)
				(incf j)
			)
		)
	)
)
