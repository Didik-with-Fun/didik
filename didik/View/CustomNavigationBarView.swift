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
    
//    let title: String
    @Binding var filterKelas: Kelas
    @Binding var filterMatpel: Matpel
    @Binding var searchText: String
    let showDropDown: Bool
//    let previousTitle: String?
    
    
    var body: some View {
        VStack (alignment: .leading){
//            HStack {
//                if previousTitle != nil {
//                    Button(action: {
//                        self.presentationMode.wrappedValue.dismiss()
//                    }) {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                                .aspectRatio(contentMode: .fit)
//                            Text(previousTitle ?? "back")
//                        }.padding()
//                        .foregroundColor(.white)
//                    }
//                    .padding(.leading)
//                } else {
//                    HStack {
//                        Text("")
//                    }.padding()
//                }
//                Spacer()
//            }.padding(.top, 10)
//            HStack {
//                Text(title)
//                    .font(.title)
//                    .bold()
//                    .foregroundColor(Color.white)
//                Spacer()
//                NavigationLink(
//                    destination: DummyView(),
//                    label: {
//                        Image(systemName: "person.circle")
//                            .foregroundColor(.black)
//                            .font(.system(size: 20))
//                            .padding(.horizontal)
//                    })
//
//            }.padding(.leading, 20)
            HStack(spacing: 0){
                if showDropDown {
                    CustomDropDownMenu(selectedKelas: $filterKelas, selectedMatpel: $filterMatpel, width: UIScreen.main.bounds.width * 0.18)
                        .padding(.trailing, 10)
//                    HStack(spacing: 10) {
//                        CustomDropDownMenu(options: ["Yes", "No","Hide"], selected: $filterKelasString, width: UIScreen.main.bounds.width * 0.15)
//                        CustomDropDownMenu(options: ["What","Yes", "No","Hide"], selected: $filterMateriString, width: UIScreen.main.bounds.width * 0.15)
//                            .padding(.trailing, 10)
//                    }
                } //else {
//                    VStack {
//                        HStack {
//                            Text("")
//                                .padding(.vertical, 8)
//
//                        }
//                    }.padding(.vertical, 10)
//
//
//                }

                SearchBarView(text: $searchText)
                    .padding(.horizontal, 10)
                    .padding(.trailing)

            }.padding(.leading, 20)
        }.background(Color(K.TabBarColor))
        
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
