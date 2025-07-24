//
//  AuthenticationRepository.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation

protocol AuthenticationRepository{
    func loginFirebaseUser(email: String, password: String) async throws-> Bool
    func signupFirebaseUser(email: String, password: String) async throws-> Bool
    func logoutFirebaseUser() async throws
}
