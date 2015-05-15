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

(defmethod cart-x ((p polar))
    (* (radius p) (cos (angle p)))
)

(defmethod cart-y ((p polar))
    (* (radius p) (sin (angle p)))
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
    (<= (abs (- x y)) tolerance)
)

(defun on-single-line (v)
    (approx-eq (* (- (cart-x (first v)) (cart-x (second v)))
                  (- (cart-y (third v)) (cart-y (second v))))
               (* (- (cart-x (third v)) (cart-x (second v)))
                  (- (cart-y (first v)) (cart-y (second v))))
    )
)

(defun on-single-line-p (vertices)
    (cond
        ((< (length vertices) 3) T)
        ((= (length vertices) 3) (on-single-line vertices))
        ((> (length vertices) 3)
            (if (on-single-line-p (rest vertices))
                (on-single-line (list (first vertices)
                                      (second vertices)
                                      (third vertices)))
            )
        )
    )
)

(defun t (v) (on-single-line-p v)) ; fast testing

; tests
(defvar p1 (make-instance 'cart :x 1 :y 2))
(defvar p2 (make-instance 'cart :x 2 :y 4))
(defvar p3 (make-instance 'cart :x 3 :y 6))

(defvar p4 (make-instance 'cart :x 0 :y 1))
(defvar p5 (make-instance 'cart :x 1 :y 1))
(defvar p6 (make-instance 'cart :x 2 :y 1))

(defvar p7 (make-instance 'cart :x 4 :y 8.0002))
(defvar p8 (make-instance 'cart :x 5 :y 10.00001))
(defvar p9 (make-instance 'cart :x 5.0005 :y 10.0001))

(defvar p10 (make-instance 'polar :radius 1 :angle 1))
(defvar p11 (make-instance 'polar :radius 2 :angle 1))
(defvar p12 (make-instance 'polar :radius 3 :angle 1))
(defvar p13 (make-instance 'polar :radius 4 :angle 1.000001))

(defvar l1 (list p1 p2 p3)) ; T
(defvar l2 (list p1 p2 p4)) ; NIL
(defvar l3 (list p1 p2 p3 p2 p3 p1)) ; T

(defvar l4 (list p4 p5 p6)) ; T
(defvar l5 (list p7 p8 p9)) ; T
(defvar l6 (list p1 p2 p3 p7 p8 p9)) ; T

(defvar l7 (list p10 p11 p12)) ; T
(defvar l8 (list p10 p11 p12 p13)) ; T
(defvar l9 (list p10 p11 p12 p13 p1)) ; NIL
