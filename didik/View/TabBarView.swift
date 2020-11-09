//
//  TabBarView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 29/10/20.
//

import SwiftUI


struct TabBarView: View {
    @Binding var index: Int
    @State var tabBar1: Bool = true
    @State var tabBar2: Bool = false
    @State var tabBar3: Bool = false
    
    let color = Color(K.TabBarColor)
    
    var body: some View {
        HStack(spacing: 10) {
            Button(action: {
                self.index = 0
                self.tabBar1 = true
                self.tabBar2 = false
                self.tabBar3 = false
            }) {
                TabBarButton(isPressed: $tabBar1, imageName: "house.fill", title: "Jelajah Materi")
                    .padding(.horizontal)
            }
            Button(action: {
                self.index = 1
                self.tabBar1 = false
                self.tabBar2 = true
                self.tabBar3 = false
            }) {
                TabBarButton(isPressed: $tabBar2, imageName: "hurricane", title: "Materi Saya")
                    .padding(.horizontal)
            }
            Button(action: {
                self.index = 2
                self.tabBar1 = false
                self.tabBar2 = false
                self.tabBar3 = true
            }) {
                TabBarButton(isPressed: $tabBar3, imageName: "photo", title: "Kelas Saya")
                    .padding(.horizontal)
            }
        }
        .padding(.vertical, 5)
        .background(color)
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            TabBarView()
//            TabBarButton(isPressed: false, imageName: "photo", title: "Photo")
//        }
//    }
//}

struct TabBarButton: View {
    
    @Binding var isPressed: Bool
    let imageName: String
    let title: String
    let color: Color = Color(K.TabBarColor)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(self.isPressed ? .white : color)
                .frame(maxHeight: 40)
                
            
            
            HStack {
                Image(systemName: imageName).foregroundColor(self.isPressed ? color : .white)
                    .font(.system(size: 20))
                Text(title)
                    .foregroundColor(self.isPressed ? color : .white)
                    .font(.system(size: 13, weight: .semibold))
                    .padding(.leading, 15)
            }
            
        }
    }
    
}
