# Functional Programming labs

## Lab 1 - Вариант 1.40

Золотое сечение - это число ![equation](http://latex.codecogs.com/gif.latex?r), которое удовлетворяет
уравнению ![equation](http://latex.codecogs.com/gif.latex?r%5E%7B2%7D%20%3D%20r%20&plus;%201)

Покажите, что золотое сечение ![equation](http://latex.codecogs.com/gif.latex?r) есть неподвижная точка трансформации
![equation](http://latex.codecogs.com/gif.latex?f%28x%29%20%3D%201%20&plus;%201/x),
запрограммировав на языке Common Lisp функцию для вычисления ![equation](http://latex.codecogs.com/gif.latex?r) с использованием функционала `fixed-point`.

## Lab 2 - Вариант 2.41

Запрограммируйте функцию-предикат `tree-similar-p (x y)`, которая принимает два аргумента - дерева, представленных в виде списков атомов. Предикат должен вернуть истину, если одинаковые атомы расположены в списках х и у в одном и том же порядке при обходе дерева слева направо, т.е. независимо от внутренней структуры х и у.

``` lisp
(tree-similar-p '(1 (2 (3 4)) 5)) '((1 2) 3 (4 5))) => T
```

## Lab 3 - Вариант 3.41

Определить обычную функцию `on-single-line-p` - предикат,
- принимающий в качестве аргумента список точек (радиус-векторов),
- возвращающий `T`, если все указанные точки лежат на одной прямой (вычислять с допустимым отклонением `tolerance`).

Точки могут быть заданы как декартовыми координатами (экземплярами `cart`), так и полярными (экземплярами `polar`).

``` lisp
(defvar tolerance 0.001)

(defun on-single-line-p (vertices)
  ...)
```

## Lab 4 - Вариант 4.44

Запрограммировать на языке Common Lisp функцию, принимающую в качестве единственного аргумента целое число `n` - порядок матрицы. Функция должна создавать и возвращать двумерный массив, представляющий целочисленную квадратную матрицу порядка `n`, элементами которой являются числа `1, 2, ... n^2`, расположенные по схеме, показанной ниже.

``` lisp
(defun matrix-1l-2l (n)
  ...)

(matrix-1l-2l 4) =>
#2A((1  3  4 10)
    (2  5  9 11)
    (6  8 12 15)
    (7 13 14 16))
```