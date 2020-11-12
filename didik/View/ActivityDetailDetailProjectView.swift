//
//  ActivityDetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct ActivityDetailDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Aktivitas")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding()
                
                
                ForEach(0 ..< project.projectActivities.count) { index in
                
                    HStack (alignment: .top){
                        
                        Text("\(index+1).")
                            .font(.system(size: 24))

                        VStack (alignment: .leading) {
                            Text("\(project.projectActivities[index].name)" )
                                .font(.system(size: 24))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.leading, 10)
                                .padding(.bottom, 2)
                            Text("\(project.projectActivities[index].description)" )
                                .font(.system(size: 18))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.leading, 10)
                        }

                        Spacer()
                    }
                    .padding(.leading, 15)
                    .padding(.bottom, 20)
                    
                }
                
            }
                        
            Spacer()
        }
        .padding()
    }
}

struct ActivityDetailDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        
        GeometryReader { geometry in
            ActivityDetailDetailProjectView(project: projectDatabaseVideModel.allProjects[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }

    }
}
