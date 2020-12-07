//
//  LogoutView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/5/20.
//

import SwiftUI

struct UserProfileView: View {
    
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator
    
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack {
            UserProfileHeaderView(fullName: self.userViewModel.userData?.fullName)
            
            Spacer(minLength: 100)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 100, content: {
                List {
                    Text("FullName: \(userViewModel.userData?.fullName ?? "")")
                    Text("Email: \(userViewModel.userData?.email ?? "")")
                }
            })
            
            Button(action: {
                do {
                    try signInCoordinator.signOut()
                }
                catch {
                    fatalError()
                }
                
            }, label: {
                Text("Sign Out")
                    .frame(width: 200, height: 30)
                    .padding()
                    .background(Color.Didik.BluePrimary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            
            Spacer(minLength: 100)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(){
            self.userViewModel.getUserInfo()
        }
        
    }
    
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
            .previewDevice("iPad (8th generation)")
            .environmentObject(SignInWithAppleCoordinator())
    }
}
