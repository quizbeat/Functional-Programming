(defvar tolerance 0.00001)
(defconstant start 6.9)

(defun func (x)
    (+ 1 (/ 1 x))
)

(defun fixed-point (f first-guess)
    (labels (
        (close-enough-p (x y)
            (<= (abs (- x y)) tolerance))
        (try (guess)
            (let ((next (funcall f guess)))
                (if (close-enough-p guess next)
                    next
                    (try next)
                )
            )
        ))
        (try first-guess)
    )
)

(defun golden-ratio ()
    (fixed-point #'func start)
)
