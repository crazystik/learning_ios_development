//
//  main.swift
//  deposit_amount
//
//  Created by Garage on 08.08.2021.
//

import Foundation

var deposit: Double?
var persent: Double?

// Запрашиваем сумму у пользователя
repeat {
    print("Введите сумму вклада")
    if let depositString = readLine()?.replacingOccurrences(of: ",", with: ".") {
        deposit = Double(depositString)
    }
} while deposit == nil

// Запрашиваем процент у пользователя
repeat {
    print("Введите годовой процент вклада")
    if let persentString = readLine()?.replacingOccurrences(of: ",", with: ".") {
        persent = Double(persentString)
    }
} while persent == nil

// Вычисляем сумму вклада за 5 лет
// формула S=(P*I*t:K):100 для вычисления дохода

if let deposit = deposit, let persent = persent {
    // вычисляем доход
    let income = (deposit * persent * 5) / 100
    print("Доход составил \(income)")
    let depositAmount = deposit + income
    print("Сумма вклада через 5 лет составит \(depositAmount)")
}
