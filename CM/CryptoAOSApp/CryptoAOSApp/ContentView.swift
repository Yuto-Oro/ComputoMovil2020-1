//
//  ContentView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                HeaderView()
                CardListView()
                BalanceView()
                TransferMoneyView()
                Spacer()
            }.padding(25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Wallet())
    }
}
