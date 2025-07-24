//
//  StationsMapper.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation

struct StationsMapper{
    static func map(_ from: StationsDTO) -> [Station] {
        return from
            .network
            .stations
            .suffix(50)
            .map{
                .init(
                    id: $0.id,
                    name: $0.name,
                    latitude: $0.latitude,
                    longitude: $0.longitude,
                    availableBikes: $0.free_bikes,
                    availablePlaces: $0.empty_slots
                )
            }
    }
}
