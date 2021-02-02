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
    let cost: Double = 0.0
    let ingredients: [String] = ["Plato"]
}

protocol UsaExtras: Tacoable {
    var toppings: Tacoable { get }
}

struct Carnitas: UsaExtras {
    let toppings: Tacoable
    
    var cost: Double {
        return toppings.cost + 15
    }
    
    var ingredients: [String] {
        return toppings.ingredients + ["Taco Carnitas"]
    }
}

struct Pastor: UsaExtras {
    let toppings: Tacoable
    
    var cost: Double {
        return toppings.cost + 12
    }
    
    var ingredients: [String] {
        return toppings.ingredients + ["Taco Pastor"]
    }
}

struct Suadero: UsaExtras {
    let toppings: Tacoable
    
    var cost: Double {
        return toppings.cost + 12
    }
    
    var ingredients: [String] {
        return toppings.ingredients + ["Taco Suadero"]
    }
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

func pideTaco() {
    var someTaco: Tacoable = SimpleTaco()
    someTaco = Pastor(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = Carnitas(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = Suadero(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = OrdenLimon(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = OrdenCebolla(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = OrdenSalsa(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = OrdenCilantro(toppings: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
    someTaco = Refresco(beverage: someTaco)
    print("Cost: \(someTaco.cost); Ingredients: \(someTaco.ingredients)")
}
