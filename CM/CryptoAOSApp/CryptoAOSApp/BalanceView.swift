//
//  BalanceView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI

struct BalanceView: View {

    @EnvironmentObject var wallet: Wallet
    @State private var porcentajeIngresos = 0
    
    var headerView: some View {
        HStack {
            Text("Balance")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Text("$\(wallet.selectedCard.balance)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.primaryColor1)
                .padding(.trailing)
        }
    }
    
    var incomeView: some View {
        HStack(spacing: 10) {
            Image(systemName: "arrow.down")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.primaryColor1)
                .padding(10)
                .background(Color.primaryColor1.opacity(0.2))
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("In")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray3))
                Text("$\(wallet.selectedCard.ingresos)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
    
    var expensesView: some View {
        HStack(spacing: 10) {
            Image(systemName: "arrow.up")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.primaryColor2)
                .padding(10)
                .background(Color.primaryColor2.opacity(0.2))
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("Out")
                    .font(.headline)
                    .foregroundColor(Color(.systemGray3))
                Text("$\(wallet.selectedCard.gastos)")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 15) {
            headerView
            HorizontalProgressView(porcentaje: $porcentajeIngresos)
                .padding(.bottom, 15)
            HStack {
                incomeView
                Spacer()
                expensesView
            }
            Spacer()
        }.onAppear {
            update()
        }
        .onChange(of: wallet.selectedCard) { _ in
            update()
        }
    }
        
    private func update() {
        withAnimation(.spring(response: 2)) {
            porcentajeIngresos = wallet.selectedCard.porcentajeIngreso
        }
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
            .environmentObject(Wallet())
            .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
}
