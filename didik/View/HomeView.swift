//
//  HomeView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var db: ProjectDatabaseViewModel
    
    @State var index: Int = 0
    @State var show = false
    
    var parentGeometry: GeometryProxy
    
    var body: some View {
        VStack {
            ZStack {
                
                // Jelajah Materi Tab
                JelajahMateriView(parentGeometry: parentGeometry)
                    .opacity(index == 0 ? 1 : 0)

                // Materi Saya Tab
                MateriSayaView(parentGeometry: parentGeometry)
                    .opacity(index == 1 ? 1 : 0)
                
                // Kelas Saya Tab
                Button(action: {}, label: {
                    Text("Materi Saya")
                })
                .opacity(index == 2 ? 1 : 0)
                
                Spacer()
            }
            
            TabBarView(index: $index)
            
        }.ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            HomeView(parentGeometry: geometry)
                .environmentObject(ProjectDatabaseViewModel())
                .previewDevice("iPad (8th generation)")
            
        }
    }
}
