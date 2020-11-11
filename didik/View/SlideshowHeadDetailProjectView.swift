//
//  SlideshowHeadDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct SlideshowHeadDetailProjectView: View {
    
    var parentGeometry: GeometryProxy
    private var numberOfImages = 5
    //    private var images: [Image] = ..
    
    init(parentGeometry: GeometryProxy) {
        self.parentGeometry = parentGeometry
     }
    
    var body: some View {
        
        VStack {
            
            TabView {
                ForEach(1 ..< numberOfImages) { num in
                    VStack {
                        Image("demo_slideshow_\(num)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .tag(num)
                        
                        HStack {
                            Text("demo_slideshow_\(num)")
                            Spacer()
                        }
                    }
                }
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: parentGeometry.size.width, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 364, maxHeight: parentGeometry.size.height/3, alignment: .center)

            .tabViewStyle(PageTabViewStyle())
            
            
        }
                
    }
}

struct SlideshowHeadDetailProjectView_Previews: PreviewProvider {
    var parentGeometry: GeometryProxy

    static var previews: some View {
        NavigationView {
            
            GeometryReader { geometry in
                SlideshowHeadDetailProjectView(parentGeometry: geometry)
                    .previewDevice("iPad (8th generation)")
            }

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
