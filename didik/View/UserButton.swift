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
            destination: UserProfileView(),
            label: {
                Image(systemName: "person.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 35))
        })
        .padding(.top, 15)
        .padding(.trailing, 25)
    }
}

struct UserButton_Previews: PreviewProvider {
    static var previews: some View {
        UserButton()
    }
}
