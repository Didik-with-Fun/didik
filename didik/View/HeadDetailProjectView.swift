//
//  HeadDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct HeadDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy
    
    var body: some View {
        VStack {
            SlideshowHeadDetailProjectView(project: project, parentGeometry: parentGeometry)
            ButtonsDetailProjectView(project: project)
        }
        
    }
}

struct HeadDetailProjectView_Previews: PreviewProvider {
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        
        GeometryReader { geometry in
            HeadDetailProjectView(project: projectDatabaseVideModel.allProjects[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }
        
    }
}
