//
//  HomeView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct HomeView: View {
    
//    @EnvironmentObject var db: DummyModel
    
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    switch index {
                    case 0:
                        JelajahMateriView()
                    case 1:
                        LihatSemuaView(MateriLibrary: LibraryMateri,
                                       currentTitle: "Materi Saya")
                    case 2:
                        DummyView()
                    default :
                        JelajahMateriView()
                    }
                    Spacer()
                }
                .navigationBarTitle("", displayMode: .automatic)
                .navigationBarItems(trailing: UserButton())
                .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor),
                                    titleColor: UIColor.white)

            }
            .navigationViewStyle(StackNavigationViewStyle())

            Spacer()
            TabBarView(index: $index)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DummyModel())
            .previewDevice("iPad (8th generation)")

    }
}
