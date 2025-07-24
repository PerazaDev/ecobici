//
//  LoginView.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI
import Firebase
struct LoginView: View {
    @EnvironmentObject private var appState: AppState
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isVisiblePassword: Bool = false
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    private var isCompleted: Bool { email.isValidEmail && !password.isEmpty }
    var body: some View {
        NavigationView {
            ScrollView {
                content
            }
        }
    }
    
    private var content: some View{
        VStack(spacing: 20){
            Text("Ecobici")
                .font(.system(size: 34, weight: .medium))
                .foregroundStyle(.green.opacity(0.7))
            Image("ecobici_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            fields
            Button(action: loginAction){
                HStack{
                    Spacer()
                    Text("Iniciar sesion")
                        .padding(.vertical, 4)
                    Spacer()
                }
            }
            .tint(.green)
            .buttonStyle(.bordered)
            .disabled(!isCompleted)
            .padding(.top)
            Divider()
                .padding(.horizontal)
                .padding(.horizontal)
                .padding(.horizontal)

            Text("¿No tienes un cuenta?")
                .foregroundStyle(.black.opacity(0.8))
            NavigationLink{
                RegisterView()
            }label: {
                Text("Regístrate")
                    .underline()
            }
        }
        .padding()
    }
    private var fields: some View{
        Group{
            TextField("Correo electrónico", text: $email)
                .focused($isEmailFocused)
                .setBackgroundField(isFocused: isEmailFocused)
                .onSubmit {
                    isPasswordFocused = true
                }
            passwordField
                .focused($isPasswordFocused)
                .setBackgroundField(isFocused: isPasswordFocused)
                .onSubmit {
                    guard isCompleted else {return}
                    loginAction()
                }
        }
    }
    private var passwordField: some View{
        HStack {
            if isVisiblePassword{
                TextField("Contraseña", text: $password)
            }else{
                SecureField("Contraseña", text: $password)
            }
            Spacer()
            Button{
                isVisiblePassword.toggle()
            } label:{
                Image(systemName: self.isVisiblePassword ? "eye.slash" : "eye")
            }
        }
    }
    
    private func loginAction() {
    }
}

#Preview {
    LoginView()
}

