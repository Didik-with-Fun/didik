//
//  HomeView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct HomeView: View {
    @State var index : Int = 0
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    switch index {
                    case 1:
                        VStack{
//                            CustomNavigationBarView(title: "My Materi", filterKelasString: "", filterMateriString: "", showDropDown: false, previousTitle: nil)
//                                .ignoresSafeArea()
                            Text("Halaman 1")
                        }
                    case 2:
                        Text("Halaman 2 WOWOWO")
                    default :
                        JelajahMateriView()
                    }
                    Spacer()
//                    TabBarView(index: $index)
                }.navigationBarTitle("")
                .navigationBarHidden(true)
//                .navigationBarColor(UIColor.systemBlue)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            TabBarView(index: $index)
        }
        
            
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
