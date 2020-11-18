//
//  DummyView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 31/10/20.
//

import SwiftUI

struct DummyView: View {
    
    @State var bool = false
    
    var body: some View {
        
        RefreshableScrollView(refreshing: $bool) {
            HStack(alignment: .top){
                HStack (alignment: .bottom) {
                    VStack {
                        Image.Didik.Love
                        Text("DUMMY VIEW")
                        
                    }
                    Text("Center")
                    VStack {
                        Image.Didik.Love
                        Text("DUMMY VIEW")
                        
                    }
                }
                Spacer()
                Image.Didik.MathematicDarkBlue
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Image.Didik.CalendarDays
                        Text("ASDAD")
                        Image.Didik.CalendarDays
                    }
                }

            }.fixedSize(horizontal: false, vertical: true)
        }
//        HStack(alignment: .top){
//            HStack (alignment: .bottom) {
//                VStack {
//                    Image.Didik.Love
//                    Text("DUMMY VIEW")
//
//                }
//                Text("Center")
//                VStack {
//                    Image.Didik.Love
//                    Text("DUMMY VIEW")
//
//                }
//            }
//            Spacer()
//            Image.Didik.MathematicDarkBlue
//                .resizable()
//                .scaledToFit()
//
//            VStack {
//                Spacer()
//                HStack(alignment: .bottom) {
//                    Image.Didik.CalendarDays
//                    Text("ASDAD")
//                    Image.Didik.CalendarDays
//                }
//            }
//
//        }.fixedSize(horizontal: false, vertical: true)
        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
            .previewDevice("iPad (8th generation)")
        
    }
}
