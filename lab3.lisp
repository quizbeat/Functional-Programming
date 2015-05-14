(defun square (x) (* x x))

(defclass cart()
    ((x :initarg :x :accessor cart-x)
     (y :initarg :y :accessor cart-y)
    )
)

(defclass polar()
    ((radius :initarg :radius :accessor radius)
     (angle  :initarg :angle  :accessor angle)
    )
)

(defgeneric get-angle (arg)
    (:documentation "returns angle of arg point")
)

(defmethod get-angle ((c cart))
    (atan (cart-y c) (cart-x c))
)

(defmethod get-angle ((p polar))
    (angle p)
)

(defgeneric get-radius (arg)
    (:documentation "returns radius of arg point")
)

(defmethod get-radius ((c cart))
    (sqrt (+ (square (cart-x c))
             (square (cart-y c)))
    )
)

(defmethod get-radius ((p polar))
    (radius p)
)

(defgeneric to-polar (arg)
    (:documentation "transformation to polar coordinate system")
)

(defmethod to-polar ((p polar)) p)

(defmethod to-polar ((c cart))
    (make-instance 'polar
        :radius (get-radius c)
        :angle (get-angle c)
    )
)

(defmethod print-object ((c cart) stream)
    (format stream "[CART x:~d y:~d]"
        (cart-x c) (cart-y c)
    )
)

(defmethod print-object ((p polar) stream)
    (format stream "[POLAR radius:~d angle:~d]"
        (radius p) (angle p)
    )
)

(defvar tolerance 0.001)

(defun approx-eq (x y)
    (if (and (numberp x) (numberp y))
        (<= (abs (- x y)) tolerance)
        nil
    )
)

(defun on-single-line (vertices)
    (if (= (length vertices) 1)
        (get-angle (first vertices))
        (if (approx-eq (get-angle (first vertices))
                       (on-single-line (rest vertices)))
            (get-angle (first vertices))
            nil
        )
    )
)

(defun on-single-line-p (vertices)
    (numberp (on-single-line vertices))
)

(defvar p1 (make-instance 'cart :x 1 :y 2))
(defvar p2 (make-instance 'cart :x 2 :y 4))
(defvar p3 (to-polar (make-instance 'cart :x 3 :y 6)))
(defvar p4 (make-instance 'cart :x 2 :y 2))
(defvar p5 (make-instance 'polar :radius 42 :angle 1.107111))
(defvar l1 (list p1 p2 p3))
(defvar l2 (list p1 p2 p4))
(defvar l3 (list p1 p2 p3 p5))
