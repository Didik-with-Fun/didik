//
//  Media.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct MediaView: View {
    @Binding var showPopOver: Bool
    @Binding var showPopOverContents: Tooltips
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    Text("Media")
                        .padding(.vertical, 5)
                    
                    Button(action: { childShowPopover() }, label: {
                        Image("Info")
                    })
                }
                
                ScrollView (.horizontal) {
                    HStack (alignment: .top, spacing: 10) {
                        Button(action: {
                            // action when add media
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.Didik.GreyDark)
                                    .frame(width: 229, height: 126, alignment: .center)
                                    .cornerRadius(10)
                                
                                VStack {
                                    Image("AddLight")
                                        .resizable()
                                        .frame(width: 34, height: 34, alignment: .center)
                                    
                                    Text("Tambah Media")
                                    .foregroundColor(.white)
                                }
                            }
                            //Image("InsertMedia")
                        })
                        
                        
                        Image("InsertMediaDummy").padding(.horizontal, 10)
                        Image("InsertMediaDummy").padding(.horizontal, 10)
                        Image("InsertMediaDummy").padding(.horizontal, 10)
                        Image("InsertMediaDummy").padding(.horizontal, 10)
                        Image("InsertMediaDummy").padding(.horizontal, 10)
                    }
                }
            }
        }.padding([.top, .horizontal], 20)
    }
    
    private func childShowPopover() {
        self.showPopOverContents = .mediaUpload
        self.showPopOver = true
    }
}

struct MediaViewPreview: PreviewProvider {
    static var previews: some View {
        MediaView(showPopOver: .constant(false), showPopOverContents: .constant(.mediaUpload))
    }
}
