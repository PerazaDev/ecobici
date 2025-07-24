//
//  ecobiciApp+appstate.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation
import FirebaseAuth

class AppState: ObservableObject {
    @Published var user: User?
    var isLogged: Bool { user != nil }
    init() {
        validateUser()
    }
    func validateUser() {
        self.user = Auth.auth().currentUser
    }
}
