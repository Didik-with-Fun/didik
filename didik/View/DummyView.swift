//
//  DummyView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 31/10/20.
//

import SwiftUI

struct DummyView: View {
    

    
    var body: some View {
        VStack {
            Text("DUMMY VIEW")
            
        }
    
        .navigationBarTitle("Dummy", displayMode: .automatic)
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
        .navigationBarItems(trailing: UserButton())
        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
            .previewDevice("iPad (8th generation)")
        
    }
}
