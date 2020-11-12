//
//  DetailProjectMainView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/8/20.
//

import SwiftUI

struct DetailProjectMainView: View {

    let project: Project
    var parentGeometry: GeometryProxy
    let title: String
    
    //let project: Project
    
    var body: some View {
        
        ScrollView(.vertical)  {
            VStack {
                HeadDetailProjectView(project: project, parentGeometry: parentGeometry)
                    .padding()
                ContentDetailProjectView(project: project)
                    .padding()
            }
        }
            
        .navigationBarTitle(title, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
    }
}

struct DetailProjectMainView_Previews: PreviewProvider {
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        NavigationView {
            GeometryReader { geometry in
                DetailProjectMainView(project: projectDatabaseVideModel.allProjects[0], parentGeometry: geometry, title: placeholderMateri.title)
                    .previewDevice("iPad (8th generation)")
            }
            

        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}
