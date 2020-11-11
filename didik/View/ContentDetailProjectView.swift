//
//  ContentDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct ContentDetailProjectView: View {
    
    let project: Project

    @State private var selectedSegment = 0

    var body: some View {
        
        VStack {
            
            Picker(selection: $selectedSegment, label: Text("What is your favorite color?")) {
                Text("Overview").tag(0)
                Text("Detail").tag(1)
                Text("Discussion").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if (selectedSegment) == 1 {
                DetailDetailProjectView()
            }
            else if (selectedSegment) == 2 {
                DiscussionDetailProjectView()
            }
            else {
                OverviewDetailProjectView()
            }
            
            Spacer()
            
        }
    }
}
struct ContentDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        NavigationView {
            ContentDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
                .previewDevice("iPad (8th generation)")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
