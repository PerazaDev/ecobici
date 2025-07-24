//
//  LoginViewViewModel+Factory.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation


extension LoginViewViewModel{
    struct Factory{
        @MainActor static func build() -> LoginViewViewModel{
            let repository: AuthenticationRepository = AuthenticationRepositoryImpl()
            let loginFirebaseUseCase = LoginFirebaseUseCaseImpl(repository: repository)
            return .init(loginFirebaseUseCase: loginFirebaseUseCase)
        }
    }
}
