(list (list 1 2) 3 4) => ((1, 2) 3, 4)
                            /    \   \
                         (1, 2)   3   4
                          /  \
                         1    2

; подсчет числа листьев дерева

(defun count-leaves (x)
    (cond ((null x) 0)
        ((atom x) 1)
        (t (+ (count-leaves (first x))
              (count-leaves (rest x)))
        )
    )
)

; отображение деревьев, умножение дерева на число

(defun scale-tree (tree factor)
    (cond ((null tree) nil)
        ((atom tree) (* tree factor))
        (t (cons (scale-tree (first tree) factor))
                 (scale-tree (rest tree) factor)
        )
    )
)

; dsds

(defun scale-tree (tree factor)
    (mapcar (lambda (sub-tree)
                (if (list sub-tree)
                    (scale-tree sub-tree factor)
                    (* sub-tree factor)
                )
            ) tree
    )
)
