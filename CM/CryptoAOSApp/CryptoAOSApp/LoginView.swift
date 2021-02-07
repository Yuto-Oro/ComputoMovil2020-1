//
//  LoginView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 06/02/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Spacer()
            Text("Smart Money")
                .foregroundColor(Color.primaryColor1)
                .font(.system(size: 64, weight: .semibold))
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.blue)
                TextField("Email", text: $email)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .background(Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal, 20)
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.blue)
                SecureField("Password", text: $password)
            }.frame(height: 60)
            .padding(.horizontal, 20)
            .background(Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal, 20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Login")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .medium))
            }.frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color.primaryColor3)
            .padding(.horizontal, 20)
            Spacer()
        }.background(Image("CryptoAOS_PDF")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
        ).edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
