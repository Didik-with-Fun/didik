//
//  ContentView.swift
//  didik
//
//  Created by Haddawi on 26/10/20.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // MARK: - Development Use
                // Uncomment code this line to faster the development debug
                /*
                 HomeView(parentGeometry: geometry)
                    .environmentObject(ProjectDatabaseViewModel())
                */
                
                if UserDefaults.standard.isLoggedIn() || signInCoordinator.isUserAuthenticated == .signedIn {
                    HomeView(parentGeometry: geometry).environmentObject(ProjectDatabaseViewModel())
                } else if UserDefaults.standard.isLoggedIn() || signInCoordinator.isUserAuthenticated == .signedOut {
                    SignInView()
                } else {
                    SignInView()
                }
            }
            .position(x: geometry.size.width / 2, y: (geometry.size.height - (geometry.size.height / 2)))
        
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SignInWithAppleCoordinator())
            .previewDevice("iPad (8th generation)")
    }
}
