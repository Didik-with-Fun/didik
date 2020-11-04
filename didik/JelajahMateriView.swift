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
    
    @State var searchText : String = ""
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBarView(title: "Jelajah Materi", filterKelasString: "Kelas", filterMateriString: "Materi", searchText: $searchText, showDropDown: true, previousTitle: nil)
                    .zIndex(2)
                    .ignoresSafeArea()
                //foreach
                if searchText != "" {
                    List(placeholderCollectionMateri.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
                    })) { materi in
                        MateriTableCellView(materi: materi, height: 125, width: 230)
                    }
                } else {
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
    }
}

struct JelajahMateriView_Previews: PreviewProvider {
    static var previews: some View {
        JelajahMateriView()
    }
}
