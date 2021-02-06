//
//  Card.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI

struct Card: Hashable {
    let ingresos: Double
    let gastos: Double
    var balance: Double {
        ingresos - gastos
    }
    let numeroCuenta: String
    let imageName: String
    var isSelected = false
    var backgroundColor: Color {
        isSelected ? Color.primaryColor1 : Color.primaryColor2
    }
    var textColor: Color {
        isSelected ? .white : .black
    }
    
    var porcentajeIngreso: Int {
        Int(balance / ingresos * 100)
    }
}

extension Card: Equatable {
    
}
