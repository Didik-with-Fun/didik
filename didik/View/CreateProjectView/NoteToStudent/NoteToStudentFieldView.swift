//
//  ProjectNotesFieldView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct NoteToStudentFieldView: View {
    @Binding var contentNotes: String
    @Binding var showPopOver: Bool
    @Binding var showPopOverContents: Tooltips
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Catatan untuk Siswa")
                            .padding(.vertical, 5)
                        
                        Button(action: { childShowPopover() }, label: {
                            Image("Info")
                        })
                    }
                    
                    ZStack {
                        if contentNotes.isEmpty {
                            TextField("Berikan catatan lain untuk siswa. Contoh : hal yang harus atau tidak perlu dikerjakan", text: $contentNotes, onEditingChanged: { (changed) in
                                            print("--> Debug: ProjectNotes onEditingChanged - \(changed)")
                            })
                            .font(Font.system(size: 20))
                            .textFieldStyle(PlainTextFieldStyle())
                            .foregroundColor(Color.Didik.GreyLight)
                            .frame(height: 100)
                            .padding(.leading, 4)
                            .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                        } else {
                            TextEditor(text: $contentNotes)
                                .frame(height: 100)
                                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                        }
                    }
                    
                }
            }.padding([.top, .horizontal], 20)
        }
    }
    
    private func childShowPopover() {
        self.showPopOverContents = .catatanSiswa
        self.showPopOver = true
    }
}

struct NoteToStudentFieldViewPreview: PreviewProvider {
    static var previews: some View {
        NoteToStudentFieldView(contentNotes: .constant(""), showPopOver: .constant(false), showPopOverContents: .constant(.catatanSiswa))
    }
}

