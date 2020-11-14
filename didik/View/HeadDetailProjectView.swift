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
        VStack (alignment: .leading){
            SlideshowHeadDetailProjectView(project: project, parentGeometry: parentGeometry)
            
            Text(project.name)
                .fontWeight(.bold)
                .font(.system(size: 24))
                .padding(.top, 15)
                .padding(.bottom, 5)

            ButtonsDetailProjectView(project: project)
        }
        
    }
}

struct HeadDetailProjectView_Previews: PreviewProvider {

    static var previews: some View {
        
        GeometryReader { geometry in
            HeadDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }
        
    }
}
