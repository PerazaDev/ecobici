//
//  StationsRepositoryImpl.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation

class StationRepositoryImpl: StationRepository{
    
    func getStations() async throws -> StationsDTO {
        guard let url = URL(string: "http://api.citybik.es/v2/networks/ecobici") else { throw APIError.badRequest}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else { throw APIError.badRequest}
        guard (200...299).contains(httpResponse.statusCode) else {throw APIError.serverError(code: httpResponse.statusCode)}
        guard let model = try? JSONDecoder().decode(StationsDTO.self, from: data) else { throw APIError.jsonDecoding(data: data)}
        return model
    }
    
}
