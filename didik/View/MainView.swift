//
//  MainView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/4/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            do {
                try signInCoordinator.signOut()
            }
            catch {
                fatalError()
            }
            
        }, label: {
            Text("Sign Out")
        })
        .frame(width: 280, height: 60)

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
