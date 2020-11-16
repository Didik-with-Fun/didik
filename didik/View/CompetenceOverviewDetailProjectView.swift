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

                ForEach(0 ..< project.topic.basicCompetence.count) { index in
                    
                    HStack (alignment: .top){
                        
                        if project.topic.name != defaultTopic.name {
                            Circle()
                                .fill(Color.Didik.GreyDark)
                                .frame(width: 10, height: 10, alignment: .top)
                                .padding(.trailing, 10)
                                .padding(.top, 5)
                        }
                        
                        Text(project.topic.basicCompetence[index])
                            .padding(.top,0)
                            .fixedSize(horizontal: false, vertical: true)
                            
                        Spacer()
                    }
                    .padding(.leading, 15)
                    .padding(.bottom, 15)

                }
            
            }
            
            Spacer()
        }
    }
}

struct CompetenceOverviewDetailView_Previews: PreviewProvider {

    static var previews: some View {
        
        GeometryReader { geometry in
            CompetenceOverviewDetailView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }


    }
    
    
}
