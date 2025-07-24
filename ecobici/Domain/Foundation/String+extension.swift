//
//  String.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import Foundation
extension String{
     var isValidEmail: Bool {
         let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
         let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
         return emailPredicate.evaluate(with: self)
    }
}
