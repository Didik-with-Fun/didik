//
//  UserProfileHeaderView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/8/20.
//

import SwiftUI

struct UserProfileHeaderView: View {
    
    var fullName: String?

    let gradient = Gradient(colors: [Color.Didik.BluePrimary, .white])

    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                VStack {
                    
                    Image("userProfileDemo")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(Circle())
                        .clipped()
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .padding(.top, 75)

                    Text("\(fullName ?? "")")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)

                    Text("Teacher")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.white)
                        .padding(5)
                        .padding(.bottom, 43)

                }
                
                Spacer()
                
            }
                   
        }
        .background(Color.Didik.BluePrimary)
        .navigationBarColor(backgroundColor: .clear,
                            titleColor: UIColor.white)

    }
}

struct UserProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileHeaderView(fullName: "Mike Gordon")
            .previewDevice("iPad (8th generation)")
    }
}
