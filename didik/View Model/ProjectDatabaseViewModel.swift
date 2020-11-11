//
//  JelajahMateriViewModel.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 10/11/20.
//

import Foundation

struct ProjectsGroup: Identifiable {
    let id = UUID()
    let title: String
    let group: [Projects]
}

class ProjectDatabaseViewModel: ObservableObject {
    
    var allProjects: [Projects]
    @Published var filteredProjects: [Projects]
    var filteredSubjects: [Projects]
    var filteredGrades: [Projects]
    @Published var myProjects: [Projects]
    @Published var jelajahMateriGroup: [ProjectsGroup] = []
    
    
    @Published var myProjectsGroup: [ProjectsGroup] = []
    
    
    init() {
        // insert fetch projects from firebase here
        let requestProjects = ProjectDatabaseViewModel.createDummyProjects()
        
        self.allProjects = requestProjects
        self.filteredProjects = requestProjects
        self.filteredSubjects = requestProjects
        self.filteredGrades = requestProjects
        
        
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
        
        
        print("view model init")

    }
    
    
    func filterGrades(grade: Grades) {
        
        if grade == .allGrades {
            self.filteredProjects = self.filteredSubjects.filter { (Projects) -> Bool in
                return (Projects.grade == .ten) || (Projects.grade == .eleven) || (Projects.grade == .twelve)
            }
            
            return
            
        } else {
            self.filteredProjects = self.filteredSubjects.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            self.filteredGrades = self.allProjects.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            return
            
        }
        
    }
    
    func filterSubjects(subject: Subjects) {
        
        if subject == .allSubjects {
            self.filteredProjects = self.filteredGrades.filter { (Projects) -> Bool in
                return (Projects.subject == .Mathematic) ||
                    (Projects.subject == .Physic) ||
                    (Projects.subject == .Chemist) ||
                    (Projects.subject == .Biology) ||
                    (Projects.subject == .Sociology) ||
                    (Projects.subject == .History) ||
                    (Projects.subject == .Economy) ||
                    (Projects.subject == .Geography) ||
                    (Projects.subject == .BahasaIndonesia) ||
                    (Projects.subject == .English)
            }
            return
            
        } else {
            self.filteredProjects = self.filteredGrades.filter { (Projects) -> Bool in
                return Projects.subject == subject
            }
            
            self.filteredSubjects = self.allProjects.filter { (Projects) -> Bool in
                return Projects.subject == subject
            }
            return
            
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
    

    
    
}


//MARK: - Generate Dummy Model

extension ProjectDatabaseViewModel {
    
    static func createDummyProjects() -> [Projects] {
        let p1 = Projects(name: "Membuktikan Pythagoras dengan Kerikil",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Kerikil",
                          subject: .Mathematic,
                          grade: .ten,
                          topic: .init(subject: .Mathematic, grade: .ten, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p2 = Projects(name: "Membuktikan Pythagoras dengan Tusuk Sate",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate",
                          subject: .Mathematic,
                          grade: .eleven,
                          topic: .init(subject: .Mathematic, grade: .eleven, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p3 = Projects(name: "Membuktikan Integral dengan Tusuk Sate",
                          summary: "Siswa akan Membuktikan Integral dengan Tusuk Sate",
                          subject: .Mathematic,
                          grade: .eleven,
                          topic: .init(subject: .Mathematic, grade: .eleven, name: "Kalkulus", coreCompetence: "Memahami kalkulus", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicDarkBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p4 = Projects(name: "Membuat Roket botol air",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate",
                          subject: .Physic,
                          grade: .eleven,
                          topic: .init(subject: .Physic, grade: .eleven, name: "Tekanan", coreCompetence: "Memahami tekanan", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p5 = Projects(name: "Membuat sabun",
                          summary: "Siswa akan Membuat sabun dengan minyak",
                          subject: .Chemist,
                          grade: .twelve,
                          topic: .init(subject: .Chemist, grade: .twelve, name: "Minyak", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicOrange"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p6 = Projects(name: "Membuat Tabung kapiler",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .twelve,
                          topic: .init(subject: .Physic, grade: .twelve, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p7 = Projects(name: "Membuat Tabung kapiler",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .twelve,
                          topic: .init(subject: .Physic, grade: .twelve, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p8 = Projects(name: "Membuat Rail Gun",
                          summary: "Siswa akan Membuat rail gun",
                          subject: .Physic,
                          grade: .ten,
                          topic: .init(subject: .Physic, grade: .ten, name: "Magnet", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicLightBrown"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        return [p1, p2, p3, p4, p5, p6, p7, p8]
    }
}


let placeholder = Projects(name: "Membuktikan Pythagoras dengan Kerikil",
                  summary: "Siswa akan Membuktikan Pythagoras dengan Kerikil",
                  subject: .Mathematic,
                  grade: .ten,
                  topic: .init(subject: .Mathematic, grade: .ten, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                  goal: ["Paham caranya", "Bisa ngitungnya"],
                  images: ["MathematicBlue"],
                  projectStatus: .Published,
                  projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                  notes: "Oke aja",
                  comments: [Comments.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                  likes: 230,
                  createdDate: 01.1,
                  updatedDate: 232.2)

