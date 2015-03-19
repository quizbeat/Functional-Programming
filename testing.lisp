(defun fact (x)
    (if (= x 0)
        1
        (* x (fact (decf x 1)))
    )
)
