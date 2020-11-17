//
//  ImageLoader.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 16/11/20.
//

import SwiftUI
import Foundation
import FirebaseStorage


class FirestoreImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    let firestorePath: String
    
    init(firestorePath: String) {
        self.firestorePath = firestorePath

        loadImageFromFirebase(path: firestorePath)

    }
    
    func loadImageFromFirebase(path: String) {
        
        let storageRef = Storage.storage().reference(withPath: "projects-media/\(path)")
        storageRef.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            let urlSession = URLSession(configuration: .default)
            
            let sessionTask = urlSession.dataTask(with: url!) { (data, response, error) in
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                } else {
                    guard let safeData = data else { return }
                    
                    DispatchQueue.main.async {
                        guard let loadedImage = UIImage(data: safeData) else { return }
                        self.image = loadedImage
                    }
                }
            }
            sessionTask.resume()
        }

    }

}

