//
//  DummyView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 31/10/20.
//

import SwiftUI

struct DummyView: View {
    
    @EnvironmentObject var db: DummyModel
    
    let MateriLibrary: [DummyMateri] = LibraryMateri
    @State var searchText: String = ""
    @State var selectedKelas: Kelas = .Kelas
    @State var selectedMatpel: Matpel = .MatPel
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
    var body: some View {
        VStack {
            CustomNavigationBarView(filterKelas: $selectedKelas, filterMatpel: $selectedMatpel, searchText: $searchText, showDropDown: true)
            Spacer()
            
            List(MateriLibrary.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
            })) { materi in
                NavigationLink(
                    destination: DetailProjectMainView(title: materi.title),
                    label: {
                        MateriTableCellView(materi: materi, height: height, width: width)
                    })
            }
            Spacer()
            
        }
        .navigationBarTitle("Dummy", displayMode: .automatic)
        .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
        .navigationBarItems(trailing: UserButton())
        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
            .previewDevice("iPad (8th generation)")

    }
}
