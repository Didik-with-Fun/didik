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

class ProjectDatabaseViewModel: ObservableObject {
    
    // all projects from firebase
    var allProjects: [Project] = []
    
    // variabel to filter projects from jelajah materi view
    @Published var filteredProjects: [Project] = []
    var filteredProjectsBySubject: [Project] = []
    var filteredProjectsByGrade: [Project] = []
    @Published var jelajahMateriGroup: [ProjectsGroup] = []
    
    
    var myAllProjects : [Project] = []
    @Published var myProjects: [Project] = []
    var myProjectsBySubject: [Project] = []
    var myProjectsByGrade: [Project] = []
    
    
    @Published var myProjectsGroup: [ProjectsGroup] = []
    
    
    init() {
        print("view model init delay")
        FirebaseRequest.requestAllProject { (result) in
            switch result {
            case .success(let requestProjects):
                print("data fetched")
                // initialize jelajah materi project database
                self.allProjects = requestProjects
                self.filteredProjects = requestProjects
                self.filteredProjectsBySubject = requestProjects
                self.filteredProjectsByGrade = requestProjects
                
                // initialize my materi project database
                self.myAllProjects = requestProjects
                self.myProjects = requestProjects
                self.myProjectsBySubject = requestProjects
                self.myProjectsByGrade = requestProjects
                
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
    
    func filter(grade: Grades, subject: Subject) {
        
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
    }
    
    
//    func filterByGrades(grade: Grades) {
//
//        if grade == .allGrades {
//            self.filteredProjects = self.filteredProjectsBySubject.filter { (Projects) -> Bool in
//                return (Projects.grade == .ten) || (Projects.grade == .eleven) || (Projects.grade == .twelve)
//            }
//
//            return
//
//        } else {
//            self.filteredProjects = self.filteredProjectsBySubject.filter { (Projects) -> Bool in
//                return Projects.grade == grade
//            }
//
//            self.filteredProjectsByGrade = self.allProjects.filter { (Projects) -> Bool in
//                return Projects.grade == grade
//            }
//
//            return
//
//        }
//
//    }
//
//    func filterBySubjects(subject: Subject) {
//
//        if subject == .allSubjects {
//            self.filteredProjects = self.filteredProjectsByGrade.filter { (projects) -> Bool in
//                return (projects.subject == .Mathematic) ||
//                    (projects.subject == .Physic) ||
//                    (projects.subject == .Chemist) ||
//                    (projects.subject == .Biology) ||
//                    (projects.subject == .Sociology) ||
//                    (projects.subject == .History) ||
//                    (projects.subject == .Economy) ||
//                    (projects.subject == .Geography) ||
//                    (projects.subject == .BahasaIndonesia) ||
//                    (projects.subject == .English)
//            }
//            return
//
//        } else {
//            self.filteredProjects = self.filteredProjectsByGrade.filter { (projects) -> Bool in
//                return projects.subject == subject
//            }
//
//            self.filteredProjectsBySubject = self.allProjects.filter { (projects) -> Bool in
//                return projects.subject == subject
//            }
//            return
//
//        }
//
//    }
//
    
    func updateProjectsGroup() {
        self.jelajahMateriGroup = []
        
        let temp = Dictionary(grouping: filteredProjects) { (project) -> String in
            return project.topic.name
        }
        for (key, value) in temp {
            self.jelajahMateriGroup.append(ProjectsGroup(title: key, group: value))
        }
        
    }
    
    
    
    
}

//MARK: - My project extension
extension ProjectDatabaseViewModel {
    
    func myProjectsByGrades(grade: Grades) {
        
        if grade == .allGrades {
            self.myProjects = self.myProjectsBySubject.filter { (Projects) -> Bool in
                return (Projects.grade == .ten) || (Projects.grade == .eleven) || (Projects.grade == .twelve)
            }
            
            return
            
        } else {
            self.myProjects = self.myProjectsBySubject.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            self.myProjectsByGrade = self.myAllProjects.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            return
            
        }
        
    }
    
    func myProjectsBySubjects(subject: Subject) {
        
        if subject == .allSubjects {
            self.filteredProjects = self.filteredProjectsByGrade.filter { (projects) -> Bool in
                return (projects.subject == .Mathematic) ||
                    (projects.subject == .Physic) ||
                    (projects.subject == .Chemist) ||
                    (projects.subject == .Biology) ||
                    (projects.subject == .Sociology) ||
                    (projects.subject == .History) ||
                    (projects.subject == .Economy) ||
                    (projects.subject == .Geography) ||
                    (projects.subject == .BahasaIndonesia) ||
                    (projects.subject == .English)
            }
            return
            
        } else {
            self.filteredProjects = self.filteredProjectsByGrade.filter { (projects) -> Bool in
                return projects.subject == subject
            }
            
            self.filteredProjectsBySubject = self.allProjects.filter { (projects) -> Bool in
                return projects.subject == subject
            }
            return
            
        }
        
    }
    
    
    func updateMyProjectsGroup() {
        self.jelajahMateriGroup = []
        
        let temp = Dictionary(grouping: filteredProjects) { (project) -> String in
            return project.topic.name
        }
        for (key, value) in temp {
            self.jelajahMateriGroup.append(ProjectsGroup(title: key, group: value))
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

