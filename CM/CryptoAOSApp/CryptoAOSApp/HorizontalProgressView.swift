//
//  HorizontalProgressView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 05/02/21.
//

import SwiftUI

struct HorizontalProgressView: View {
    @Binding var porcentaje: Int
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.primaryColor2)
                    .frame(height: 20)
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.primaryColor1)
                    .frame(width: proxy.size.width * CGFloat(porcentaje)/100, height: 20)
            }
        }
    }
}

struct HorizontalProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressView(porcentaje: .constant(50))
    }
}
