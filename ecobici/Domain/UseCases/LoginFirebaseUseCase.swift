//
//  LoginFirebaseUseCase.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation

protocol LoginFirebaseUseCase{
    func execute(email: String, password: String) async throws -> Bool
}
