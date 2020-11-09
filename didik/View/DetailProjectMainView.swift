//
//  DetailProjectMainView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/8/20.
//

import SwiftUI

struct DetailProjectMainView: View {
    
    let title: String

    var body: some View {
        
        VStack {
            HeadDetailProjectView()
                .padding()
            ContentDetailProjectView()
                .padding()
        }
        .navigationBarTitle(title, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(named: K.TabBarColor))
    }
}

struct DetailProjectMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailProjectMainView(title: placeholderMateri.title)
            .previewDevice("iPad (8th generation)")
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}
