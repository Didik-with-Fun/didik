//
//  CustomDropDownMenu.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 05/11/20.
//

import SwiftUI

struct CustomDropDownMenu : View {
    
    @EnvironmentObject var db: DummyModel
    
    let optionKelas: [Kelas] = Kelas.allCases
    let optionMatpel: [Matpel] = Matpel.allCases
    
    @State var isShowedKelas: Bool = false
    @State var isShowedMatpel: Bool = false
    @Binding var selectedKelas: Kelas
    @Binding var selectedMatpel: Matpel
    
    let width: CGFloat
    
    var body: some View {
        HStack(spacing: 10) {
            // first drop down
            VStack {
                Button(action: {
                    self.isShowedKelas.toggle()
                }) {
                    HStack(spacing : 10) {
                        Text(selectedKelas.rawValue)
                            .frame(width: width * 0.85, alignment: .center)
                            .padding(.vertical, 8)
                            .padding(.leading, 10)
                        Image(systemName: "chevron.up")
                            .frame(width: width * 0.15, alignment: .center)
                            .padding(.vertical, 8)
                            .padding(.trailing, 10)
                    }
                }
                .foregroundColor(.white)
                .background(Color(K.TabBarColor))
                .overlay(
                    VStack{
                        if isShowedKelas {
                            VStack {
                                ForEach(0..<self.optionKelas.count) {
                                    index in
                                    Button(action: {
                                        self.isShowedKelas.toggle()
                                        self.selectedKelas = optionKelas[index]
                                        self.db.filterKelas(kelas: self.selectedKelas)
                                        self.db.updateMateriGroup()
                                    }) {
                                        Text(optionKelas[index].rawValue)
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .bold, design: .default))
                                            .padding(.vertical, 10)
                                            .frame(width: width, alignment: .center)
                                    }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }, alignment: .topLeading
                )
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
            )
            .padding(.vertical, 10)
            
            //second drop down
            VStack {
                Button(action: {
                    self.isShowedMatpel.toggle()
                }) {
                    HStack(spacing : 10) {
                        Text(selectedMatpel.rawValue)
                            .frame(width: width * 0.85, alignment: .center)
                            .padding(.vertical, 8)
                            .padding(.leading, 10)
                        Image(systemName: "chevron.up")
                            .frame(width: width * 0.15, alignment: .center)
                            .padding(.vertical, 8)
                            .padding(.trailing, 10)
                    }
                }
                .foregroundColor(.white)
                .background(Color(K.TabBarColor))
                .overlay(
                    VStack{
                        if isShowedMatpel {
                            VStack {
                                ForEach(0..<self.optionMatpel.count) {
                                    index in
                                    Button(action: {
                                        self.isShowedMatpel.toggle()
                                        self.selectedMatpel = optionMatpel[index]
                                        self.db.filterMatpel(matpel: self.selectedMatpel)
                                        self.db.updateMateriGroup()
                                    }) {
                                        Text(optionMatpel[index].rawValue)
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .bold, design: .default))
                                            .padding(.vertical, 10)
                                            .frame(width: width, alignment: .center)
                                    }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }, alignment: .topLeading
                )
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
            )
            .padding(.vertical, 10)
        }
        
    }
}

struct CustomDropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropDownMenu(selectedKelas: .constant(.X), selectedMatpel: .constant(.Fisika), width: 130)
    }
}
