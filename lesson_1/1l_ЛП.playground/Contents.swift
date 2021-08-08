// Урок 1, Павел Лазарев

import Foundation

// Задание 1
print("Задание 1")

// квадратное уровнение
// ax^2 + bx + c = 0

// заданные значения
let a: Double = 31
let b: Double = 6
let c: Double = 27

print("Дано уравнение: \(a)x^2 + \(b)x + \(c) = 0")

// Находим дискриминант
let D = pow(b, 2) - 4 * a * c
print("Дискриминант равен \(D)")

// проверяем значение дискриминанта и находим корни/корень если это возможно
if D > 0 {
    let x1 = (-b + pow(D, 1/2)) / 2 * b
    let x2 = (-b - pow(D, 1/2)) / 2 * b
    print("Корней два: x1 = \(x1), x2 = \(x2)")
} else if D == 0 {
    let x = -(b / 2 * a)
    print("Корень один: x = \(x)")
} else {
    print("Корней на множестве действительных чисел нет")
}

// Задание 2
print("Задание 2")

// заданные значения
let katetA = 17.0
let katetB = 21.0

print("Даны катеты: \(katetA) и \(katetB)")

// поиск площади
let S = 1/2 * (katetA * katetB)
print("Площадь прямоугольного треугольника равна \(S)")

// поиск периметра
let P = pow(pow(katetA, 2) + pow(katetB, 2), 1/2) + katetA + katetB
print("Периметр равен \(P)")

// поиск гипотенузы
let hypotenuse = pow(pow(katetA, 2) + pow(katetB, 2), 1/2)
print("Гипотенуза равна \(hypotenuse)")
