//
//  ButtonsDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI
import Foundation
import FirebaseFirestoreSwift
import Firebase

struct ButtonsDetailProjectView: View {
    
    let project: Project

    // TODO: Convert Date to User Friendly Interface Format Date
    //var date: String {
        //DateUtil.convertDoubleToDate(date: project.createdDate)
    //}

    var body: some View {
        
        VStack {
            HStack {
                Text("\(project.subject.rawValue) \(project.grade.rawValue) || \(DateUtil.convertTimestampToDate(timestamp: project.createdDate ?? Timestamp()))")
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack {
                
                NavigationLink(
                    destination: CreateProjectView(project: project),
//                    destination: CreateProjectView(project: project, selectedSubject: project.subject, selectedGrade: project.grade, showPopOverContents: .deskripsiProyek, isDropdownSubjectOpen: true),
                    label: {
                      HStack(spacing: 10) {
                                    Image(systemName: "plus")
                                    Text("Gunakan Materi Ini")
                                
                            }
                            
                            .frame(width: 200, height: 30)
                            .padding()
                            .background(Color.Didik.BlueSecondary)
                            .foregroundColor(.white)
                        .cornerRadius(10)
                    })
                          
                Spacer()
                Image.Didik.Love
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Image.Didik.Bookmark
                    .resizable()
                    .frame(width: 40, height: 40)

                Image.Didik.Share
                    .resizable()
                    .frame(width: 40, height: 40)

            }

            .padding(.top, 17)
        }
    }
}

struct ButtonsDetailProjectView_Previews: PreviewProvider {

    static var previews: some View {
        ButtonsDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0])
    }
}
