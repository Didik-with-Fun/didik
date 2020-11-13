//
//  ButtonsDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct ButtonsDetailProjectView: View {
    
    let project: Project

    var date: String {
        DateUtil.convertDoubleToDate(date: project.createdDate)
    }

    var body: some View {
        
        VStack {
            HStack {
                Text("\(project.subject.rawValue) || \(date)")
                    .foregroundColor(.gray)
                Spacer()
            }
            HStack {
                Spacer()
                Image.Didik.Love
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Image.Didik.Bookmark
                    .resizable()
                    .frame(width: 40, height: 40)

                Image.Didik.Share
                    .resizable()
                    .frame(width: 40, height: 40)

            }

            HStack {
                
                Button(action: {}, label: {
                    HStack(spacing: 10) {
                            Image(systemName: "plus")
                            Text("Gunakan Materi Ini")
                        
                    }
                    
                    .frame(width: 200, height: 30)
                    .padding()
                    .background(Color.Didik.BlueSecondary)
                    .foregroundColor(.white)
                })
                .cornerRadius(10)
                
                Spacer()
            }
            .padding(.top, 17)
        }
    }
}

struct ButtonsDetailProjectView_Previews: PreviewProvider {
    static var projectDatabaseVideModel = ProjectDatabaseViewModel()

    static var previews: some View {
        ButtonsDetailProjectView(project: projectDatabaseVideModel.allProjects[0])
    }
}
