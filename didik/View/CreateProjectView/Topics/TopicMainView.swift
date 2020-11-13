//
//  TopicMainView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct TopicMainView: View {
    var body: some View {
        VStack {
            // MARK: - Topics Section
            HStack {
                VStack (alignment: .leading) {
                    Text("Materi Pembelajaran")
                        .padding(.vertical, 5)
                    
                    DropdownTopics(isDropdownShowed: false, selected: .constant(topicList[0]), width: 755)
                }
            }
            
            // MARK: - Section of Core Competence aka Kompentensi Dasar
            HStack {
                VStack (alignment: .leading) {
                    Text("Kompentensi Dasar")
                        .padding(.vertical, 10)
                    
                    HStack (alignment: .top) {
                        Text("KD 3.1")
                        
                        Text("Menjelaskan dan menentukan penyelesaian pertidaksamaan rasional dan irasional satu variabel.")
                    }.padding(.bottom, 5)
                    
                    HStack (alignment: .top) {
                        Text("KD 3.1")
                        
                        Text("Menjelaskan dan menentukan penyelesaian pertidaksamaan rasional dan irasional satu variabel.")
                    }.padding(.bottom, 5)
                }
                .padding(.top, 20)
            }
        }
    }
}

struct TopicMainViewPreview: PreviewProvider {
    static var previews: some View {
        TopicMainView()
    }
}
