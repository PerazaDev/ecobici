//
//  DidAppear.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI

struct DidAppear: ViewModifier {
    @State private var didAppear = false
    var perform: () -> Void
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !didAppear{
                    didAppear = true
                    perform()
                }
            }
    }
}

extension View{
    func didAppear(perform: @escaping () -> Void = {}) -> some View{
        modifier(DidAppear(perform: perform))
    }
}
