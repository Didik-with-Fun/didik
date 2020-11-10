//
//  CustomNavigationBarView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI


struct CustomNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var db: JelajahMateriViewModel
    
    @Binding var filteredGrade: Grades
    @Binding var filteredSubject: Subjects
    @Binding var searchText: String
    let showDropDown: Bool
    
    
    var body: some View {
        VStack (alignment: .leading){

            HStack(spacing: 0){
                if showDropDown {
                    ProjectDropDownMenu(selectedGrade: $filteredGrade, selectedSubject: $filteredSubject, width: UIScreen.main.bounds.width * 0.18)
                        .padding(.trailing, 10)

                }
                SearchBarView(text: $searchText)
                    .padding(.horizontal, 10)
                    .padding(.trailing)

            }
            .padding(.leading, 20)
        }
        .background(Color(K.bluePrimary))
        
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomNavigationBarView(filteredGrade: .constant(.ten), filteredSubject: .constant(.Physic), searchText: .constant(""), showDropDown: false)
            CustomNavigationBarView(filteredGrade: .constant(.ten), filteredSubject: .constant(.Physic), searchText: .constant(""), showDropDown: false)
        }
    }
}
