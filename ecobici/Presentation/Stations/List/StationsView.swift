//
//  StationsView.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

struct StationsView: View {
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel: StationsViewModel = .Factory.build()
    @State private var showLogoutAlert = false
    var body: some View {
        NavigationStack {
            content
                .task {
                    await viewModel.getStations(isLoading: true)
                }
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
                .onReceive(viewModel.isUnlogged) { _ in
                    appState.validateUser()
                }
        }
    }
    
    private var content: some View{
        List{
            ForEach(viewModel.stations, id: \.id) { station in
                NavigationLink{
                    StationDetailView(model: station)
                }label: {
                    Cell(model: station)
                }
            }
        }
        .overlay{
            if viewModel.isLoading{
                ProgressView()
            }
        }
        .refreshable {
            await viewModel.getStations()
        }
    }
    private func logoutAction() {
        Task{
            await viewModel.logout()
        }
    }
    
}

#Preview {
    StationsView()
}


