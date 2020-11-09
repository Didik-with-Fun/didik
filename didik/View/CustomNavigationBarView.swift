//
//  CustomNavigationBarView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI


struct CustomNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var db: DummyModel
    
    @Binding var filterKelas: Kelas
    @Binding var filterMatpel: Matpel
    @Binding var searchText: String
    let showDropDown: Bool
    
    
    var body: some View {
        VStack (alignment: .leading){

            HStack(spacing: 0){
                if showDropDown {
                    CustomDropDownMenu(selectedKelas: $filterKelas, selectedMatpel: $filterMatpel, width: UIScreen.main.bounds.width * 0.18)
                        .padding(.trailing, 10)

                }
                SearchBarView(text: $searchText)
                    .padding(.horizontal, 10)
                    .padding(.trailing)

            }
            .padding(.leading, 20)
        }
        .background(Color(K.TabBarColor))
        
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomNavigationBarView(filterKelas: .constant(.X), filterMatpel: .constant(.Fisika), searchText: .constant(""), showDropDown: false)
            CustomNavigationBarView(filterKelas: .constant(.X), filterMatpel: .constant(.Fisika), searchText: .constant(""), showDropDown: false)
        }
    }
}
