//
//  MateriPreviewCollectionView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 29/10/20.
//

import SwiftUI

let placeholderCollectionMateri : [DummyMateri] = [
    placeholderMateri,
    placeholderMateri,
    placeholderMateri,
    placeholderMateri
]

struct MateriPreviewCollectionView: View {
    
    let judul : String
    let dummyMateriPreviewCollectionView : [DummyMateri]
    
    var body: some View {
        VStack (spacing: 10){
            HStack {
                Text(judul)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Spacer()
                NavigationLink(
                    destination: LihatSemuaView(dummyMateriPreviewCollectionView: dummyMateriPreviewCollectionView),
                    label: {
                        Text("Lihat Semua")
                            .font(.caption)
                            .padding(.horizontal)
                            .padding(.bottom)
                    })
                
                
            }
            ScrollView (.horizontal) {
                HStack (spacing: 10) {
                    ForEach(dummyMateriPreviewCollectionView) { index in
                        NavigationLink(
                            destination: DummyView(),
                            label: {
                                MateriPreviewView(height: 126, width: 230, materi: index)
                                    .padding(.leading)
                            })
                        
                    }
                }
                
            }
            
        }.padding(.vertical)
    }
}

struct MateriPreviewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MateriPreviewCollectionView(judul: "Matematika Dasar", dummyMateriPreviewCollectionView: placeholderCollectionMateri)
    }
}
