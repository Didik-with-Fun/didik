//
//  MateriPreviewView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 29/10/20.
//

import SwiftUI



struct DummyMateri : Identifiable {
    let id = UUID()
    
    let imageName : String
    
    let likes : Int
    let duration : Int
    let title : String
    let author : String
}

let placeholderMateri = DummyMateri.init(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Linear", author: "Pak Kirjo")

struct MateriPreviewView: View {
    
    let height : CGFloat
    let width : CGFloat
    
    let materi : DummyMateri
    
    
    var body: some View {
        
        VStack {
            ZStack {
                Image(systemName: materi.imageName)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        // Likes
                        Text("❤️ \(materi.likes)")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.black)
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
            
            HStack {
                Text ("\(materi.title)")
                    .foregroundColor(.black)
                    .font(.title)
                    .lineLimit(1)
                Spacer()
            }
            HStack {
                Text ("\(materi.author)")
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .lineLimit(1)
                Spacer()
            }
            
        }.frame(maxWidth : width)
        
        
    }
}

struct MateriPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MateriPreviewView(height: 126, width: 230, materi: placeholderMateri)
        //        MateriPreviewView()
    }
}
