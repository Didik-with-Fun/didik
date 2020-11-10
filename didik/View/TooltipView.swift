//
//  TooltipView.swift
//  didik
//
//  Created by Haddawi on 09/11/20.
//

import Foundation
import SwiftUI

struct TooltipView: View {
    
    @Binding var tooltip: tooltips
    
    var body: some View {
        VStack (alignment: .center) {
            HStack (alignment: .center, spacing: 20) {
                Text("\(tooltip.value.title)").fontWeight(.semibold).font(.system(size: 20))
                /* // 
                 Button(action: {
                    print("Close Pressed!")
                }) {
                    Image(systemName: "xmark")
                    .renderingMode(.original).resizable()
                    .frame(width: 19, height: 19, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }*/
            }
            .padding(.top, 20)
            Text("\(tooltip.value.description)")
                .frame(width: 500)
                .font(.system(size: 20))
                .padding(.top, 20)
                .padding(.bottom, 30)
                .padding(.horizontal, 40)
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding(20)
    }
}

struct TooltipView_Previews: PreviewProvider {
    static var previews: some View {
        TooltipView(tooltip: .constant(.namaProyek))
    }
}
