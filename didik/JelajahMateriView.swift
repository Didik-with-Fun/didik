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
    DummyMateriGroup(title: "Trigonometri", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Magnet", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Biologi", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Pesawat Sederhana", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Trigonometri", dummyMateri: LibraryMateri)
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
                    List(LibraryMateri.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
                    })) { materi in
                        MateriTableCellView(materi: materi, height: 125, width: 230)
                    }
                } else {
                    ScrollView (.vertical) {
                        VStack (spacing : 0) {
                            ForEach(dummyMateriGroup) {
                                index in
                                MateriPreviewCollectionView(judul: index.title, MateriLibrary: index.dummyMateri)
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
