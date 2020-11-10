//
//  IndicatorOverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct IndicatorOverviewDetailProjectView: View {
    var body: some View {
        HStack (alignment: .top){
            VStack {
                Image("LoveRed")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("335")
            }
            
            VStack {
                Image("CalendarDays")
                    .resizable()
                    .frame(width: 47, height: 50)
                    .overlay(Text("99").padding(.top, 10),
                             alignment: .center)
                Text("Hari")
                
            }
            .padding(.leading, 30)
            
            VStack {
                Text("Peserta didik mampu mengkonstruksi pengetahuan dan mempunyai keterampilan menyelesaikan masalah nyata yang berkaitan dengan SPLTV.")
            }
            .padding(.leading, 30)
            
        }
        
    }
}

struct IndicatorOverviewDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorOverviewDetailProjectView()
    }
}
