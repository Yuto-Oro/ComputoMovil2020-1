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
    @State var isActive = false
    var body: some View {
        NavigationView {
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
                NavigationLink(destination: ContentView(), isActive: $isActive) {
                    Button(action: {
                        isActive = true
                    }) {
                        Text("Login")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .medium))
                    }
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Wallet())
    }
}
