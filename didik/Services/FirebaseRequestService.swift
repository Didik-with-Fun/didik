//
//  FirebaseRequest.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 12/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

let ref = Firestore.firestore()

class FirebaseRequestService: ObservableObject {
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    let db = Firestore.firestore()
    
    
    init() {
        
        print("Create service")

    }
    
    static func writeProject(contentProject: Project, completion: @escaping (Bool) -> ()) {
        
        do {
            let _ = try ref.collection("projects").addDocument(from: contentProject) { (error) in
                if error != nil {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    
    
    func writeNewUser(contentProfile: Profile, completion: @escaping (Result<Profile, FirebaseError>) -> ()) {
        
        // new user
        do {
            let _ = try db.collection("profiles").addDocument(from: contentProfile) { (error) in
                if error != nil {
                    completion(.failure(.noData))
                    return
                }
                
                completion(.success(contentProfile))
            }
        } catch {
            print(error.localizedDescription)
            completion(.failure(.noData))
        }

    }
    
    func getOldUser(userIdentifier: String, completion: @escaping (Result<Profile, FirebaseError>) -> ()) {
        
        let docRef = db.collection("profiles").whereField("userIdentifier", isEqualTo: userIdentifier).limit(to: 1)
        docRef.getDocuments { (querysnapshot, error) in
            if error != nil {
                print("Document Error: ", error!)
            } else {
                // old user
                if let doc = querysnapshot?.documents, !doc.isEmpty {
                    print("Document is present.")
                    let result = Result {
                        try doc[0].data(as: Profile.self)
                    }
                    switch result {
                    case .success(let profile):
                        completion(.success(profile!))
                    default:
                        completion(.failure(.noData))
                    }

                } else {
                    completion(.failure(.badHTTPResponse))
                }
            }
        }
        
    }
    
    
    
    func requestAllProject(completion: @escaping (Result<[Project], FirebaseError>) -> ()) {
//        let data = FirebaseRequestService.createDummyProjects()
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
//            // Code you want to be delayed
//            completion(.success(data))
//
//        }
        
        var projects = [Project]()
        
        db.collection("projects").whereField("projectStatus", isEqualTo: "Published")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err.localizedDescription)")
                    completion(.failure(.noData))
                } else {
                    for document in querySnapshot!.documents {
                        
                        let result = Result {
                            try document.data(as: Project.self)
                        }
                        switch result {
                        case .success(let project):
                            if let bisa = project {
                                print("title: \(bisa.name)")
                                projects.append(bisa)
                            } else {
                                print("Document does not exist")
                            }
                        case .failure(let error):
                            print("Error decoding city: \(error.localizedDescription)")
                        }
                    }
                    
                    if projects.isEmpty == false {
                        completion(.success(projects))
                    }
                }
            }
        
    }
    
    func requestMyProject(completion: @escaping (Result<[Project], FirebaseError>) -> ()) {
        
        var projects = [Project]()
        
        db.collection("projects").whereField("authorUID", isEqualTo: Auth.auth().currentUser!.uid)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err.localizedDescription)")
                    completion(.failure(.noData))
                } else {
                    for document in querySnapshot!.documents {
                        
                        let result = Result {
                            try document.data(as: Project.self)
                        }
                        switch result {
                        case .success(let project):
                            if let bisa = project {
                                print("title: \(bisa.name)")
                                projects.append(bisa)
                            } else {
                                print("Document does not exist")
                            }
                        case .failure(let error):
                            print("Error decoding city: \(error.localizedDescription)")
                        }
                    }
                    
                    if projects.isEmpty == false {
                        completion(.success(projects))
                    }
                }
            }

    }
    
    
    
}


