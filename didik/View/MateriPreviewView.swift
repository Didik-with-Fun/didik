//
//  MateriPreviewView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 29/10/20.
//

import SwiftUI



struct MateriPreviewView: View {
    
    let height: CGFloat
    let width: CGFloat
    
    let materi: DummyMateri
    
    
    var body: some View {
        
        VStack {
            
            MateriPreviewImageView(height: height, width: width, materi: materi)
            
            HStack {
                Text ("\(materi.title)")
                    .foregroundColor(.black)
                    .font(.title2)
                    .lineLimit(2)
                Spacer()
            }
            HStack {
                Text ("\(materi.author)")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .lineLimit(1)
                Spacer()
            }
            
        }
        .frame(width: width)
        
    }
}

struct MateriPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MateriPreviewView(height: 126, width: 230, materi: placeholderMateri)
            .previewDevice("iPad (8th generation)")
    }
}

