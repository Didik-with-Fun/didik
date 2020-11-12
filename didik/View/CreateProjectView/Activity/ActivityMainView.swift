//
//  ActivityMainView.swift
//  didik
//
//  Created by Haddawi on 12/11/20.
//

import Foundation
import SwiftUI

struct ActivityMainView: View {
    
    @State var totalActivityTime: Int = 0
    @State var dummy = ["Text 1"]
    @State var contentActivities: [ProjectActivity] = []
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            HStack {
                Text("Aktifitas")
                    .padding(.vertical, 5)
                
                Button(action: {}, label: {
                    Image("Info")
                })
            }
            
            ForEach(contentActivities, id: \.self) { activity in
                ActivityFieldGroup(contentActivityName: activity.name, contentActivityTime: activity.time, contentActivityDescription: activity.description)
            }
            
            Button(action: {
                self.addActivityView()
                print("--> NEW ACTIVITY ADED, \(contentActivities)")
            }, label: {
                ZStack {
                    Rectangle()
                        .fill(Color.Didik.GreyLight)
                        .frame(height: 53, alignment: .center)
                        .cornerRadius(15)
                    
                    Image("Add")
                        .resizable()
                        .frame(width: 34, height: 34, alignment: .center)
                }
            })
            
            HStack (spacing: 10) {
                Spacer()
                
                Image("CalendarBold")
                    .resizable()
                    .frame(width: 34, height: 34, alignment: .center)
                
                Text("Total: \(totalActivityTime) hari")
                    .font(.system(size: 19, weight: .bold))
                    .padding(.trailing, 10)
            }
            
        }
    }
    
    private func addActivityView() {
        // TODO: - Dynamicly add new activity and push it to contentActivities array of ProjectActivity
        let newActivity = ProjectActivity(name: "Aktifitas Proyek Bersama Guru", description: "Quick jump fox runs over the lazy dog", time: 2)
        
        self.contentActivities.append(newActivity)
    }
}

struct ActivityMainViewPreview: PreviewProvider {
    static var previews: some View {
        ActivityMainView(totalActivityTime: 0)
    }
}
