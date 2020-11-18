//
//  TopicMainView.swift
//  didik
//
//  Created by Haddawi on 13/11/20.
//

import Foundation
import SwiftUI

struct TopicMainView: View {
    let contents: [Topic] = topicList
    
    @State private var isDropdownShowed: Bool = false
    @Binding var contentTopic: Topic
    @Binding var contentGrade: Grades
    @Binding var contentSubject: Subject
    @Binding var dropdownTopicsList: [Topic]
    
    @State private var width: CGFloat = 755
    
    var body: some View {
        VStack {
            // MARK: - Topics Section
            ZStack (alignment: .top) {
            
                HStack {
                    VStack (alignment: .leading) {
                        Text("Materi Pembelajaran")
                            .padding(.vertical, 5)
                        
                        //MARK: - Dropdown Topic on Main View
                        VStack {
                            Button(action: {
                                self.isDropdownShowed.toggle()
                            }) {
                                HStack (spacing: 10) {
                                    Text((self.dropdownTopicsList.count > 0) ? (contentTopic.name) : ("Tidak Tersedia Materi Pembelajaran Pada Kombinasi Pilihan Mata Pelajaran dan Kelas ini"))
                                        .frame(width: width * 0.85, alignment: .center)
                                        .foregroundColor(.black)
                                        .padding(.vertical, 15)
                                        .padding(.trailing, 10)
                                    
                                    Image(systemName: "chevron.down")
                                        .frame(width: width * 0.15, alignment: .center)
                                        .padding(.trailing, 10)
                                        .foregroundColor(.black)
                                }
                            }
                            .foregroundColor(Color.Didik.GreyMedium)
                            .background(Color.Didik.GreyMedium)
                            .padding(.vertical, 0)
                            .cornerRadius(15)
                            .overlay(
                                VStack{
                                    if isDropdownShowed {
                                        VStack {
                                            ForEach(0..<self.dropdownTopicsList.count) {
                                                index in
                                                Button(action: {
                                                    self.isDropdownShowed.toggle()
                                                    self.contentTopic = dropdownTopicsList[index]
                                                }) {
                                                    Text(dropdownTopicsList[index].name)
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 17, weight: .bold, design: .default))
                                                        .padding(.vertical, 10)
                                                        .frame(width: width, alignment: .center)
                                                }
                                            }
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                    }
                                }, alignment: .topLeading
                            )
                        }
                    }
                }
                .zIndex(2)
                
                // MARK: - Section of Core Competence aka Kompentensi Dasar
                HStack {
                    VStack (alignment: .leading) {
                        Text("Kompentensi Dasar")
                            .padding(.bottom, 10)
                        ForEach(0..<contentTopic.basicCompetence.count, id: \.self) { index in
                            HStack (alignment: .center) {
                                if contentTopic.name != defaultTopic.name {
                                    Circle()
                                        .fill(Color.Didik.GreyDark)
                                        .frame(width: 10, height: 10, alignment: .center)
                                        .padding(.trailing, 10)
                                }
                                
                                Text(contentTopic.basicCompetence[index])
                            }.padding(.bottom, 10)
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .zIndex(1)
                .padding(.top, 100)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct TopicMainViewPreview: PreviewProvider {
    static var previews: some View {
        TopicMainView(contentTopic: .constant(defaultTopic), contentGrade: .constant(.allGrades), contentSubject: .constant(.allSubjects), dropdownTopicsList: .constant(topicList))
    }
}
