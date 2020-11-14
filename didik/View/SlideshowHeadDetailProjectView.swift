//
//  SlideshowHeadDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct SlideshowHeadDetailProjectView: View {
    
    let project: Project
    var parentGeometry: GeometryProxy
    
    var body: some View {
        
        VStack {
            
            TabView {
                if (project.images.count == 0) {
                    Image.Didik.generateRandomDefaultImage(subject: project.subject)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .tag(1)
                }
                
                else {
                    ForEach(0 ..< project.images.count) { index in
                        VStack {
                            
                            Image.Didik.generateRandomDefaultImage(subject: project.subject)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFill()
                                .tag(index)
                            
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
        
    static var previews: some View {
        NavigationView {
            
            GeometryReader { geometry in
                SlideshowHeadDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0], parentGeometry: geometry)
                    .previewDevice("iPad (8th generation)")
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
