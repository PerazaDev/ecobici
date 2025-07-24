//
//  LogoutFirebaseUseCaseImpl.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation

struct LogoutFirebaseUseCaseImpl: LogoutFirebaseUseCase {
    let repository: AuthenticationRepository
    
    func execute() async throws {
        try await repository.logoutFirebaseUser()
    }
    
}
