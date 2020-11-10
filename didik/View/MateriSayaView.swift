//
//  MateriSayaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 09/11/20.
//

import SwiftUI

struct MateriSayaView: View {
    
    @EnvironmentObject var db: DummyModel
    
    @State var searchText: String = ""
    @State var selectedKelas: Kelas = .Kelas
    @State var selectedMatpel: Matpel = .MatPel
    
    var body: some View {
        NavigationView {
            VStack {
                CustomNavigationBarView(filterKelas: $selectedKelas, filterMatpel: $selectedMatpel, searchText: $searchText, showDropDown: true)
                    .zIndex(2)
                
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            BuatMateriButton()
                        })
                }
                .padding()

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
            .navigationBarTitle("Materi Saya", displayMode: .automatic)
            .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
            .navigationBarItems(trailing: UserButton())
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}

struct MateriSayaView_Previews: PreviewProvider {
    static var previews: some View {
        MateriSayaView()
            .environmentObject(DummyModel())
            .previewDevice("iPad (8th generation)")
    }
}

struct BuatMateriButton: View {
    var body: some View {
        Text("Buat Materi")
            .font(.caption)
            .foregroundColor(.white)
            .bold()
            .frame(width: 230, height: 39, alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
