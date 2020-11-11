//
//  LearningObjectiveOverviewDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct LearningObjectiveOverviewDetailProjectView: View {
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Tujuan Pembelajaran")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(15)
                
                Text("Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV 4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV")
                    .fixedSize(horizontal: false, vertical: true)
                    
                    .padding(.leading, 15)
                
                //                    Spacer()
                
            }
            Spacer()
        }
    }
}

struct LearningObjectiveOverviewDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        LearningObjectiveOverviewDetailProjectView()
    }
}
