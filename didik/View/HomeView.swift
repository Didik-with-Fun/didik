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
    @State var show = false
    
    var body: some View {
        VStack {
            ZStack {
                
                JelajahMateriView()
                    .opacity(index == 0 ? 1 : 0)
                
                CreateProjectView(selectedSubject: .constant(.Mathematic), showPopOverContents: .constant(.namaProyek), isDropdownSubjectOpen: false)
                .opacity(index == 1 ? 1 : 0)
                
                Text("Kelas Saya View")
                    .opacity(index == 2 ? 1 : 0)
                
                Spacer()
            }
            
            TabBarView(index: $index)
            
        }.ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DummyModel())
            .previewDevice("iPad (8th generation)")
    }
}
