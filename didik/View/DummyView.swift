//
//  DummyView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 31/10/20.
//

import SwiftUI

struct DummyView: View {
    @ObservedObject var coba = cobain()
    
    @State var index = 0 {
        didSet {
            print(index)
        }
    }
    
    var body: some View {
        
        RefreshableScrollView(refreshing: self.$coba.bool) {
            VStack{
                Text("SADASD")
                Text("SADASD")
                Text("SADASD")
                Text("SADASD")
                Text("SADASD")
                Button(action: {
                    self.index += 1
                }, label: {
                    Text("Button")
                })

            }.fixedSize(horizontal: false, vertical: true)
        }

        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
            .previewDevice("iPad (8th generation)")
        
    }
}

class cobain: ObservableObject {
    @Published var bool: Bool = false {
        didSet {
            if oldValue == false && bool == true {
                self.load()
                
            }
        }
    }
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                    
                    print("REFRESH UDEEE")
            self.bool = false
                }
    }
}
