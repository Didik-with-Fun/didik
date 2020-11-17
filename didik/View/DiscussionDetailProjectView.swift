//
//  DiscussionDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct DiscussionDetailProjectView: View {
    
    let project: Project

    var body: some View {
        VStack {
            Text("Coming Soon")
        }
    }
}

struct DiscussionDetailProjectView_Previews: PreviewProvider {

    static var previews: some View {
        DiscussionDetailProjectView(project: FirebaseRequestService.createDummyProjects()[0])
            .previewDevice("iPad (8th generation)")

    }
}
