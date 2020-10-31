//
//  didikApp.swift
//  didik
//
//  Created by Haddawi on 26/10/20.
//

import SwiftUI
import Firebase

@main
struct didikApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("--> setting up firebase firestore ..")
        FirebaseApp.configure()
        return true
    }
}
