//
//  ProjectNameFieldView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct ProjectNameFieldView: View {
    @Binding var contentProjectName: String
    @Binding var showPopOver: Bool
    @Binding var showPopOverContents: Tooltips
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Nama Proyek")
                            .padding(.vertical, 5)
                        
                        Button(action: { childShowPopover() }, label: {
                            Image("Info")
                        })
                    }
                    
                    TextField("Tuliskan permasalahan utama yang akan diselesaikan dalam proyek", text: $contentProjectName, onEditingChanged: { (changed) in
                                    print("Username onEditingChanged - \(changed)")
                    })
                    .font(Font.system(size: 20))
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.black)
                    .frame(height: 50)
                    .padding(.leading, 4)
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                }
            }.padding([.top, .horizontal], 20)
        }
    }
    
    private func childShowPopover() {
        self.showPopOverContents = .namaProyek
        self.showPopOver = true
    }
}

struct ProjectNameFieldViewPreview: PreviewProvider {
    static var previews: some View {
        ProjectNameFieldView(contentProjectName: .constant(""), showPopOver: .constant(false), showPopOverContents: .constant(.namaProyek))
    }
}


