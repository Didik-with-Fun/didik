//
//  ActivityDetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct ActivityDetailDetailProjectView: View {
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Aktivitas")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding()
                
                HStack (alignment: .top){
                    
                    Text("1.")
                    
                    VStack (alignment: .leading) {
                        Text("Mengintepretasi persamaan dan pertidaksamaan nilai")
                            .font(.system(size: 24))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.leading, 10)
                            .padding(.bottom, 10)
                        Text("Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.")
                            .font(.system(size: 18))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.leading, 10)
                    }

                    Spacer()
                }
                .padding(.leading, 15)
                .padding(.bottom, 20)

                HStack (alignment: .top){
                    
                    Text("2.")
                    
                    VStack (alignment: .leading) {
                        Text("Mengintepretasi persamaan dan pertidaksamaan nilai")
                            .font(.system(size: 24))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.leading, 10)
                            .padding(.bottom, 10)
                        Text("Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.")
                            .font(.system(size: 18))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.leading, 10)
                    }

                    Spacer()
                }
                .padding(.leading, 15)
                
            }
            
            
            Spacer()
        }
    }
}

struct ActivityDetailDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailDetailProjectView()
    }
}
