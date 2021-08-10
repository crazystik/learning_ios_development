// Урок 2, Павел Лазарев

import Foundation

// Задание 1

// определение четного числа
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

isEven(number: 3)
isEven(number: 8)


// Задание 2

func isNumberEvenlyDivisibleByThree(_ number: Int) -> Bool {
    return number == 0 ? false : number % 3 == 0
}

isNumberEvenlyDivisibleByThree(0)
isNumberEvenlyDivisibleByThree(1)
isNumberEvenlyDivisibleByThree(3)
isNumberEvenlyDivisibleByThree(4)
isNumberEvenlyDivisibleByThree(6)


// Задание 3

// создание возрастающего массива из 100 чисел
var numbersArray = [Int](1...100)


// Задание 4

// удаление четных чисел и чисел, которые не делятся на 3
numbersArray.removeAll { (number) -> Bool in
    return isEven(number: number) || !isNumberEvenlyDivisibleByThree(number)
}


// Задание 5

var fibonacciNumbersArray = [Int]()

// добавление числа Фибоначчи в массив
func addFibonacciNumber(in array: inout [Int]) {
    
    // добавление первых двух чисел
    if array.isEmpty {
        array.append(0)
        return
    }
    if array.count == 1 {
        array.append(1)
        return
    }
    
    // находим меньшее число (n-2)
    let fewerNumber = array.count <= 2 ? 0 : array[array.count - 2]
    
    // находим большее число (n-1)
    let moreNumber = array[array.count - 1]
    
    let currentNumber = moreNumber + fewerNumber
    
    array.append(currentNumber)
}

// заполнение массива 50 числами
for _ in 1...50 {
    addFibonacciNumber(in: &fibonacciNumbersArray)
}
print(fibonacciNumbersArray)


// задание 6

// создание массива чисел от 2 до 100
var numbers = [Int](2...100)
// массив для результата
var primes: [Int] = []

//  берется первое число из массива numbers
while let newParameter = numbers.first {
    // добавляется это первое число в итоговый массив
    primes.append(newParameter)
    // убираются числа, которые делятся без остатка
    numbers.removeAll { $0 % newParameter == 0 }
}
print(primes)
