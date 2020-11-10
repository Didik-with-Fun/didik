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
        ScrollView(.vertical)  {
            VStack {
                HeadDetailProjectView()
                    .padding()
                ContentDetailProjectView()
                    .padding()
            }
        }
        .navigationBarTitle(title, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
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
