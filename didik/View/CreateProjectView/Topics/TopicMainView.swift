//
//  TopicMainView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct TopicMainView: View {
    @State var selectedTopic: Topic
    
    var body: some View {
        VStack {
            // MARK: - Topics Section
            HStack {
                VStack (alignment: .leading) {
                    Text("Materi Pembelajaran")
                        .padding(.vertical, 5)
                    
                    DropdownTopics(isDropdownShowed: false, selected: .constant(selectedTopic), width: 755)
                }
            }
            
            // MARK: - Section of Core Competence aka Kompentensi Dasar
            HStack {
                VStack (alignment: .leading) {
                    Text("Kompentensi Dasar")
                        .padding(.bottom, 10)
                    
                    ForEach(0..<selectedTopic.basicCompetence.count, id: \.self) { index in
                        HStack (alignment: .center) {
                            if selectedTopic.name != defaultTopic.name {
                                Circle()
                                    .fill(Color.Didik.GreyDark)
                                    .frame(width: 10, height: 10, alignment: .center)
                                    .padding(.trailing, 10)
                            }
                            
                            Text(selectedTopic.basicCompetence[index])
                        }.padding(.bottom, 10)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 15)
                
                Spacer()
            }
        }
    }
}

struct TopicMainViewPreview: PreviewProvider {
    static var previews: some View {
        TopicMainView(selectedTopic: topicList[0])
    }
}
