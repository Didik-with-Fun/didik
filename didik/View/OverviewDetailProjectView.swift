//
//  OverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI


struct OverviewDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy

    var body: some View {
        VStack {
            IndicatorOverviewDetailProjectView(project: project, parentGeometry: parentGeometry).padding()

            Rectangle().fill(Color.Didik.BlueLight).frame(height: 1)

            TeacherOverviewDetailProjectView(project: project, parentGeometry: parentGeometry).padding()
            
            Rectangle().fill(Color.Didik.BlueLight).frame(height: 16)

            CompetenceOverviewDetailView(project: project, parentGeometry: parentGeometry).padding()
            
            Rectangle().fill(Color.Didik.BlueLight).frame(height: 16)

            LearningObjectiveOverviewDetailProjectView(project: project, parentGeometry: parentGeometry).padding()
        }
        
    }
}


struct OverviewDetailProjectView_Previews: PreviewProvider {
    
    static var previews: some View {        
        GeometryReader { geometry in
            OverviewDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }

    }

}


