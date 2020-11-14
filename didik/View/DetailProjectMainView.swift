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
    
    
    var body: some View {
        
        ScrollView(.vertical)  {
            VStack {
                HeadDetailProjectView(project: project, parentGeometry: parentGeometry)
                    .padding()
                ContentDetailProjectView(project: project, parentGeometry: parentGeometry)
            }
        }
            
        .navigationBarTitle(title, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
    }
}

struct DetailProjectMainView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            GeometryReader { geometry in
                DetailProjectMainView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry, title: placeholder.name)
                    .previewDevice("iPad (8th generation)")
            }
            

        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}
