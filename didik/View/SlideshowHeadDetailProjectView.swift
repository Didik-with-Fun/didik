//
//  SlideshowHeadDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct SlideshowHeadDetailProjectView: View {
    
    private var numberOfImages = 5
//    private var images: [Image] = ..
    
    var body: some View {
        TabView {
            ForEach(1 ..< numberOfImages) { num in
                VStack {
                    Image("demo_slideshow_\(num)")
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                    HStack {
                        Text("demo_slideshow_\(num)")
                        Spacer()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct SlideshowHeadDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SlideshowHeadDetailProjectView()
            .previewDevice("iPad (8th generation)")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
