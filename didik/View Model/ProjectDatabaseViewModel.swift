//
//  JelajahMateriViewModel.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 10/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ProjectsGroup: Identifiable {
    let id = UUID()
    let title: String
    let group: [Project]
}

enum ViewType: String {
    case jelajah = "Jelajah Materi"
    case myMateri = "Materi Saya"
    case lihatSemua
}

class ProjectDatabaseViewModel: ObservableObject {
    
    // all projects from firebase
    var allProjects: [Project] = []
    
    // variabel to filter projects from jelajah materi view
    @Published var filteredProjects: [Project] = []

    @Published var jelajahMateriGroup: [ProjectsGroup] = []
    
    
    var myAllProjects: [Project] = []
    @Published var myProjects: [Project] = []

    @Published var myProjectsGroup: [ProjectsGroup] = []
    
    
    var specificProjects: [Project] = []
    @Published var filteredSpecificProjects: [Project] = []
    
    init() {
        print("view model init delay")
        FirebaseRequest.requestAllProject { (result) in
            switch result {
            case .success(let requestProjects):
                print("data fetched")
                // initialize jelajah materi project database
                self.allProjects = requestProjects
                self.filteredProjects = requestProjects

                
                // initialize my materi project database
                self.myAllProjects = requestProjects
                self.myProjects = requestProjects

                
                let temp = Dictionary(grouping: self.filteredProjects) { (project) -> String in
                    return project.topic.name
                }
                for (key, value) in temp {
                    self.jelajahMateriGroup.append(ProjectsGroup(title: key, group: value))
                }
                
                
                let myTemp = Dictionary(grouping: self.myProjects) { (project) -> ProjectStatus in
                    return project.projectStatus
                }
                for (key, value) in myTemp {
                    self.myProjectsGroup.append(ProjectsGroup(title: key.rawValue, group: value))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    func filter(grade: Grades, subject: Subject, view: ViewType) {
        
        switch view {
        case .myMateri:
           filterMyMateri(grade: grade, subject: subject)
            
        case .lihatSemua:
            filterLihatSemua(grade: grade, subject: subject)
            
        default:
            // jelajah
            filterJelajah(grade: grade, subject: subject)
        }
        
    }
    
    
    
    func updateProjectsGroup() {
        self.jelajahMateriGroup = []
        
        let temp = Dictionary(grouping: filteredProjects) { (project) -> String in
            return project.topic.name
        }
        for (key, value) in temp {
            self.jelajahMateriGroup.append(ProjectsGroup(title: key, group: value))
        }
        
    }
    
    
    
    func filterMyMateri(grade: Grades, subject: Subject) {
        let filterGrade = self.myAllProjects.filter { (Project) -> Bool in
            if grade == .allGrades {
                return true
            } else {
                return Project.grade == grade
            }
        }
        
        let filterSubject = filterGrade.filter { (Project) -> Bool in
            if subject == .allSubjects {
                return true
            } else {
                return Project.subject == subject
            }
        }
        
        self.myProjects = filterSubject
        
        self.updateMyProjectsGroup()
    }
    
    
    func filterJelajah(grade: Grades, subject: Subject) {
        let filterGrade = self.allProjects.filter { (Project) -> Bool in
            if grade == .allGrades {
                return true
            } else {
                return Project.grade == grade
            }
        }
        
        let filterSubject = filterGrade.filter { (Project) -> Bool in
            if subject == .allSubjects {
                return true
            } else {
                return Project.subject == subject
            }
        }
        
        self.filteredProjects = filterSubject
        
        self.updateProjectsGroup()
    }
    
    
    
    func filterLihatSemua(grade: Grades, subject: Subject) {
        
        let filterGrade = self.specificProjects.filter { (Project) -> Bool in
            if grade == .allGrades {
                return true
            } else {
                return Project.grade == grade
            }
        }
        
        let filterSubject = filterGrade.filter { (Project) -> Bool in
            if subject == .allSubjects {
                return true
            } else {
                return Project.subject == subject
            }
        }
        
        self.filteredSpecificProjects = filterSubject
    }
    
    
    
    
    
}

//MARK: - My project extension
extension ProjectDatabaseViewModel {

    
    func updateMyProjectsGroup() {
        self.myProjectsGroup = []
        
        let temp = Dictionary(grouping: myProjects) { (project) -> ProjectStatus in
            return project.projectStatus
        }
        for (key, value) in temp {
            self.myProjectsGroup.append(ProjectsGroup(title: key.rawValue, group: value))
        }
        
    }
    
}



let placeholder = Project(name: "Membuktikan Pythagoras dengan Kerikil",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Kerikil",
                          subject: .Mathematic,
                          grade: .ten,
                          topic: .init(subject: .Mathematic, grade: .ten, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)

