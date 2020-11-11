//
//  CreateProjectView.swift
//  didik
//
//  Created by Haddawi on 04/11/20.
//

import SwiftUI

struct CreateProjectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var selectedSubject: Subject
    let isDropdownSubjectOpen: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                HStack {
                    if isDropdownSubjectOpen {
                        DropdownSubject(selected: $selectedSubject, width: 130)
                    }
                }
            }
        }
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView(selectedSubject: .constant(.Mathematic), isDropdownSubjectOpen: false)
    }
}
