//
//  Alumno.swift
//  CapturaAlumnos
//
//  Created by Orlando Ortega y Saul Dominguez on 24/11/20.
//

import Foundation

struct Alumno {
    var nombre: String
    var edad: Int
    var promedio: Double
    var beca: Bool
    init() {
        nombre = ""
        edad = 0
        promedio = 0.0
        beca = false
    }
}

func insertStudents() {
    var arrAlumnos: [Alumno] = []
    var alumno = Alumno()
    print("Registro de alumnos, ¿Cuántos alumnos desea registrar?")
    let input = readLine()!
    let cantAlumnos = Int(input)
    if cantAlumnos != 10 {
        print("Debes registrar al menos 10 alumnos")
        insertStudents()
    } else {
        for i in 0..<cantAlumnos! {
            print("Introduce el nombre del Alumno \(i): ")
            let nombre = readLine()
            if let nombre = nombre {
                alumno.nombre = nombre
            }
            print("Introduce la edad del Alumno \(i): ")
            let edad = readLine()
            if let edad = edad {
                alumno.edad = Int(edad)!
            }
            print("Introduce el promedio del Alumno \(i):")
            let promedio = readLine()
            if let promedio = promedio {
                alumno.promedio = Double(promedio)!
            }
            print("¿Tiene beca?")
            let beca = readLine()
            switch beca?.lowercased() {
            case "si":
                alumno.beca = true
                break
            case "no":
                alumno.beca = false
                break
            default: break
            }
            arrAlumnos.append(alumno)
        }
        sortByName(arrAlumnos: arrAlumnos)
        getLowestGradeStudent(arrAlumnos: arrAlumnos)
        getHighestGradeStudent(arrAlumnos: arrAlumnos)
        sortByScholarship(arrAlumnos: arrAlumnos)
    }
}

func sortByName(arrAlumnos: [Alumno]) {
    let byNameArrAlumnos = arrAlumnos.sorted { $0.nombre < $1.nombre}
    print("Lista ordenada por nombres: ")
    for alumno in byNameArrAlumnos {
        print(alumno.nombre)
    }
}

func getLowestGradeStudent(arrAlumnos: [Alumno]) {
    let minGrade = arrAlumnos.min(by: {$0.promedio < $1.promedio})?.promedio ?? 0
    let studentsWithMinGrade = arrAlumnos.filter {$0.promedio == minGrade}
    print("Alumno(s) con menor promedio: ")
    for alumno in studentsWithMinGrade {
        print("\(alumno.nombre) con promedio de \(alumno.promedio)")
    }
}

func getHighestGradeStudent(arrAlumnos: [Alumno]) {
    let maxGrade = arrAlumnos.max(by: {$0.promedio < $1.promedio})?.promedio ?? 0
    let studentsWithMaxGrade = arrAlumnos.filter {$0.promedio == maxGrade}
    print("Alumno(s) con mayor promedio: ")
    for alumno in studentsWithMaxGrade {
        print("\(alumno.nombre) con promedio de \(alumno.promedio)")
    }
}

func sortByScholarship(arrAlumnos: [Alumno]) {
    var arrAlumnoBeca: [Alumno] = []
    for alumno in arrAlumnos {
        if alumno.beca == true {
            arrAlumnoBeca.append(alumno)
        }
    }
    print("Lista alumnos con beca: ")
    for alumno in arrAlumnoBeca {
        print(alumno.nombre)
    }
}
