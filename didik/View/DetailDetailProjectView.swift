//
//  DetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/9/20.
//

import SwiftUI

struct DetailDetailProjectView: View {
    var body: some View {
        
        VStack {
            ActivityDetailDetailProjectView()
            NoteForStudentDetailDetailProjectView()
        }
        .padding()
        
    }
}

struct DetailDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDetailProjectView()
            .previewDevice("iPad (8th generation)")
    }
}
