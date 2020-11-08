//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    
    @EnvironmentObject var db: DummyModel
    
    let MateriLibrary: [DummyMateri]
    let currentTitle: String
    @State var searchText: String = ""
    @State var selectedKelas: Kelas = .Kelas
    @State var selectedMatpel: Matpel = .MatPel
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
    var body: some View {
        VStack {
            CustomNavigationBarView(filterKelas: $selectedKelas, filterMatpel: $selectedMatpel, searchText: $searchText, showDropDown: true)
//                .ignoresSafeArea()
            List(MateriLibrary.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased()) 
            })) { materi in
                NavigationLink(
                    destination: DummyView(),
                    label: {
                        MateriTableCellView(materi: materi, height: height, width: width)
                    })
            }
        }.navigationBarTitle(currentTitle, displayMode: .automatic)
        .navigationBarColor(backgroundColor: UIColor.init(named: K.TabBarColor))
        .navigationBarItems(trailing: UserButton())
//        .navigationBarHidden(true)
            
        
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(MateriLibrary: LibraryMateri, currentTitle: "nipples")
    }
}
