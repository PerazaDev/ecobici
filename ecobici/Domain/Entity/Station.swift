//
//  Station.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation
struct Station{
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let availableBikes: Int
    let availablePlaces: Int
    var totalPlaces: Int { availableBikes + availablePlaces }
}
