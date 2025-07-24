//
//  RegisterViewModel.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject{
    private let signupFirebaseUseCase: SignupFirebaseUseCase
    @Published var isloading: Bool = false
    var isRegistered = PassthroughSubject<Void, Never>()
    init(signupFirebaseUseCase: SignupFirebaseUseCase) {
        self.signupFirebaseUseCase = signupFirebaseUseCase
    }
    
    @MainActor
    func signup(email: String, password: String) async {
        do {
            isloading = true
            defer { isloading = false }
            guard try await signupFirebaseUseCase.execute(email: email, password: password) else { return }
            isRegistered.send()
        }catch{
            debugPrint("[RegisterViewModel][signup][error]: \(error)")
        }
    }
}
