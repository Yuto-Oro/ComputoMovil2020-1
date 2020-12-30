//
//  Sumatoria.swift
//  Program2
//
//  Created by Orlando Ortega on 30/12/20.
//

import Foundation

func readData() {
    print("Ingresa el primer número para calcular la sumatoria: ")
    let input = readLine()!
    let a = Int(input)
    print("Ingresa el segundo número: ")
    let input2 = readLine()!
    let b = Int(input2)
    if b! < a! {
        print("El segundo número no puede ser menor a el primero.")
        readData()
    } else {
        print("El resultado es: ")
        sumatory(a: a!, b: b!)
    }
}

func sumatory(a: Int, b: Int) {
    var sum: Int = 0
    for i in 1...b {
        sum = sum + Int(pow(Double(i), Double(a)))
    }
    print(sum)
}
