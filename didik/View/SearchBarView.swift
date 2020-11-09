//
//  SearchBarView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 03/11/20.
//

import SwiftUI
 
struct SearchBarView: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State var coba = "COBA"
    static var previews: some View {
        SearchBarView(text: .constant("COBA"))
    }
}
