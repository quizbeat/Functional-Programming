# Functional Programming labs

## Lab 1 - Вариант 1.40

Золотое сечение - это число ![equation](http://latex.codecogs.com/gif.latex?r), которое удовлетворяет
уравнению ![equation](http://latex.codecogs.com/gif.latex?r%5E%7B2%7D%20%3D%20r%20&plus;%201)

Покажите, что золотое сечение ![equation](http://latex.codecogs.com/gif.latex?r) есть неподвижная точка трансформации
![equation](http://latex.codecogs.com/gif.latex?f%28x%29%20%3D%201%20&plus;%201/x),
запрограммировав на языке Common Lisp функцию для вычисления ![equation](http://latex.codecogs.com/gif.latex?r) с использованием функционала `fixed-point`.

## Lab 2 - Вариант 2.41

Запрограммируйте функцию-предикат `tree-similar-p (x y)`, которая принимает два аргумента - дерева, представленных в виде списков атомов. Предикат должен вернуть истину, если одинаковые атомы расположены в списках х и у в одном и том же порядке при обходе дерева слева направо, т.е. независимо от внутренней структуры х и у.
`(tree-similar-p '(1 (2 (3 4)) 5)) '((1 2) 3 (4 5))) => T`
