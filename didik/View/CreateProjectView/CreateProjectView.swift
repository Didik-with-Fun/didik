//
//  CreateProjectView.swift
//  didik
//
//  Created by Haddawi on 04/11/20.
//

import SwiftUI
import Firebase

let contentProjectImages = ["math-preview-1.jpg"]
let contentComments = [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())]

struct CreateProjectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - State Variable for Data Storing
    @State var contentProjectName: String = ""
    @State var contentSubject: Subject = .Mathematic
    @State var contentGrade: Grades = .ten
    @State var contentTopic: Topic = defaultTopic
    @State var contentSummary: String = ""
    @State var contentLearningGoals: String = ""
    @State var contentMedia: [String] = []
    @State var contentActivities: [ProjectActivity] = []
    @State var contentNotes: String = ""
    
    @State var showPopOver = false
    @State var showPopOverContents: Tooltips = .namaProyek
    
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
                                
                                DropdownSubject(contentSubject: $contentSubject, width: 350)
                            }
                            
                            // MARK: - Grades Dropdown
                            VStack (alignment: .leading) {
                                Text("Kelas")
                                    .padding(.vertical, 5)
                                
                                DropdownGrades(contentGrade: $contentGrade, width: 350)
                            }
                        }
                        .padding(.vertical, 20)
                        .zIndex(10)
                        
                        // MARK: - Topics & Core Competence Sections
                        TopicMainView(contentTopic: $contentTopic)
                        .zIndex(9)
                        
                        // MARK: - Form Field - Project Name aka Nama Proyek
                        ProjectNameFieldView(contentProjectName: $contentProjectName, showPopOver: $showPopOver, showPopOverContents: $showPopOverContents)
                        
                        // MARK: - Form Field - Project Description
                        DescriptionFieldView(contentDescription: $contentSummary, showPopOver: $showPopOver, showPopOverContents: $showPopOverContents)
                        
                        // MARK: - Form Field - Goals aka Tujuan Proyek
                        LearningGoalsFieldView(contentLearningGoals: $contentLearningGoals, showPopOver: $showPopOver, showPopOverContents: $showPopOverContents)
                        
                        // MARK: - Form Field - Media Uploads
                        MediaView(showPopOver: $showPopOver, showPopOverContents: $showPopOverContents)
                        
                        // MARK: - Form Field - Activity
                        HStack {
                            ActivityMainView(contentActivities: contentActivities, showPopOver: $showPopOver, showPopOverContents: $showPopOverContents)
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Notes aka Catatan Siswa
                        NoteToStudentFieldView(contentNotes: $contentNotes, showPopOver: $showPopOver, showPopOverContents: $showPopOverContents)
                    }
                    
                    if self.showPopOver {
                        GeometryReader { geometry in
                            TooltipView(tooltip: $showPopOverContents, showPopOver: $showPopOver, writeFunction: {          self.write(projectStatus: .Published)
                                        self.showPopOver = false
                                })
                                .position(x: geometry.size.width / 2, y: (geometry.size.height - (geometry.size.height / 2)))
                        }
                        .background(
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
                    
                    // MARK: - Save to Draft Button
                    Button(action: {
                        projectWriteFirebase(projectStatus: .Draft)
                    }, label: {
                        Text("Save to Draft")
                            .frame(width: 258, height: 48)
                            .background(Color.Didik.GreyDark)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                    
                    // MARK: - Published Button
                    Button(action: {
                        
                        projectWriteFirebase(projectStatus: .Published)
                    }, label: {
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
    
    func validateForm() -> Bool {
        if (contentGrade == .allGrades) {
            print("ERROR: Grade unselected!")
        } else if (contentSubject == .allSubjects) {
            print("ERROR: Subject unselected!")
        } else if (contentTopic.name == defaultTopic.name) {
            print("ERROR: Topic unselected!")
        } else if (contentProjectName == "") {
            print("ERROR: Project Name Must Be Written!")
        } else {
            return true
        }
        
        return false
    }
    
    func projectWriteFirebase(projectStatus: ProjectStatus) {

        let isFormValidate = validateForm()
        
        if !isFormValidate {
            // perform pop up error form
            print("Form Uncomplete!")
            return
        }
        
        if projectStatus == .Published {
            self.showPopOverContents = .confirmationPublish
            self.showPopOver = true
        } else if projectStatus == .Draft {
            self.write(projectStatus: .Draft)
        }
        
        return
    }
    
    func write(projectStatus: ProjectStatus) {
        self.showPopOver = false
        
        print("writing to firebase...")
        
        let newContentProject = Project(
                name: contentProjectName,
                summary: contentSummary,
                subject: contentSubject,
                grade: contentGrade,
                topic: contentTopic,
                goal: contentLearningGoals,
                images: contentProjectImages,
                projectStatus: projectStatus,
                projectActivities: contentActivities,
                notes: contentNotes,
                comments: contentComments,
                likes: 0,
                authorUID: Author.authorUID ?? "",
                authorName: Author.authorFullname ?? ""
        )
        
        FirebaseRequestService.writeProject(contentProject: newContentProject) { (status) in
            print("--> write project to firebase: \(status)")
            
            if status {
                self.showPopOverContents = (projectStatus == .Published) ? (.projectPublishSuccess) : (.projectDraftSuccess)
            } else {
                self.showPopOverContents = (projectStatus == .Published) ? (.projectPublishFailed) : (.projectDraftFailed)
            }
            
            self.showPopOver = true
        }
        
        return
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateProjectView(showPopOver: false, showPopOverContents: .namaProyek)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
