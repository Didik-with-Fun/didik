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
    
    let project: Projects
    
    
    var body: some View {
        
        VStack {
            
            MateriPreviewImageView(height: height, width: width, project: project)
            
            HStack {
                Text ("\(project.name)")
                    .foregroundColor(.black)
                    .font(.title2)
                    .lineLimit(2)
                Spacer()
            }
            HStack {
                Text ("project.author")
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
        MateriPreviewView(height: 126, width: 230, project: placeholder)
            .previewDevice("iPad (8th generation)")
    }
}

