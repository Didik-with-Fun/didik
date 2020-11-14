//
//  ActivityFieldGroup.swift
//  didik
//
//  Created by Haddawi on 12/11/20.
//

import Foundation
import SwiftUI

struct ActivityFieldGroup: View {
    
    @State var contentActivityName: String
    @State var contentActivityTime: Int
    @State var contentActivityDescription: String
    
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
                    
                TextEditor(text: $contentActivityName)
                    .frame(height: 55)
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                
                Image.Didik.Calendar
                    .resizable()
                    .frame(width: 34, height: 34, alignment: .center)
                
                Text("\(contentActivityTime) Hari")
                    .padding(0)
                
                Stepper("", value: $contentActivityTime, in: 0...30)
                    .labelsHidden()
                    .frame(height: 75)
                    .padding(0)
            }
            
            // TODO: Text Editor have to be minimized white users toggle the drop button on the left of each activity
            TextEditor(text: $contentActivityDescription)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                .padding(.bottom, 10)
        }
    }
}

struct ActivityFieldGroupPreview: PreviewProvider {
    static var previews: some View {
        ActivityFieldGroup(contentActivityName: "", contentActivityTime: 0, contentActivityDescription: "")
    }
}
