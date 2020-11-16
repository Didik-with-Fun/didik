//
//  CreateProjectView.swift
//  didik
//
//  Created by Haddawi on 04/11/20.
//

import SwiftUI
import Firebase

let imagePreview1 = "math-preview-1.jpg"
let contentProjectImages = [imagePreview1]
let contentProjectActivities = [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1), ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)]
let contentComments = [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())]

struct CreateProjectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var signInCoordinator: SignInWithAppleCoordinator
    
    // MARK: - State Variable for Data Storing
    @State var contentProjectName: String = ""
    @State var contentSubject: Subject = .Mathematic        // check
    @State var contentGrade: Grades = .ten
    @State var contentTopic: Topic = defaultTopic
    @State var contentSummary: String = ""
    @State var contentLearningGoals: String = ""
    @State var contentMedia: [String] = []
    @State var contentActivities: [ProjectActivity] = []
    @State var contentNotes: String = ""
    

    @State var showPopOver = false
    @State var showPopOverContents: Tooltips = .namaProyek
    
    var contentActivitiesDays: Int = 0
    
    init(project: Project?) {
        _contentProjectName = State(initialValue: project?.name ?? contentProjectName)
        _contentSubject = State(initialValue: project?.subject ?? contentSubject)
        _contentGrade = State(initialValue: project?.grade ?? contentGrade)
        _contentTopic = State(initialValue: project?.topic ?? contentTopic)
        _contentSummary = State(initialValue: project?.summary ?? contentSummary)
        _contentLearningGoals = State(initialValue: project?.goal ?? contentLearningGoals)
        _contentMedia = State(initialValue: project?.images ?? contentMedia)
        _contentActivities = State(initialValue: project?.projectActivities ?? contentActivities)
        self.contentActivitiesDays = project?.getTotalActivitiesDays() ?? contentActivitiesDays
        _contentNotes = State(initialValue: project?.notes ?? contentNotes)
    }
    
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
                        
                        // MARK: - Topics & Core Competence Sections
                        TopicMainView(contentTopic: $contentTopic)
                        
                        // MARK: - Form Field - Project Name aka Nama Proyek
                        ProjectNameFieldView(contentProjectName: $contentProjectName)
                        
                        // MARK: - Form Field - Project Description
                        DescriptionFieldView(contentDescription: $contentSummary)
                        
                        // MARK: - Form Field - Goals aka Tujuan Proyek
                        LearningGoalsFieldView(contentLearningGoals: $contentLearningGoals)
                        
                        // MARK: - Form Field - Media Uploads
                        MediaView(contentMedia: $contentMedia)
                        
                        // MARK: - Form Field - Activity
                        HStack {
                            ActivityMainView(totalActivityTime: contentActivitiesDays, contentActivities: contentActivities)
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Notes aka Catatan Siswa
                        NoteToStudentFieldView(contentNotes: $contentNotes)
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
        
        let newContentProject = Project(
                name: contentProjectName,
                summary: contentSummary,
                subject: contentSubject,
                grade: contentGrade,
                topic: contentTopic,
                goal: contentLearningGoals,
                images: contentProjectImages,
                projectStatus: projectStatus,
                projectActivities: contentProjectActivities,
                notes: contentNotes,
                comments: contentComments,
                likes: 0,
            authorUID : Auth.auth().currentUser!.uid ?? "nil",
            authorName : signInCoordinator.userProfile.fullname
//                authorUID: Author.authorUID ?? "",
//                authorName: Author.authorFullname ?? ""
            )
        
        print("--> Firebase Data Write Project Collection:")
        print(newContentProject)
        print("--> author ID: \(newContentProject.authorUID)")
        print("--> author ID: \(newContentProject.authorName)")
        
        
        if isFormValidate {
            FirebaseRequestService.writeProject(contentProject: newContentProject) { (status) in
                print("--> write project to firebase: \(status)")
                 //do action after saving
                 //animate loading of saving to draft or publishing projects
                 //show error or success
            }
        } else {
            // perform pop up error form uncomplete
            print("Form Uncomplete!")
        }
        
        return
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateProjectView(project: FirebaseRequestService.createDummyProjects()[0])
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
