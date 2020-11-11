//
//  HeadDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct HeadDetailProjectView: View {
    var parentGeometry: GeometryProxy
    
    var body: some View {
        VStack {
            SlideshowHeadDetailProjectView(parentGeometry: parentGeometry)
            ButtonsDetailProjectView()
        }
        
    }
}

struct HeadDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geometry in
            HeadDetailProjectView(parentGeometry: geometry)
                .previewDevice("iPad (8th generation)")
        }
        
    }
}
