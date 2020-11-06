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
    @State private var isShowingDetailView = false
    
    var body: some View {

            VStack{
                
                NavigationLink(
                    destination: Text("Destination"),
                    isActive: $isShowingDetailView,
                    label: {
                        EmptyView()
                    }
                                       
                )
                Button("Tap to show detail", action: {
                    self.isShowingDetailView = true
                })
                
                
                Text("Hello  \(userViewModel.userData?.fullName ?? "there")")
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
                Spacer()
            }.ignoresSafeArea()
           .navigationBarColor(backgroundColor: UIColor(Color("NavBar")), titleColor: .red)
            .onAppear(){
                self.userViewModel.getUserInfo()
            }
            //.navigationBarTitle("User")
            
        //.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
