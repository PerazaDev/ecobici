//
//  AuthenticationRepositoryImpl.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation
import FirebaseAuth

class AuthenticationRepositoryImpl: AuthenticationRepository{
    func loginFirebaseUser(email: String, password: String) async throws -> Bool {
        try await Auth.auth().signIn(withEmail: email, password: password)
        return true
        
    }
    
    func signupFirebaseUser(email: String, password: String) async throws -> Bool {
        try await Auth.auth().createUser(withEmail: email, password: password)
        return true
    }
    
    func logoutFirebaseUser() async throws {
        try Auth.auth().signOut()
    }
    
}
