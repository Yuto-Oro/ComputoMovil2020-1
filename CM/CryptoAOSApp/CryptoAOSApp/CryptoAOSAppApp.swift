//
//  CryptoAOSAppApp.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI
import Firebase

@main
struct CryptoAOSAppApp: App {
    
    @StateObject private var wallet = Wallet()
    @StateObject private var session = SessionStore()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(wallet)
                .environmentObject(session)
        }
    }
}

final class Wallet: ObservableObject {
    @Published var cards = cardsData
    
    var selectedCard: Card {
        cards.first(where: { $0.isSelected})!
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("setting firebase")
        FirebaseApp.configure()
        return true
    }
}
