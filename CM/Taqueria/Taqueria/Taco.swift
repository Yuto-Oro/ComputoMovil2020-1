//
//  Taco.swift
//  Taqueria
//
//  Created by Orlando Ortega & Saul Dominguez on 22/01/21.
//

/*
  Patron a utilizar: Decorator -> Altera funcionalidad de los objetos envolviendolos en una clase decoradora.
 */

import Foundation

protocol Costo {
    var cost: Double { get }
}

protocol Ingredientes {
    var ingredients: [String] { get }
}

typealias Tacoable = Costo & Ingredientes

struct SimpleTaco: Tacoable {
    var tipoTaco: String
    let cost: Double = 0.0
    let ingredients: [String] = ["Tortilla"]
    init(tipoTaco: String) {
        self.tipoTaco = tipoTaco
    }
}

struct TacoPastor: Tacoable {
    let cost: Double = 12.0
    let ingredients = ["Tortilla", "Pastor"]
}

struct TacoSuadero: Tacoable {
    let cost: Double = 12.0
    let ingredients = ["Tortilla", "Suadero"]
}

struct TacoCarnitas: Tacoable {
    let cost: Double = 15.0
    let ingredients: [String] = ["Tortilla","Carnitas"]
}

protocol UsaExtras: Tacoable {
    var toppings: Tacoable { get }
}

struct OrdenSalsa: UsaExtras {
    let toppings: Tacoable

    var cost: Double {
        return toppings.cost + 10.0
    }

    var ingredients: [String] {
        return toppings.ingredients + ["Orden de Salsa"]
    }
}

struct OrdenCebolla: UsaExtras {
    let toppings: Tacoable

    var cost: Double {
        return toppings.cost + 2.0
    }

    var ingredients: [String] {
        return toppings.ingredients + ["Orden Cebolla"]
    }
}

struct OrdenCilantro: UsaExtras {
    let toppings: Tacoable

    var cost: Double {
        return toppings.cost + 2.0
    }

    var ingredients: [String] {
        return toppings.ingredients + ["Orden Cilantro"]
    }
}

struct OrdenLimon: UsaExtras {
    let toppings: Tacoable

    var cost: Double {
        return toppings.cost + 3.0
    }

    var ingredients: [String] {
        return toppings.ingredients + ["Limon"]
    }
}

protocol Bebida: Tacoable {
    var beverage: Tacoable { get }
}

struct Refresco: Bebida {
    let beverage: Tacoable

    var cost: Double {
        return beverage.cost + 15.0
    }

    var ingredients: [String] {
        return beverage.ingredients + ["Coca-cola"]
    }
}

func generateOrder(order:[String]) {
    var someTaco: Tacoable
    let ordenes = order.map({$0.lowercased()})
    for orden in ordenes {
        someTaco = SimpleTaco(tipoTaco: orden)
        print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    }
}

func pideTaco() {
    print("-----Menú------")
    print("1-Pastor, 2-Suadero, 3-Carnitas")
    print("4-Orden Salsa, 5-Orden Limon, 6-Orden cilantro 7-Orden cebolla")
    print("8-Refresco, 9-Pedir la cuenta")
    print("Ingrese su orden separada por ',' .")
    guard let input = readLine() else { return }
    generateOrder(order: input.components(separatedBy: ","))
}
