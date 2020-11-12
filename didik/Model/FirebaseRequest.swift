//
//  FirebaseRequest.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 12/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirebaseRequest {
    
    
    let db = Firestore.firestore()
    init() {
        
        print("Create service")
        
        //        let docRef = db.collection("cities").document("SF")
        //
        //        docRef.getDocument { (document, error) in
        //            if let document = document, document.exists {
        //                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
        //                print("Document data: \(dataDescription)")
        //            } else {
        //                print("Document does not exist")
        //            }
        //        }
        
        
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
        //        db.collection("cities").document("LA").setData([
        //            "name": "name",
        //            "state": "CA",
        //            "country": "USA"
        //        ]) { err in
        //            if let err = err {
        //                print("Error writing document: \(err.localizedDescription)")
        //            } else {
        //                print("Document successfully written!")
        //            }
        //        }
    }
    
    //    private func executeDataTaskAndDecode<D: Decodable>(with url : URL, completion : @escaping (Result<D, SholatAPIError>) -> ()) {
    //        urlSession.dataTask(with: url) { (data, response, error) in
    //            if let error = error {
    //                completion(.failure(.error(error as NSError)))
    //                return
    //            }
    //
    //            guard let httpresponse = response as? HTTPURLResponse, httpresponse.statusCode >= 200 && httpresponse.statusCode < 300 else {
    //                completion(.failure(.badHTTPResponse))
    //                return
    //            }
    //
    //            guard let safeData = data else {
    //                completion(.failure(.noData))
    //                return
    //            }
    //
    //            do {
    //                let model = try
    //                    self.jsonDecoder.decode(D.self, from: safeData)
    //                print("con")
    //                completion(.success(model))
    //
    //            } catch {
    //                print(error.localizedDescription)
    //                completion(.failure(.invalidSerialization))
    //            }
    //        }.resume()
    //    }
    
    
}
