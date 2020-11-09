//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    
//    @EnvironmentObject var db: DummyModel
    
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
        }
        .navigationBarTitle(currentTitle, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
//        .navigationBarHidden(true)
            
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(MateriLibrary: LibraryMateri, currentTitle: "nipples")
            .previewDevice("iPad (8th generation)")
    }
}

struct MateriTableCellView: View {
    
    let materi: DummyMateri
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            ZStack {
                Image(systemName: materi.imageName)
                    .resizable()
                    .scaledToFill()
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        // Likes
                        Text("❤️ \(materi.likes)")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .padding(.top,4)
                            .frame(width : width/3)
                        
                        // duration
                        Text("\(materi.duration) hari")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.white)
                            .padding(.vertical,4)
                            .frame(width: width/3)
                            .background(Color.blue)
                            .cornerRadius(10.0, corners: .topLeft)
                    }
                    .frame(width: width/3)
                    
                }
                .frame(width: width, height: height)
            }
            .frame(width: width, height: height)
            .cornerRadius(10)
            .clipped()
            
            VStack(alignment: .leading) {
                Text(materi.title)
                    .bold()
                Text(materi.author)
                    .bold()
            }
        }
    }
}
