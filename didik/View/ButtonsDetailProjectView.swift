//
//  ButtonsDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct ButtonsDetailProjectView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("Matematika XII IPA || 22 Februari 2020 || Title Image")
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 40, height: 40)

                Image(systemName: "arrowshape.turn.up.right")
                    .resizable()
                    .frame(width: 40, height: 40)

            }

            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack(spacing: 10) {
                            Image(systemName: "plus")
                            Text("Gunakan Materi Ini")
                        
                    }
                    
                    .frame(width: 200, height: 30)
                    .padding()
                    .background(Color(K.TabBarColor))
                    .foregroundColor(.white)
                })
                .cornerRadius(10)
                
                Spacer()
            }
            .padding(.top, 17)
        }
    }
}

struct ButtonsDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsDetailProjectView()
    }
}
