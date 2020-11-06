//
//  JelajahMateriView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct JelajahMateriView: View {
    
    @EnvironmentObject var db: DummyModel
    
    @State var searchText: String = ""
    @State var selectedKelas: Kelas = .Kelas
    @State var selectedMatpel: Matpel = .MatPel
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBarView(filterKelas: $selectedKelas, filterMatpel: $selectedMatpel, searchText: $searchText, showDropDown: true)
                    .zIndex(2)
                //foreach
                if searchText != "" {
                    List(db.filteredMateri.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
                    })) { materi in
                        NavigationLink(
                            destination: DummyView(),
                            label: {
                                MateriTableCellView(materi: materi, height: 125, width: 230)
                            })
                    }
                } else {
                    ScrollView(.vertical) {
                        VStack(spacing : 0) {
                            ForEach(db.materiGroup) {
                                index in
                                MateriPreviewCollectionView(judul: index.title, MateriLibrary: index.dummyMateri)
                                    .frame(height: UIScreen.main.bounds.height/4)
                                
                            }
                        }
                    }
                }
                
            }
            //        }
        }.navigationBarItems(trailing: UserButton())
        .navigationBarTitle("Jelajah Materi", displayMode: .automatic)
        .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
        
        
    }
    
    
}


struct JelajahMateriView_Previews: PreviewProvider {
    static var previews: some View {
        JelajahMateriView()
    }
}
