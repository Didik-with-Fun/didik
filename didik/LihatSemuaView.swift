//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    let dummyMateriPreviewCollectionView : [DummyMateri]
    
    let height : CGFloat = 125
    let width : CGFloat = 230
    
    var body: some View {
        List(dummyMateriPreviewCollectionView) { materi in
            HStack (alignment : .top, spacing : 20){
                    ZStack {
                        Image(systemName: materi.imageName)
                            .resizable()
                            .scaledToFill()
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                // Likes
                                Text("❤️ \(materi.likes)")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .padding(.top,4)
                                    .frame(maxWidth : width/3)
                                
                                // duration
                                Text("\(materi.duration) hari")
                                    .font(.system(size: 14, weight: .regular, design: .default))
                                    .foregroundColor(.white)
                                    .padding(.vertical,4)
                                    .frame(maxWidth : width/3)
                                    .background(Color.blue)
                                    .cornerRadius(10.0, corners: .topLeft)
                            }.frame(maxWidth : width/3)
                            
                        }.frame(maxWidth : width, maxHeight: height)
                    }.frame(maxWidth : width, maxHeight: height)
                    .cornerRadius(10)
                    .clipped()
                    
                    
                    VStack (alignment: .leading) {
                        Text(materi.title)
                            .bold()
                        Text(materi.author)
                            .bold()
                    }
                }
            }
            
        
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(dummyMateriPreviewCollectionView: placeholderCollectionMateri)
    }
}
