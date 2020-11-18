//
//  KelasSayaMainView.swift
//  didik
//
//  Created by Haddawi on 18/11/20.
//

import Foundation
import SwiftUI

struct KelasSayaMainView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Icon").resizable()
                    .frame(width: 321, height: 242, alignment: .leading)
                    .padding(.bottom, 100)
                
                Text("Coming Soon")
                    .font(.system(size: 45, weight: .light))
                    .foregroundColor(Color.Didik.BluePrimary)
            }
            .navigationBarTitle("Kelas Saya", displayMode: .automatic)
            .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
            .navigationBarItems(trailing: UserButton())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct KelasSayaMainViewPreview: PreviewProvider {
    static var previews: some View {
        KelasSayaMainView()
    }
}
