//
//  DetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct DetailDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy

    var body: some View {
        
        VStack {
            ActivityDetailDetailProjectView(project: project, parentGeometry: parentGeometry)

            Rectangle().fill(Color.Didik.BlueLight).frame(height: 16)

            NoteForStudentDetailDetailProjectView(project: project, parentGeometry: parentGeometry)
        }
        
    }
}

struct DetailDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        
        GeometryReader { geometry in
            DetailDetailProjectView(project: projectDatabaseVideModel.allProjects[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }

    }
}
