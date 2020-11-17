//
//  LearningGoalsFieldView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct LearningGoalsFieldView: View {
    @Binding var contentLearningGoals: String
    @Binding var showPopOver: Bool
    @Binding var showPopOverContents: Tooltips
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Tujuan Pembelajaran")
                            .padding(.vertical, 5)
                        
                        Button(action: { childShowPopover() }, label: {
                            Image("Info")
                        })
                    }
                    
                    /*ZStack {
                        if contentLearningGoals.isEmpty {
                            TextField("Tuliskan tujuan pemebelajaran dari proyek yang ingin dibuat", text: $contentLearningGoals, onEditingChanged: { (changed) in
                                            print("--> Debug: Learning Goals onEditingChanged - \(changed)")
                            })
                            .font(Font.system(size: 20))
                            .textFieldStyle(PlainTextFieldStyle())
                            
                            .foregroundColor(Color.Didik.GreyLight)
                            .frame(height: 100)
                            .padding(.leading, 4)
                            .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                        } else {
                            TextEditor(text: $contentLearningGoals)
                                .frame(height: 100)
                                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                        }
                    }*/
                    
                    TextEditor(text: $contentLearningGoals)
                        .frame(height: 100)
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                }
            }.padding([.top, .horizontal], 20)
        }
    }
    
    private func childShowPopover() {
        self.showPopOverContents = .tujuanPembelajaran
        self.showPopOver = true
    }
}

struct LearningGoalsFieldViewPreview: PreviewProvider {
    static var previews: some View {
        LearningGoalsFieldView(contentLearningGoals: .constant(""), showPopOver: .constant(false), showPopOverContents: .constant(.tujuanPembelajaran))
    }
}

