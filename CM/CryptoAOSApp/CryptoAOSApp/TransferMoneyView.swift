//
//  TransferMoneyView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 06/02/21.
//

import SwiftUI

struct TransferMoneyView: View {
    
    var headerView: some View {
        HStack {
            Text("Transferir dinero")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    var body: some View {
        headerView
        Spacer()
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(1..<5) { num in
                    Image("user\(num)")
                        .resizable().frame(width:50, height: 50).cornerRadius(10)
                }
                Button {}
                    label: {
                        Image(systemName: "plus")
                            .imageScale(.small)
                            .foregroundColor(.black)
                    }.frame(width: 50, height: 50)
                    .background(Color.primaryColor2).cornerRadius(5)
            }
        }
    }
}

struct TransferMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        TransferMoneyView()
    }
}
