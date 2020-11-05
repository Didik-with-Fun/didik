//
//  UserButton.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 05/11/20.
//

import SwiftUI

struct UserButton: View {
    var body: some View {
        NavigationLink(
            destination: DummyView(),
            label: {
                Image(systemName: "person.circle")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding()
            })
    }
}

struct UserButton_Previews: PreviewProvider {
    static var previews: some View {
        UserButton()
    }
}
