//
//  RegisterViewModel+Factory.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation

extension RegisterViewModel{
    struct Factory{
        static func build() -> RegisterViewModel{
            let repository: AuthenticationRepository = AuthenticationRepositoryImpl()
            let signupFirebaseUseCase = SignupFirebaseUseCaseImpl(repository: repository)
            return .init(signupFirebaseUseCase: signupFirebaseUseCase)
        }
    }
}
