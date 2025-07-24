//
//  SignupFirebaseUseCaseImpl.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation

struct SignupFirebaseUseCaseImpl: SignupFirebaseUseCase{
    let repository: AuthenticationRepository
    
    func execute(email: String, password: String) async throws -> Bool {
        return try await repository.signupFirebaseUser(email: email, password: password)
    }
    
}
