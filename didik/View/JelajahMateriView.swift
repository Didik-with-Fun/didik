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
        NavigationView {
            VStack {
                CustomNavigationBarView(filterKelas: $selectedKelas, filterMatpel: $selectedMatpel, searchText: $searchText, showDropDown: true)
                    .zIndex(2)
                
                //workaraund to make nav bar not expanding
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 1)
                }

                if searchText != "" {
                    List(db.filteredMateri.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
                    })) { materi in
                        NavigationLink(
                            destination: DummyView(),
                            label: {
                                MateriTableCellView(materi: materi, height: 125, width: 230, bookmarked: materi.bookmarked)
                            })
                    }
                } else {
                    ScrollView(.vertical) {
                        VStack(spacing : 0) {
                            ForEach(db.materiGroup) {
                                index in
                                MateriPreviewCollectionView(judul: index.title, MateriLibrary: index.dummyMateri)

                                
                            }
                        }
                    }
                }
                
            }
            .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
            .navigationBarTitle("Jelajah Materi", displayMode: .automatic)
            .navigationBarItems(trailing: UserButton())
//            .background(NavigationConfigurator { nc in
//                            nc.navigationBar.barTintColor = .blue
//                            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.blue]
////                            nc.navigationBar.backgroundColor = .cyan
//                        }
//            )
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}

struct JelajahMateriView_Previews: PreviewProvider {
    static var previews: some View {
        JelajahMateriView()
            .environmentObject(DummyModel())
            .previewDevice("iPad (8th generation)")
    }
}
