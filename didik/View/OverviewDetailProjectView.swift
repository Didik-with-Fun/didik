//
//  OverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI


struct OverviewDetailProjectView: View {
    var body: some View {
        VStack {
            IndicatorOverviewDetailProjectView()
            TeacherOverviewDetailProjectView()
            CompetenceOverviewDetailView()
            LearningObjectiveOverviewDetailProjectView()
        }
        .padding()
        
    }
}


struct OverviewDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewDetailProjectView()
            .previewDevice("iPad (8th generation)")

    }
}


