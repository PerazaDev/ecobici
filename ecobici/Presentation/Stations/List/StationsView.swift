//
//  StationsView.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

struct StationsView: View {
    @State private var showLogoutAlert = false
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Estaciones")
                .alert("Cerrar sesión", isPresented: $showLogoutAlert){
                    Button("Si", role: .destructive, action: logoutAction)
                    Button("Cancelar", role: .cancel){}
                }message: {
                    Text("¿Deseas cerrar tu sesión?")
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            showLogoutAlert = true
                        }label:{
                            Image(systemName:"iphone.and.arrow.forward.outward")
                                .tint(.red)
                        }
                    }
                }
        }
    }
    
    private var content: some View{
        List{
            ForEach((1..<5)) { item in
                NavigationLink{
                    StationDetailView(model: .init(id: "0", name: "CE-015 Reforma - Río Mississippi Mississippi ", latitude: 0.0, longitude: 0.0, availableBikes: 2, availablePlaces: 2))
                }label: {
                    Cell(model: .init(id: "0", name: "CE-015 Reforma - Río Mississippi Mississippi ", latitude: 0.0, longitude: 0.0, availableBikes: 0, availablePlaces: 2))
                }
            }
        }
        .refreshable {
            
        }
    }
    private func logoutAction() {
     
    }
    
}

#Preview {
    StationsView()
}


