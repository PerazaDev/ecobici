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
        private let greenColor: Color = Color("green_background")
        var body: some View {
            VStack(alignment: .leading, spacing: 8){
                Text(model.name)
                    .font(.callout)
                    .bold()
                HStack{
                    Circle()
                        .fill(model.availableBikes > 0 ? greenColor : .red)
                        .frame(width: 10)
                    Text("Bicicletas disponibles: \(model.availableBikes.description)")
                       .font(.caption)
                    Spacer()
                }
            }
            .multilineTextAlignment(.leading)
        }
    }
}
