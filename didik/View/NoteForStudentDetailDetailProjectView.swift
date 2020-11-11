//
//  NoteForStudentDetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct NoteForStudentDetailDetailProjectView: View {
    
    let project: Project

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Catatan untuk siswa")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(15)
                
                HStack {
                    Text(project.notes)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                .padding(15)
                
                
            }
            Spacer()
        }
    }
}

struct NoteForStudentDetailDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        NoteForStudentDetailDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
            .previewDevice("iPad (8th generation)")

    }
}
