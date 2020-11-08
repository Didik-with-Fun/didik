//
//  CreateProjectView.swift
//  didik
//
//  Created by Haddawi on 04/11/20.
//

import SwiftUI

struct CreateProjectView: View {
    // ---  on development ---
    
    @State var subject = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                TextField("Matematika", text: $subject).padding().colorMultiply(.red)
                TextField("Topic", text: $subject).padding()
            }
        }
        
//        VStack{
//            Form{
//                Text("Mata Pelajaran").font(.title)
//                TextField("Mata Pelajaran", text: $subject)
//            }
//        }
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView()
    }
}
