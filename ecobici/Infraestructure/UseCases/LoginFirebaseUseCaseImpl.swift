//
//  LoginFirebaseUseCaseImpl.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation

struct LoginFirebaseUseCaseImpl: LoginFirebaseUseCase {
    let repository: AuthenticationRepository
   
    func execute(email: String, password: String) async throws -> Bool {
        return try await repository.loginFirebaseUser(email: email, password: password)
    }
    
}
