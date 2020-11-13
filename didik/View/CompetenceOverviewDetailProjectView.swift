//
//  CompetenceView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct CompetenceOverviewDetailView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy

    var body: some View {
        HStack (alignment: .top){
            VStack {
                HStack (alignment: .top) {
                    Text("Kompentensi Dasar")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding()
                
                //TODO: ganti dengan projectCompetences
                ForEach(0 ..< project.projectActivities.count) { index in
                    
                    HStack (alignment: .top){
                        Text("KD 3.1")
                        
                        Text("Ini template aja \(project.projectActivities[index].name)")
                            .fixedSize(horizontal: false, vertical: true)

                            .padding(.leading, 10)
                            
                            Spacer()
                    }
                    .padding(.leading, 15)
                    .padding(.bottom, 15)

                }
            
                HStack (alignment: .top){
                    Text("KD 3.1")
                    
                    Text("Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.")
                        .fixedSize(horizontal: false, vertical: true)

                        .padding(.leading, 10)
                        
                        Spacer()
                }
                .padding(.leading, 15)
                .padding(.bottom, 15)

                HStack (alignment: .top) {
                    Text("KD 3.2")
                    
                    Text("Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.")
                        .fixedSize(horizontal: false, vertical: true)

                        .padding(.leading, 10)
                        
                        Spacer()
                }
                .padding(.leading, 15)
                
            }
            
            Spacer()
        }
    }
}

struct CompetenceOverviewDetailView_Previews: PreviewProvider {

    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        
        GeometryReader { geometry in
            CompetenceOverviewDetailView(project: projectDatabaseVideModel.allProjects[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }


    }
    
    
}
