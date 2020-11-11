//
//  MateriPreviewCollectionView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 29/10/20.
//

import SwiftUI



struct MateriPreviewCollectionView: View {
    
    var parentGeometry: GeometryProxy

    let title: String
    let ProjectsLibrary: [Project]

    var body: some View {
        VStack(spacing: 10){
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Spacer()
                NavigationLink(
                    destination: LihatSemuaView(ProjectsLibrary: ProjectsLibrary, currentTitle: title),
                    label: {
                        Text("Lihat Semua")
                            .font(.caption)
                            .padding(.horizontal)
                            .padding(.bottom)
                    })
                
                
            }
            ScrollView (.horizontal) {
                HStack (alignment: .top, spacing: 10) {
                    ForEach(ProjectsLibrary) { index in
                        NavigationLink(
                            destination: DetailProjectMainView(parentGeometry: parentGeometry, title: index.name),
                            label: {
                                MateriPreviewView(height: 126, width: 230, project: index)
                                    .padding(.leading)
                            })
                        
                    }
                }
                
            }
            
        }
        .padding(.vertical)
    }
}

struct MateriPreviewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in

            MateriPreviewCollectionView(parentGeometry: geometry, title: "Matematika Dasar", ProjectsLibrary: [placeholder])
                .previewDevice("iPad (8th generation)")
        }
    }
}
