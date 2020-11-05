//
//  DummyView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 31/10/20.
//

import SwiftUI

struct DummyView: View {
    
    let MateriLibrary: [DummyMateri] = LibraryMateri
    @State var searchText: String = ""
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
    var body: some View {
        VStack {
            CustomNavigationBarView(filterKelasString: "Kelas", filterMateriString: "Materi", searchText: $searchText, showDropDown: true)
            Spacer()
            
            List(MateriLibrary.filter({ searchText.isEmpty ? true : $0.title.lowercased().contains(searchText.lowercased())
            })) { materi in
                NavigationLink(
                    destination: HomeView(),
                    label: {
                        MateriTableCellView(materi: materi, height: height, width: width)
                    })
            }
            Spacer()
            
        }
        .navigationBarTitle("Dummy", displayMode: .automatic)
        .navigationBarColor(UIColor(named: K.TabBarColor))
        .navigationBarItems(trailing: UserButton())
        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}


