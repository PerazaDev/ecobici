//
//  LoginViewViewModel.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation
import Combine


class LoginViewViewModel: ObservableObject{
    private let loginFirebaseUseCase: LoginFirebaseUseCase
    @Published var isloading: Bool = false
    var isLogged = PassthroughSubject<Void, Never>()
    
    init(loginFirebaseUseCase: LoginFirebaseUseCase) {
        self.loginFirebaseUseCase = loginFirebaseUseCase
    }
    
    @MainActor
    func login(email: String, password: String) async {
        do {
            isloading = true
            defer { isloading = false }
            guard try await loginFirebaseUseCase.execute(email: email, password: password) else { return }
            isLogged.send()
        }catch{
            debugPrint("[LoginViewViewModel][login][error]: \(error)")
        }
    }
}
