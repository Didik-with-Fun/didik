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
    
    func addData(name: String) {
        
        db.collection("cities")
            .addDocument(data: ["String" : "from Simulator"
            ]) { (err) in
                if let err = err {
                    print("Error writing document: \(err.localizedDescription)")
                } else {
                    print("Document successfully written!")
                }
            }
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
    
    
    static func requestAllProject(completion: @escaping (Result<[Project], FirebaseError>) -> ()) {
        // request project still dummy
        let data = FirebaseRequestService.createDummyProjects()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            completion(.success(data))
            
        }
        
    }
    
    static func requestMyProject(completion: @escaping (Result<[Project], FirebaseError>) -> ()) {
        
        var projects = [Project]()
        
        ref.collection("projects").whereField("projectStatus", isEqualTo: "Published")
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


