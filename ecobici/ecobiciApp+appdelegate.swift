//
//  ecobici+appdelegate.swift
//  ecobici
//
//  Created by Daniel Sanchez Peraza on 23/07/25.
//

import SwiftUI
import Firebase
extension ecobiciApp{
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
    }
}

