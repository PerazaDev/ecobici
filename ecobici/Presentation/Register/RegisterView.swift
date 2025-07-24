//
//  RegisterView.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel: RegisterViewModel = .Factory.build()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isVisiblePassword: Bool = false
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var isConfirmPasswordFocused: Bool
    private var isCompleted: Bool { email.isValidEmail && password.count >= 6 && confirmPassword.elementsEqual(password) }
    var body: some View {
        ScrollView {
            content
        }
        .navigationTitle("Registro")
        .onReceive(viewModel.isRegistered) { _ in
            appState.validateUser()
        }
    }
    
    private var content: some View{
        VStack(spacing: 20){
            Text("Ecobici")
                .font(.system(size: 36, weight: .medium, design: .monospaced))
                .foregroundStyle(.green.opacity(0.7))
            Image("ecobici_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            TextField("Correo electrónico", text: $email)
                .focused($isEmailFocused)
                .setBackgroundField(isFocused: isEmailFocused)
                .keyboardType(.emailAddress)
                .onSubmit {
                    isPasswordFocused = true
                }
            HStack{
                Text("La contraseña debe ser mayor a 6 caracteres*")
                    .font(.callout)
                Spacer()
            }
            TextField("Contraseña", text: $password)
                .setBackgroundField(isFocused: isConfirmPasswordFocused)
                .focused($isPasswordFocused)
                .onSubmit {
                    isConfirmPasswordFocused = true
                }
            TextField("Confirmar contraseña", text: $confirmPassword)
                .focused($isConfirmPasswordFocused)
                .setBackgroundField(isFocused: isConfirmPasswordFocused)
                .onSubmit {
                    guard isCompleted else {return}
                    signupAction()
                }
            Button(action: signupAction){
                HStack{
                    Spacer()
                    Text("Registrarse")
                        .padding(.vertical, 4)
                    Spacer()
                }
            }
            .tint(.green)
            .buttonStyle(.bordered)
            .disabled(!isCompleted)
            .padding(.top)
        }
        .padding()
        .overlay {
            if viewModel.isloading{
                ProgressView()
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
    
 
    private func signupAction() {
        Task{
            await viewModel.signup(email: email, password: password)
        }
    }
}

#Preview {
    RegisterView()
}
