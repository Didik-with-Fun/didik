//
//  LearningObjectiveOverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct LearningObjectiveOverviewDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy

    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                HStack {
                    Text("Tujuan Pembelajaran")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(15)
                
                Text(project.goal)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading, 15)
                
                //                    Spacer()
                
            }
            Spacer()
        }
    }
}

struct LearningObjectiveOverviewDetailProjectView_Previews: PreviewProvider {

    static var previews: some View {
        
        GeometryReader { geometry in
            LearningObjectiveOverviewDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }

    }
}
