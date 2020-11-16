//
//  urlImage.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 17/11/20.
//

import SwiftUI

struct urlImage: View {
    
    let path: String
    
    @ObservedObject var imageLoader: FirestoreImageLoader
    
    init(path: String) {
        self.path = path
        self.imageLoader = FirestoreImageLoader(firestorePath: path)
    }
    
    var body: some View {
        if imageLoader.image == nil {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
            
        } else {
            Image(uiImage: imageLoader.image!)
                .resizable()
        }
    }
}

struct urlImage_Previews: PreviewProvider {
    static var previews: some View {
        urlImage(path: "COBA")
    }
}
