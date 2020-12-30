//
//  Recursivity.swift
//  Program1
//
//  Created by Orlando Ortega on 19/12/20.
//

import Foundation

func readData() {
    let x: Int = 2
    print("Ingresa el numero entero para calcular la potencia: ")
    let input = readLine()!
    let n = Int(input)
    print("El resultado es: \n")
    print(power(x: x, n: n!))
}

func power(x: Int,n: Int) -> Int{
    if n == 0 {
        print("El resultado es: ")
        return 1
    }
    if n % 2 == 0 {
        if n == 2 {
            return x*x
        } else {
            return power(x: power(x: x, n: n / 2), n: 2)
        }
    }else {
        return x * power(x: x, n:  n - 1)
    }
}
