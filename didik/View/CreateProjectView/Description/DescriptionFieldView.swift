//
//  DescriptionFieldView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct DescriptionFieldView: View {
    @State var contentDescription: String
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Deskripsi/ Ringkasan Proyek")
                            .padding(.vertical, 5)
                        
                        Button(action: {}, label: {
                            Image("Info")
                        })
                    }
                    
                    ZStack {
                        if contentDescription.isEmpty {
                            TextField("Tuliskan permasalahan utama yang akan diselesaikan dalam proyek", text: $contentDescription, onEditingChanged: { (changed) in
                                            print("Username onEditingChanged - \(changed)")
                            })
                            .font(Font.system(size: 20))
                            .textFieldStyle(PlainTextFieldStyle())
                            
                            .foregroundColor(Color.Didik.GreyLight)
                            .frame(height: 100)
                            .padding(.leading, 4)
                            .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                        } else {
                            TextEditor(text: $contentDescription)
                                .frame(height: 100)
                                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                        }
                    }
                    
                }
            }.padding([.top, .horizontal], 20)
        }
    }
}

struct DescriptionFieldViewPreview: PreviewProvider {
    static var previews: some View {
        DescriptionFieldView(contentDescription: "")
    }
}
