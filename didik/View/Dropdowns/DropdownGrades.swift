//
//  DropdownSubjects.swift
//  didik
//
//  Created by Haddawi on 11/11/20.
//

import Foundation
import SwiftUI

struct DropdownGrades: View {
    let contents: [Grades] = Grades.allCases
    
    @State var isDropdownShowed: Bool = false
    @Binding var selected: Grades
    
    let width: CGFloat
    
    var body: some View {
        VStack {
            Button(action: {
                self.isDropdownShowed.toggle()
            }) {
                HStack (spacing: 10) {
                    Text(selected.rawValue)
                        .frame(width: width * 0.85, alignment: .center)
                        .foregroundColor(.black)
                        .padding(.vertical, 15)
                        .padding(.trailing, 10)
                    
                    Image(systemName: "chevron.down")
                        .frame(width: width * 0.15, alignment: .center)
                        .padding(.trailing, 10)
                        .foregroundColor(.black)
                }
                .foregroundColor(Color.Didik.GreyMedium)
                .background(Color.Didik.GreyMedium)
                .padding(.vertical, 0)
                .cornerRadius(15)
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

struct DropdownGradesPreview: PreviewProvider {
    static var previews: some View {
        DropdownGrades(selected: .constant(.ten), width: 130)
    }
}
