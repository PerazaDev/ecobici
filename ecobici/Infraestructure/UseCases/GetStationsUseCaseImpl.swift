//
//  GetStationsUseCaseImpl.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation


struct GetStationsUseCaseImpl: GetStationsUseCase {
    let repository: StationRepository
   
    func execute() async throws -> StationsDTO {
        return try await repository.getStations()
    }
    
}
