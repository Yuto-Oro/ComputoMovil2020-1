//
//  CryptoAOSAppApp.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI

@main
struct CryptoAOSAppApp: App {
    @StateObject private var wallet = Wallet()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(wallet)
        }
    }
}

final class Wallet: ObservableObject {
    @Published var cards = cardsData
    
    var selectedCard: Card {
        cards.first(where: { $0.isSelected})!
    }
}
