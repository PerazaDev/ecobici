//
//  StationDetailView.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct StationDetailView: View {
    var model: Station
    @State private var position = MapCameraPosition.region(.init(center: .init(), latitudinalMeters: 0, longitudinalMeters: 0))
    private var coordinate: CLLocationCoordinate2D {
        .init(latitude: model.latitude, longitude: model.longitude)
    }
    private var primaryColor: Color{
        model.availableBikes > 0 ? Color("green_background") : .red
    }
    var body: some View {
        VStack(spacing: -10){
            mapContent
            detailContent
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
        .didAppear{
            position = .region(.init(center: coordinate, span: .init(latitudeDelta: 0.001, longitudeDelta: 0.001)))
        }
        .background(primaryColor)
    }
    
    private var mapContent: some View {
        Map(position: $position){
            Annotation(model.name, coordinate: coordinate){
                Image("bike_pin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55)
            }
        }
        .disabled(true)
    }
    private var detailContent: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8){
                Text(model.name)
                    .font(.title2)
                    .bold()
                    .padding(.bottom)
                Group{
                    Text("Lugares disponibles: \(model.availablePlaces)")
                    Text("Bicicletas disponibles: \(model.availableBikes)")
                    Text("Total de lugares: \(model.totalPlaces)")
                }
                .font(.system(size: 16, weight: .semibold, design: .monospaced))
            }
            Spacer()
            Image("ecobici_logo")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .background(.white)
                .mask(Circle())
                .shadow(radius: 5)
        }
        .foregroundStyle(.white)
        .frame(height: Constants.screenHeight * 0.25)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .background(primaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .safeAreaInset(edge: .bottom) {
            Button(action: drivingAction){
                HStack{
                    Spacer()
                    Text("¿Como llegar?")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    Spacer()
                }
                .background{
                    Color.blue
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 1)
            }
            .padding(.horizontal)
        }
    }
    
    private func drivingAction(){
        guard let url =  URL(string: "maps://") else{ return }
        guard UIApplication.shared.canOpenURL(url) else {return}
        guard let url =  URL(string: "maps://?saddr=&daddr=\(model.latitude),\(model.longitude)") else { return }
        UIApplication.shared.open(url)
    }
}

#Preview {
    NavigationStack {
        StationDetailView(
            model: .init(
                id: "",
                name: "CE-015 Reforma - Río Mississippi",
                latitude: 19.425597,
                longitude: -99.171409,
                availableBikes: 2,
                availablePlaces: 19
            )
        )
    }
}
