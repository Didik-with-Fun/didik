//
//  JelajahMateriView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct DummyMateriGroup: Identifiable {
    let id = UUID()
    let title : String
    let dummyMateri : [DummyMateri]
}

let dummyMateriGroup = [
    DummyMateriGroup(title: "Trigonometri", dummyMateri: placeholderCollectionMateri),
    DummyMateriGroup(title: "Magnet", dummyMateri: placeholderCollectionMateri),
    DummyMateriGroup(title: "Biologi", dummyMateri: placeholderCollectionMateri),
    DummyMateriGroup(title: "Pesawat Sederhana", dummyMateri: placeholderCollectionMateri),
    DummyMateriGroup(title: "Trigonometri", dummyMateri: placeholderCollectionMateri)
]

struct JelajahMateriView: View {
    var body: some View {
        VStack {
            ZStack {
                CustomNavigationBarView(isHidden: false, title: "Jelajah Materi")
//                    .ignoresSafeArea(.all)
            }
            
            //list
//            List(dummyMateriGroup) { materi in
//                MateriPreviewCollectionView(judul: materi.title, dummyMateriPreviewCollectionView: materi.dummyMateri)
//                }
            
            //foreach
            ScrollView (.vertical) {
                VStack (spacing : 0) {
                    ForEach(dummyMateriGroup) {
                        index in
                        MateriPreviewCollectionView(judul: index.title, dummyMateriPreviewCollectionView: index.dummyMateri)
                            .frame(height: UIScreen.main.bounds.height/4)
                            
                    }
                }
            }
        }
    }
}

struct JelajahMateriView_Previews: PreviewProvider {
    static var previews: some View {
        JelajahMateriView()
    }
}
