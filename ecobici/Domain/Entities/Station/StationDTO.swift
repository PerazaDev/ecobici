//
//  StationDTO.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation
struct StationsDTO: Decodable{
    let network: Network

    struct Network: Decodable{
        let stations: [StationDTO]
    }
}
struct StationDTO: Decodable{
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let free_bikes: Int
    let empty_slots: Int
}
