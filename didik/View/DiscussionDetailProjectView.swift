//
//  DiscussionDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct DiscussionDetailProjectView: View {
    
    let project: Project

    var body: some View {
        Text("Coming Soon")
    }
}

struct DiscussionDetailProjectView_Previews: PreviewProvider {

    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        DiscussionDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
            .previewDevice("iPad (8th generation)")

    }
}
