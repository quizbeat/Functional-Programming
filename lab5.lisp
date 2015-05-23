(defun single-arg (expr) ;; checks for unary operator
  (and (not (null expr)) (not (null (rest expr))) (null (rest (rest expr))))
)

(defun form-to-postfix (expr) 
  (if (listp expr)
      (if (single-arg expr)
          (if (eq (first expr) '- )
              (concatenate 'string "0 "(princ-to-string (form-to-postfix (second expr))) " -")
              (concatenate 'string "1 " (princ-to-string (form-to-postfix (second expr))) " /")
          )
          (concatenate 'string (proc-args (rest expr)) " " 
                       (string-trim "()" (princ-to-string (maplist (lambda (x) (first expr)) (rest (rest expr))))))
      )
      (string-downcase (princ-to-string expr))
  )
)

(defun proc-args (expr) ;; processes the given arguments
  (if (not (null expr))
      (if (null (rest expr))
          (form-to-postfix (first expr))
          (concatenate 'string (form-to-postfix (first expr)) " " (proc-args (rest expr)))
      )
  )
)

(defun t (expr) (form-to-postfix expr))