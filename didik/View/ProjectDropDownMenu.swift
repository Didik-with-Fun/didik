//
//  CustomDropDownMenu.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 05/11/20.
//

import SwiftUI

struct ProjectDropDownMenu : View {
    
    @EnvironmentObject var db: ProjectDatabaseViewModel
    
    let optionGrades: [Grades] = Grades.allCases
    let optionSubjects: [Subjects] = Subjects.allCases
    
    @State var showGradesDropDown: Bool = false
    @State var showSubjectsDropDown: Bool = false
    @Binding var selectedGrade: Grades
    @Binding var selectedSubject: Subjects
    
    let width: CGFloat
    
    var body: some View {
//        Text("AA")
        HStack(spacing: 10) {
            // first drop down
            VStack {
                Button(action: {
                    self.showGradesDropDown.toggle()
                }) {
                    HStack(spacing : 10) {
                        Text("\(selectedGrade.rawValue)")
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
                .background(Color(K.bluePrimary))
                .overlay(
                    VStack{
                        if showGradesDropDown {
                            VStack {
                                ForEach(0..<self.optionGrades.count) {
                                    index in
                                    Button(action: {
                                        self.showGradesDropDown.toggle()
                                        self.selectedGrade = optionGrades[index]
                                        self.db.filterGrades(grade: self.selectedGrade)
                                        self.db.updateProjectsGroup()
                                    }) {
                                        Text("\(optionGrades[index].rawValue)")
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
                    self.showSubjectsDropDown.toggle()
                }) {
                    HStack(spacing : 10) {
                        Text(selectedSubject.rawValue)
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
                .background(Color(K.bluePrimary))
                .overlay(
                    VStack{
                        if showSubjectsDropDown {
                            VStack {
                                ForEach(0..<self.optionSubjects.count) {
                                    index in
                                    Button(action: {
                                        self.showSubjectsDropDown.toggle()
                                        self.selectedSubject = optionSubjects[index]
                                        self.db.filterSubjects(subject: self.selectedSubject)
                                        self.db.updateProjectsGroup()
                                    }) {
                                        Text(optionSubjects[index].rawValue)
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
        ProjectDropDownMenu(selectedGrade: .constant(.ten), selectedSubject: .constant(.Physic), width: 130)
    }
}
