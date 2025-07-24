//
//  BackgroundField.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

extension View{
    func setBackgroundField(isFocused: Bool) -> some View {
        self
            .padding(10)
            .background{
                RoundedRectangle(cornerRadius:  8, style: .circular)
                    .stroke(isFocused ? .blue : .gray, lineWidth: 0.4)
            }
      
   }
}
