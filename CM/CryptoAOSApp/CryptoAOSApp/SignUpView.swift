//
//  SignUpView.swift
//  CryptoAOSApp
//
//  Created by Orlando Ortega on 08/02/21.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Crea tu cuenta")
                .font(.system(size: 32, weight: .heavy))
            Text("Registrate para iniciar")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.primaryColor3)
            
            VStack(spacing: 18) {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.blue)
                    TextField("Email", text: $email)
                }
                .font(.system(size: 14))
                .padding(32)
                .background(Color.primaryColor2)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.blue)
                    SecureField("Password", text: $password)
                }
                .font(.system(size: 14))
                .padding(32)
                .background(Color.primaryColor2)
                
            }.padding(.vertical, 64)
            Button(action: signUp) {
                Text("Crear Cuenta")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors: [Color.primaryColor1, Color.primaryColor3]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
            }
            
            if (error != "") {
                Text("Usuario registrado exitosamente")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding()
                ContentView()
            }
        }.padding(.horizontal, 32)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(SessionStore())
    }
}
