//
//  ContentDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct ContentDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy
    
    @State private var selectedSegment = 0
    
    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("Overview").tag(0)
                Text("Detail").tag(1)
                Text("Discussion").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if (selectedSegment) == 1 {
                DetailDetailProjectView(project: project, parentGeometry: parentGeometry)
            }
            else if (selectedSegment) == 2 {
                DiscussionDetailProjectView(project: project)
            }
            else {
                OverviewDetailProjectView(project: project, parentGeometry: parentGeometry)
            }
            
            Spacer()
            
        }
    }
}
struct ContentDetailProjectView_Previews: PreviewProvider {
        
    static var previews: some View {
        GeometryReader { geometry in
            ContentDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }
          
    }
    
}
