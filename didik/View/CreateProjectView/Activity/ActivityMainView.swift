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
    @State var contentActivities: [ProjectActivity]
    @State var contentActivity: ProjectActivity = ProjectActivity(name: "", description: "", time: 0)
    @Binding var showPopOver: Bool
    @Binding var showPopOverContents: Tooltips
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            HStack {
                Text("Aktifitas")
                    .padding(.vertical, 5)
                
                Button(action: { childShowPopover() }, label: {
                    Image("Info")
                })
            }
            
            ForEach(0..<contentActivities.count, id: \.self) { index in
                ActivityFieldGroup(contentActivity: $contentActivities[index], totalActivityTime: $totalActivityTime)
            }
            
            Button(action: {
                self.addActivityView()
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
        let newActivity = ProjectActivity(name: "", description: "", time: 0)
        
        self.contentActivities.append(newActivity)
    }
    
    private func childShowPopover() {
        self.showPopOverContents = .aktifitas
        self.showPopOver = true
    }
}

struct ActivityMainViewPreview: PreviewProvider {
    static var previews: some View {
        ActivityMainView(contentActivities: [], showPopOver: .constant(false), showPopOverContents: .constant(.aktifitas))
    }
}
