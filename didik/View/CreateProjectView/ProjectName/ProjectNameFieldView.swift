//
//  ProjectNameFieldView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct ProjectNameFieldView: View {
    @State var contentProjectName: String
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Nama Proyek")
                            .padding(.vertical, 5)
                        
                        Button(action: {}, label: {
                            Image("Info")
                        })
                    }
                    if contentProjectName.isEmpty {

                        TextField("Tuliskan permasalahan utama yang akan diselesaikan dalam proyek", text: $contentProjectName, onEditingChanged: { (changed) in
                                        print("Username onEditingChanged - \(changed)")
                        })
                        .font(Font.system(size: 20))
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(Color.Didik.GreyLight)
                        .frame(height: 50)
                        .padding(.leading, 4)
                        .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                    }
                    else {
                        TextEditor(text: $contentProjectName)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                    }
                    
                }
            }.padding([.top, .horizontal], 20)
        }
    }
}

struct ProjectNameFieldViewPreview: PreviewProvider {
    static var previews: some View {
        ProjectNameFieldView(contentProjectName: "")
    }
}


