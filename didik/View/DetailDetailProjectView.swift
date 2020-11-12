//
//  DetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct DetailDetailProjectView: View {
    
    let project: Project

    var body: some View {
        
        VStack {
            ActivityDetailDetailProjectView(project: project)
            NoteForStudentDetailDetailProjectView(project: project)
        }
        .padding()
        
    }
}

struct DetailDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        DetailDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
            .previewDevice("iPad (8th generation)")

    }
}
