//
//  APIError.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 24/07/25.
//

import Foundation
enum APIError: Error{
    case badRequest
    case jsonDecoding(data: Data?)
    case serverError(code: Int)
}
