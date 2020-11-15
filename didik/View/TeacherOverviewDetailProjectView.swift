//
//  TeacherOverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct TeacherOverviewDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy

    var body: some View {
        HStack {
            
            VStack {
                Text("Guru")
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                Image("userProfileDemo")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 81, height: 81, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .clipped()
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
            }
            
            VStack {
                HStack {
                    Text("FX Catur Supatmono")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                    Spacer()
                }
//                HStack {
//                    Text("Guru Matematika Kelas XI IPA")
//                        .foregroundColor(Color.Didik.GreyDark)
//                        .font(.system(size: 18))
//                    Text(" | ")
//                        .foregroundColor(Color.Didik.GreyDark)
//                        .font(.system(size: 18))
//                    Text("SAM Kolese de Britto")
//                        .foregroundColor(Color.Didik.GreyDark)
//                        .font(.system(size: 18))
//                    Spacer()
//                }
                
            }
            
            Spacer()
            
        }
        .padding(.top, 10)
    }
}

struct TeacherOverviewDetailProjectView_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { geometry in
            TeacherOverviewDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }

    }
}
