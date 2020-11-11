//
//  OverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI


struct OverviewDetailProjectView: View {
    
    let project: Project

    var body: some View {
        VStack {
            IndicatorOverviewDetailProjectView(project: project)
            TeacherOverviewDetailProjectView(project: project)
            CompetenceOverviewDetailView(project: project)
            LearningObjectiveOverviewDetailProjectView(project: project)
        }
        .padding()
        
    }
}


struct OverviewDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        OverviewDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
            .previewDevice("iPad (8th generation)")

    }

}


