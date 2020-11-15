//
//  CreateProjectView.swift
//  didik
//
//  Created by Haddawi on 04/11/20.
//

import SwiftUI

struct CreateProjectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - State Variable for Data Storing
    /*
    @State var contentProjectName: String = ""
    @State var contentSubject: Subject
    @State var contentGrade: Grades
    @State var contentTopic: Topic
    @State var contentDescriptions: String
    @State var contentGoals: String
    @State var contentMedia: [String]
    @State var contentActivities: [ProjectActivity]
    @State var contentNotes: String
    */
    
    let project: Project?

    @State var selectedSubject: Subject
    @State var selectedGrade: Grades
    @State var contentNamaProyek: String = ""
    @State var showPopOver = false
    @State var showPopOverContents: Tooltips
    
    let isDropdownSubjectOpen: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    // MARK: - Form View
                    VStack {
                        
                        // MARK: - Subjects & Grades Dropdown
                        HStack (spacing: 30) {
                            
                            // MARK: - Subjects Dropdown
                            VStack (alignment: .leading) {
                                Text("Mata Pelajaran")
                                    .padding(.vertical, 5)
                                
                                DropdownSubject(selected: $selectedSubject, width: 350)
                            }
                            
                            // MARK: - Grades Dropdown
                            VStack (alignment: .leading) {
                                Text("Kelas")
                                    .padding(.vertical, 5)
                                
                                DropdownGrades(selected: $selectedGrade, width: 350)
                            }
                        }
                        .padding(.vertical, 20)
                        
                        // MARK: - Topics & Core Competence Sections
                        TopicMainView()
                        
                        // MARK: - Form Field - Project Name aka Nama Proyek
                        ProjectNameFieldView(contentProjectName: project?.name ?? "" )
                        
                        // MARK: - Form Field - Project Description
                        DescriptionFieldView(contentDescription: project?.summary ?? "")
                        
                        // MARK: - Form Field - Goals aka Tujuan Proyek
                        LearningGoalsFieldView(contentLearningGoals: project?.goal ?? "")
                        
                        // MARK: - Form Field - Media Uploads
                        MediaView(contentImages: project?.images ?? [])
                        
                        // MARK: - Form Field - Activity
                        HStack {
                            ActivityMainView(totalActivityTime: project?.getTotalActivitiesDays() ?? 0, contentActivities: project?.projectActivities ?? [])
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Notes aka Catatan Siswa
                        NoteToStudentFieldView(contentNotes: project?.notes ?? "")
                    }
                    
                    if self.showPopOver {
                        GeometryReader {_ in
                            VStack(alignment: .center) {
                                TooltipView(tooltip: .constant(.namaProyek))
                            }
                        }.background(
                            Color.black.opacity(0.6)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    withAnimation {
                                        self.showPopOver.toggle()
                                    }
                                }
                        )
                    }
                }
                
                // MARK: - Buttons View
                HStack (spacing: 20) {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Save to Draft")
                        .frame(width: 258, height: 48)
                        .background(Color.Didik.GreyDark)
                        .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                    
                    Button(action: {}, label: {
                        Text("Publish")
                        .frame(width: 258, height: 48)
                        .background(Color.Didik.BluePrimary)
                        .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                }
                .padding(20)
            }
        }
        .navigationBarTitle("Materi Saya", displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateProjectView(project: nil, selectedSubject: .Mathematic, selectedGrade: .ten, contentNamaProyek: "", showPopOver: false, showPopOverContents: .namaProyek, isDropdownSubjectOpen: false)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
