(defun sqr (x) (* x x))

; Cartesian coordinate system
(defclass cart()
    ((x :initarg :x :reader cart-x)
     (y :initarg :y :reader cart-y)
    )
)

(defmethod radius ((c cart))
    (sqrt (+ (square (cart-x c))
             (square (cart-y c))
          )
    )
)

(defmethod angle ((c cart))
    (atan (cart-y c) (cart-x c))
)

; Polar coordinate system
(defclass polar()
    ((radius :initarg :radius :accessor radius)
     (angle  :initarg :angle  :accessor angle)
    )
)

(defmethod cart-x ((p polar))
    (* (radius p) (cos (angle p)))
)

(defmethod cart-y ((p polar))
    (* (radius p) (sin (angle p)))
)

(defgeneric to-polar (arg)
    (:documentation "transformation to polar coordinate system")
    (:method ((p polar)) p)
    (:method ((c cart))
        (make-instance 'polar
            :radius (radius c)
            :angle (angle c)
        )
    )
)

(defgeneric to-cart (arg)
    (:documentation "transformation to cart coordinate system")
    (:method ((c cart)) c)
    (:method ((p polar))
        (make-instance 'cart
            :x (cart-x p)
            :y (cart-y p)
        )
    )
)

; Custom addition function
(defgeneric x-add (arg1 arg2)
    (:documentation "adds given objects arg1 and arg2")
    (:method x-add ((c1 cart) (c2 cart))
        (make-instance 'cart
            :x (+ (cart-x c1) (cart-x c2))
            :y (+ (cart-y c1) (cart-y c2))
        )
    )
    (:method x-add ((p1 polar) (p2 polar))
        (to-polar (add2 (to-cart p1)
                        (to-cart p2))
        )
    )
    (:method x-add ((c cart) (p polar))
        (add2 c (to-cart p))
    )
)

; Custom multiply finction
(defgeneric x-mul (arg1 arg2)
    (:documentation "multiplies given objects arg1 and arg2")
    (:method x-mul ((n1 number) (n2 number))
        (* n1 n2)
    )
    (:method x-mul ((n number) (c cart))
        (make-instance 'cart
            :x (* n (cart-x c))
            :y (* n (cart-y c))
        )
    )
    (:method x-mul ((n number) (p polar))
        (make-instance 'polar
            :radius (* n (radius p))
            :angle (angle p)
        )
    )
)

(defclass line ()
    ((start :initarg :start :accessor line-start)
     (end   :initarg :end   :accessor line-end)
    )
)

(defgeneric print-object (obj)
    (:documentation "prints object [obj]")
    (:method print-object ((c cart) stream)
        (format stream "[CART x ~d y ~d]"
            (cart-x c) (cart-y c)
        )
    )
    (:method print-object ((p polar) stream)
        (format stream "[POLAR radius ~d angle ~d]"
            (radius p) (angle p)
        )
    )
    (:method print-object ((l line) stream)
        (format stream "[line ~s ~s]"
            (line-start l) (line-end l)
        )
    )
)
