//
//  ActivityDetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct ActivityDetailDetailProjectView: View {
    
    let project: Project

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

                        VStack (alignment: .leading) {
                            Text("\(project.projectActivities[index].name)" )
                                .font(.system(size: 24))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
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
    }
}

struct ActivityDetailDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        ActivityDetailDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
            .previewDevice("iPad (8th generation)")

    }
}
