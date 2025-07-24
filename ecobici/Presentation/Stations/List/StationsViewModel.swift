//
//  StationsViewModel.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation
import Combine


class StationsViewModel: ObservableObject{
    private let getStationsUseCase: GetStationsUseCase
    private let logoutFirebaseUseCase: LogoutFirebaseUseCase
    @Published var isLoading: Bool = false
    @Published var stations: [Station] = []
    var isUnlogged = PassthroughSubject<Void, Never>()
    init(getStationsUseCase: GetStationsUseCase, logoutFirebaseUseCase: LogoutFirebaseUseCase) {
        self.getStationsUseCase = getStationsUseCase
        self.logoutFirebaseUseCase = logoutFirebaseUseCase
    }
    
    @MainActor
    func getStations(isLoading: Bool = false) async {
        do{
            self.isLoading = isLoading
            defer { self.isLoading = false }
            let response = try await self.getStationsUseCase.execute()
            stations = StationsMapper.map(response)
        }catch{
            switch error{
            case APIError.badRequest:
                debugPrint("[StationsViewModel][getStationsUseCase][Error][badRequest]")
            case APIError.jsonDecoding(let data):
                guard let dataUnwrapped = data, let json = String(data: dataUnwrapped, encoding: .utf8) else {return}
                debugPrint("[StationsViewModel][getStationsUseCase][Error][jsonDecoding]:  \n \(json))")
            case APIError.serverError(let code):
                debugPrint("[StationsViewModel][getStationsUseCase][Error][serverError]: \(code)")
            default:
                debugPrint("[StationsViewModel][getStationsUseCase][Error]: \(error)")
            }
        }
    }
    @MainActor
    func logout() async{
        do{
            self.isLoading = isLoading
            defer { self.isLoading = false }
            try await self.logoutFirebaseUseCase.execute()
            isUnlogged.send()
        }catch{
            debugPrint("[StationsViewModel][logout][Error]: \(error)")
        }
    }
}
