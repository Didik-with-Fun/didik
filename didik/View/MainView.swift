//
//  MainView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/4/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator

    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        VStack{
            Text("Hello, \(userViewModel.userData?.fullName ?? "")")
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
        .onAppear(){
            self.userViewModel.getUserInfo()
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
