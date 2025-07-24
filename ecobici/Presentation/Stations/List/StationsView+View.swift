//
//  StationsView+View.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

extension StationsView{
    struct Cell: View {
        var model: Station
        var body: some View {
            VStack(alignment: .leading, spacing: 8){
                Text(model.name)
                    .font(.callout)
                    .bold()
                Text("Bicicletas disponibles: \(model.availableBikes.description)")
                    .font(.caption)
            }
            .multilineTextAlignment(.leading)
        }
    }
}
