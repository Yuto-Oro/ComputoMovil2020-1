//
//  ArrayMultiplication.swift
//  Program5
//
//  Created by Orlando Ortega on 02/01/21.
//

import Foundation

func readData() {
    var arrNumeros: [Int] = []
    print("Ingrese los 5 números que quieres en el arreglo: ")
    for i in 1...5 {
        print("Número \(i): ")
        let input = readLine()!
        arrNumeros.append(Int(input)!)
    }
    print("Array Original")
    print(arrNumeros)
    print("El arreglo modificado es: ")
    mulArray(array: arrNumeros)
}

func mulArray(array: [Int]) {
    var arregloFinal: [Int] = []
    for i in 0...array.count-1 {
        var resMult: Int = 1
        for j in 0...array.count-1 {
            if i != j {
                resMult *= array[j]
            }
        }
        arregloFinal.append(resMult)
    }
    print(arregloFinal)
}
