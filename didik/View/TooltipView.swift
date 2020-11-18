//
//  TooltipView.swift
//  didik
//
//  Created by Haddawi on 09/11/20.
//

import Foundation
import SwiftUI

struct TooltipView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var tooltip: Tooltips
    @Binding var showPopOver: Bool
    
    var writeFunction: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .center) {
                HStack (alignment: .center, spacing: 20) {
                    Text("\(tooltip.value.title)").fontWeight(.semibold).font(.system(size: 20))
                }
                .padding(.top, 20)
                
                if tooltip.value.icon != "" {
                    Image(tooltip.value.icon)
                        .padding(.top, 20)
                }
                
                Text("\(tooltip.value.description)")
                    .frame(width: 500)
                    .font(.system(size: 20))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                
                if tooltip == .confirmationPublish {
                    // MARK: - Opt Button
                    Button(action: {
                        self.writeFunction()
                    }, label: {
                        Text("Publish")
                            .frame(width: 258, height: 48)
                            .background(Color.Didik.BlueSecondary)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                } else if tooltip == .projectPublishSuccess || tooltip == .projectDraftSuccess {
                    Button(action: {
                        self.showPopOver = false
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Ok")
                            .frame(width: 258, height: 48)
                            .background(Color.Didik.BlueSecondary)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                } else {
                    Button(action: {
                        self.showPopOver = false
                    }, label: {
                        Text("Ok")
                            .frame(width: 258, height: 48)
                            .background(Color.Didik.BlueSecondary)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                }
            }
            .background(Color.white)
            .cornerRadius(15)
            .padding(20)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

struct TooltipView_Previews: PreviewProvider {
    static var previews: some View {
        TooltipView(tooltip: .constant(.projectDraftSuccess), showPopOver: .constant(false), writeFunction: {})
    }
}
