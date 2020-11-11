//
//  IndicatorOverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct IndicatorOverviewDetailProjectView: View {
    
    let project: Project

    var body: some View {
        HStack (alignment: .top){
            VStack {
                Image.Didik.LoveRed
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("\(project.likes)")
            }
            
            VStack {
                Image.Didik.CalendarDays
                    .resizable()
                    .frame(width: 47, height: 50)
                    .overlay(Text("\(project.getTotalActivitiesDays())").padding(.top, 10),
                             alignment: .center)
                Text("Hari")
                
            }
            .padding(.leading, 30)
            
            VStack {
                Text(project.summary)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            .padding(.leading, 30)
            
            Spacer()
            
        }
        
    }
}

struct IndicatorOverviewDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        IndicatorOverviewDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
    }
}
