//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    
    let MateriLibrary: [DummyMateri]
    let currentTitle: String
    @State var searchText: String = ""
    @State var selectedKelas: Kelas = .Kelas
    @State var selectedMatpel: Matpel = .MatPel
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                CustomNavigationBarView(filterKelas: $selectedKelas, filterMatpel: $selectedMatpel, searchText: $searchText, showDropDown: true)
                List(MateriLibrary.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
                })) { materi in
                    NavigationLink(
                        destination: DetailProjectMainView(parentGeometry: geometry, title: currentTitle),
                        label: {
                            MateriTableCellView(materi: materi, height: height, width: width, bookmarked: materi.bookmarked)
                        })
                    
                    
                }
            }
        }

        .navigationBarTitle(currentTitle, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
        
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(MateriLibrary: LibraryMateri, currentTitle: "nipples")
            .previewDevice("iPad (8th generation)")
    }
}
