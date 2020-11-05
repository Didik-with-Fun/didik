//
//  HomeView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct HomeView: View {
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    switch index {
                    case 1:
                        Text("Halaman My Materi")
                    case 2:
                        Text("Halaman Kelas Saya")
                    default :
                        JelajahMateriView()
                    }
                    Spacer()
                }.navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            Spacer()
            TabBarView(index: $index)
        }.ignoresSafeArea(.keyboard, edges: .bottom)
            
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
