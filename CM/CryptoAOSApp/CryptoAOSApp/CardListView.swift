//
//  CardListView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject var wallet: Wallet
    
    var headerView: some View {
        HStack {
            Text("Tus tarjetas")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Button("Añadir") {}
                .font(.callout)
                .foregroundColor(Color.primaryColor1)
                .padding(.trailing)
        }
    }
    var body: some View {
        headerView
        ScrollView(.horizontal, showsIndicators: false){
            HStack (spacing: 10) {
                ForEach(wallet.cards.indices, id: \.self) { index in
                    CardView(card: wallet.cards[index])
                        .onTapGesture {
                            wallet.cards.indices.forEach { index in
                                wallet.cards[index].isSelected = false
                            }
                            wallet.cards[index].isSelected.toggle()
                        }
                }
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
            .environmentObject(Wallet())
    }
}
