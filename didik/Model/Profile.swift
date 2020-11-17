//
//  Profile.swift
//  didik
//
//  Created by Haddawi on 16/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Profile: Identifiable, Codable {
    @DocumentID var id: String?
    let userIdentifier: String
    let fullname: String
    let school: String
    let teachingGrade: Grades
    let teachingSubject: Subject
    let teachingSince: Date
    let profilePicture: String
}
//
//struct Author {
//    static let authorUID = String(Auth.auth().currentUser!.uid)
//    static let authorFullname = String(Auth.auth().currentUser!.displayName ?? "no name")
//}


struct Author {
    
    static var userData: UserData?
    
    static var authorUID: String  {
        self.getUserInfo()
        return self.userData?.userUID ?? ""
    }
    
    static var authorFullname: String  {
        self.getUserInfo()
        return self.userData?.fullName ?? ""
    }
    
    static func getUserInfo() {

        if let userDataDefault = UserDefaults.standard.object(forKey: "userData") as? Data,
           let userDecoded = try? JSONDecoder().decode(UserData.self, from: userDataDefault) {
            
            self.userData = userDecoded
        }
        
    }
}
