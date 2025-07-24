//
//  ecobiciApp.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI
import FirebaseAuth

@main
struct ecobiciApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appState: AppState = .init()
    @State private var isLaunching: Bool = true
    
    var body: some Scene {
        WindowGroup {
            content
        }
        .environmentObject(appState)
    }
    
    private var content: some View{
        Group{
            if isLaunching{
                SplashView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            withAnimation {
                                self.isLaunching = false
                            }
                        }
                    }
            }else{
                if appState.isLogged{
                    StationsView()
                }else{
                    LoginView()
                }
            }
        }
    }
}
