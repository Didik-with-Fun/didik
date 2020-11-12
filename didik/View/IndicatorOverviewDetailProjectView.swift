//
//  IndicatorOverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct IndicatorOverviewDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack(alignment: .center) {
                    VStack {
                        Image.Didik.LoveRed
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("\(project.likes)")
                    }
                    
                    
                    Rectangle().fill(Color.clear).frame(width: 1, height: 100, alignment: .bottom)
                        .overlay(Rectangle().fill(Color.Didik.BlueSecondary).frame(width: 1, height: 90, alignment: .bottom))
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                    
                    VStack {
                        Image.Didik.CalendarDays
                            .resizable()
                            .frame(width: 47, height: 50)
                            .overlay(Text("\(project.getTotalActivitiesDays())").padding(.top, 10),
                                     alignment: .center)
                        Text("Hari")
                        
                    }
                }
                
                HStack (alignment: .bottom) {
                    Text(project.summary)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.leading, 30)
                }
                
                Spacer()
                
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
              
        }
        .padding(.top, 15)
        
    }
}

struct IndicatorOverviewDetailProjectView_Previews: PreviewProvider {
    
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()
    
    static var previews: some View {
        GeometryReader { geometry in
            IndicatorOverviewDetailProjectView(project: projectDatabaseVideModel.allProjects[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }
        
    }
}
