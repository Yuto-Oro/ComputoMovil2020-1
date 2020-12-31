//
//  Telephone.swift
//  Program3
//
//  Created by Orlando Ortega on 30/12/20.
//

import Foundation

func readData() {
    print("¿Cuál es el número que quieres verificar?")
    let input = readLine()!
    verifyNumber(number: input)
}

func verifyNumber(number: String) {
//         ^\\(|\\?\d{2}\\)|\\?\-?\d{2}\-?\d{4}\-?\d{4} -> acepta parentesis pero igual acepta mas formatos que no queremos.
    let regex = NSRegularExpression(#"\([0-9]{2}\)-[0-9]{2}-[0-9]{4}-[0-9]{2}"#)
    if regex.matches(number) == true {
        print("El número si es válido. \n")
        print("¿Te gustaría probar otro número? 1-Si, 2-No")
        let input = readLine()!
        let n = Int(input)!
        if n == 1 {
            readData()
        } else{
            return
        }
    } else {
        print("El número no es válido. \n")
        print("¿Te gustaría probar otro número? 1-Si, 2-No")
        let input = readLine()!
        let n = Int(input)!
        if n == 1 {
            readData()
        } else{
            return
        }
    }
}

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
