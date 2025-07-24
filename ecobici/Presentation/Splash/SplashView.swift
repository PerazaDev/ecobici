//
//  SplashView.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 20){
            Image("ecobici_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
        }
        .padding()
    }
}

#Preview {
    SplashView()
}
