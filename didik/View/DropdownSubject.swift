//
//  DropdownSubject.swift
//  didik
//
//  Created by Haddawi on 09/11/20.
//

import Foundation
import SwiftUI

struct DropdownSubject: View {
    let contents: [Subjects] = Subjects.allCases
    
    @State var isDropdownShowed: Bool = false
    @Binding var selected: Subjects
    
    let width: CGFloat
    
    var body: some View {
        VStack {
            Button(action: {
                self.isDropdownShowed.toggle()
            }) {
                HStack (spacing: 10) {
                    Text(selected.rawValue)
                        .frame(width: width * 0.85, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 8)
                        .padding(.trailing, 10)
                    Image(systemName: "chevron.up")
                        .frame(width: width * 0.15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 9)
                        .padding(.trailing, 10)
                }
                .foregroundColor(.white)
                .background(Color(K.bluePrimary))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding(.vertical, 10)
                .overlay(
                    VStack{
                        if isDropdownShowed {
                            VStack {
                                ForEach(0..<self.contents.count) {
                                    index in
                                    Button(action: {
                                        self.isDropdownShowed.toggle()
                                        self.selected = contents[index]
                                        // store subject pick and prepare POST
                                    }) {
                                        Text(contents[index].rawValue)
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .bold, design: .default))
                                            .padding(.vertical, 10)
                                            .frame(width: width, alignment: .center)
                                    }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }, alignment: .topLeading
                )
            }
        }
    }
}

struct DropdownSubjectPreviews: PreviewProvider {
    static var previews: some View {
        DropdownSubject(selected: .constant(.Mathematic), width: 130)
    }
}
