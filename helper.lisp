(defun square (x) (* x x))

(defclass cart()
    ((x :initarg :x :reader cart-x)
     (y :initarg :y :reader cart-y)
    )
)

(defclass polar()
    ((radius :initarg :radius :accessor radius)
     (angle  :initarg :angle  :accessor angle)
    )
)

(defmethod print-object ((c cart) stream)
    (format stream "[CART x ~d y ~d]"
        (cart-x c) (cart-y c)
    )
)

(defmethod print-object ((p polar) stream)
    (format stream "[POLAR radius ~d angle ~d]"
        (radius p) (angle p)
    )
)

; (setq a 4) - создает переменную a = 4
; (boundp x) - проверяет наличие значения
; (setf (sympol-value x) 42) - обобщенное присваивание

; получение радиуса из декартовых координат
(defmethod radius ((c cart))
    (sqrt (+ (square (cart-x c))
             (square (cart-y c))
          )
    )
)

; получение угла из декартовых координат
(defmethod angle ((c cart))
    (atan (cart-y c) (cart-x c))
)

; преобразование из декартовой в полярную систему
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

; преобразование из полярной в декортову
(defmethod cart-x ((p polar))
    (* (radius p) (cos (angle p)))
)

(defmethod cart-y ((p polar))
    (* (radius p) (sin (angle p)))
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

; сложение объектов разной природы
(defgeneric add2 (arg1 arg2)
    (:method ((n1 number) (n2 number))
        (+ n1 n2)
    )
)

(defmethod add2 ((c1 cart) (c2 cart))
    (make-instance 'cart
        :x (+ (cart-x c1) (cart-x c2))
        :y (+ (cart-y c1) (cart-y c2))
    )
)

(defmethod add2 ((p1 polar) (p2 polar))
    (to-polar (add2 (to-cart p1)
                    (to-cart p2))
    )
)

(defmethod add2 ((c cart) (p polar))
    (add2 c (to-cart p))
)


; обощенное умножение
(defgeneric mul2 (arg1 arg2)
    (:method ((n1 number) (n2 number))
        (* n1 n2)
    )
)

; умножение радиус-вектора на скаляр
(defmethod mul2 ((n number) (c cart))
    (make-instance 'cart
        :x (* n (cart-x c))
        :y (* n (cart-y c))
    )
)

(defmethod mul2 ((n number) (p polar))
    (make-instance 'polar
        :radius (* n (radius p))
        :angle (angle p)
    )
)

; класс отрезок
(defclass line ()
    ((start :initarg :start :accessor line-start)
     (end   :initarg :end   :accessor line-end)
    )
)

(defmethod print-object ((l line) stream)
    (format stream "[line ~s ~s]"
        (line-start l) (line-end l)
    )
)

; класс треугольник
(defclass triangle ()
    ((vertex1 :initarg :1 :reader vertex1)
     (vertex2 :initarg :2 :reader vertex2)
     (vertex3 :initarg :3 :reader vertex3)
    )
)

(defmethod print-object ((tri triangle) stream)
    (format stream "[triangle ~s ~s ~s]"
        (vertex1 tri) (vertex2 tri) (vertex3 tri)
    )
)
