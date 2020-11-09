//
//  UserViewModel.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/5/20.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator

    @Published var userData: UserData?
    
    func getUserInfo() {
        if let userDataDefault = UserDefaults.standard.object(forKey: "userData") as? Data,
           let userDecoded = try? JSONDecoder().decode(UserData.self, from: userDataDefault) {
            userData = userDecoded
        }
        
        print("name \(self.userData?.fullName)")

    }
    
}
