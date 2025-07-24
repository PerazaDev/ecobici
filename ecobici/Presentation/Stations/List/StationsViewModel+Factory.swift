//
//  StationsViewModel+Factory.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation

extension StationsViewModel{
    struct Factory{
        static func build() -> StationsViewModel{
            let repository: StationRepository = StationRepositoryImpl()
            let getStationsUseCase = GetStationsUseCaseImpl(repository: repository)
            let authRepository: AuthenticationRepository = AuthenticationRepositoryImpl()
            let logoutFirebaseUseCase = LogoutFirebaseUseCaseImpl(repository: authRepository)
            return .init(getStationsUseCase: getStationsUseCase, logoutFirebaseUseCase: logoutFirebaseUseCase)
        }
    }
}
