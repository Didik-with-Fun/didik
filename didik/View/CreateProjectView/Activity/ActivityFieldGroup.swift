//
//  ActivityFieldGroup.swift
//  didik
//
//  Created by Haddawi on 12/11/20.
//

import Foundation
import SwiftUI

struct ActivityFieldGroup: View {
    
    @Binding var contentActivity: ProjectActivity
    @Binding var totalActivityTime: Int
    
    var body: some View {
        VStack {
            HStack (spacing: 10) {
                Button(action: {}, label: {
                    ZStack {
                        Circle()
                            .fill(Color.Didik.GreyLight)
                            .frame(width: 53, height: 53, alignment: .center)
                        Image("ShapeTriangle")
                    }
                })
                    
                TextEditor(text: $contentActivity.name)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                
                Image("Calendar")
                    .resizable()
                    .frame(width: 34, height: 34, alignment: .center)
                
                Text("\(contentActivity.time) Hari")
                    .padding(0)
                
                Stepper("", onIncrement: incrementStep, onDecrement: decrementStep)
                .labelsHidden()
                .frame(height: 75)
                .padding(0)
            }
            
            // TODO: Text Editor have to be minimized white users toggle the drop button on the left of each activity
            TextEditor(text: $contentActivity.description)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                .padding(.bottom, 10)
        }
    }
    
    func incrementStep() {
        if self.contentActivity.time <= 9 {
            self.contentActivity.time += 1
            self.totalActivityTime += 1
        }
    }

    func decrementStep() {
        if self.contentActivity.time >= 1 {
            self.contentActivity.time -= 1
            self.totalActivityTime -= 1
        }
    }
}

struct ActivityFieldGroupPreview: PreviewProvider {
    static var previews: some View {
        ActivityFieldGroup(contentActivity: .constant(ProjectActivity(name: "", description: "", time: 0)), totalActivityTime: .constant(0))
    }
}
