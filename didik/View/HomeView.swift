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
    
    var body: some View {
        VStack {
            ZStack {
                
                // Jelajah Materi Tab
                JelajahMateriView()
                    .opacity(index == 0 ? 1 : 0)
                
                /*
                CreateProjectView(selectedSubject: .constant(.Mathematic), showPopOverContents: .constant(.namaProyek), isDropdownSubjectOpen: false)
                .opacity(index == 1 ? 1 : 0)
                */

                // Materi Saya Tab
                MateriSayaView()
                    .opacity(index == 1 ? 1 : 0)
                
                // Kelas Saya Tab
                Button(action: {
                    withAnimation {
                        self.show.toggle()
                    }
                }, label: {
                    Text("Materi Saya")
                })
                .opacity(index == 2 ? 1 : 0)
                
                if self.show {
                    GeometryReader {_ in
                        VStack(alignment: .center) {
                            TooltipView(tooltip: .constant(.namaProyek))
                        }
                    }.background(
                        Color.black.opacity(0.6)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                withAnimation {
                                    self.show.toggle()
                                }
                            }
                    )
                }
                
                
                Spacer()
            }
            
            TabBarView(index: $index)
            
        }.ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ProjectDatabaseViewModel())
            .previewDevice("iPad (8th generation)")
    }
}
