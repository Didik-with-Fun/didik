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
    let group: [Project]
}

class ProjectDatabaseViewModel: ObservableObject {
    
    var allProjects: [Project]
    @Published var filteredProjects: [Project]
    var filteredBySubjectsProjects: [Project]
    var filteredByGradesProjects: [Project]
    @Published var myProjects: [Project]
    @Published var jelajahMateriGroup: [ProjectsGroup] = []
    
    
    @Published var myProjectsGroup: [ProjectsGroup] = []
    
    
    init() {
        // insert fetch projects from firebase here
        let requestProjects = ProjectDatabaseViewModel.createDummyProjects()
        
        self.allProjects = requestProjects
        self.filteredProjects = requestProjects
        self.filteredBySubjectsProjects = requestProjects
        self.filteredByGradesProjects = requestProjects
        
        
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
    
    
    func filterByGrades(grade: Grade) {
        
        if grade == .allGrades {
            self.filteredProjects = self.filteredBySubjectsProjects.filter { (Projects) -> Bool in
                return (Projects.grade == .ten) || (Projects.grade == .eleven) || (Projects.grade == .twelve)
            }
            
            return
            
        } else {
            self.filteredProjects = self.filteredBySubjectsProjects.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            self.filteredByGradesProjects = self.allProjects.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            return
            
        }
        
    }
    
    func filterBySubjects(subject: Subject) {
        
        if subject == .allSubjects {
            self.filteredProjects = self.filteredByGradesProjects.filter { (projects) -> Bool in
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
            self.filteredProjects = self.filteredByGradesProjects.filter { (projects) -> Bool in
                return projects.subject == subject
            }
            
            self.filteredBySubjectsProjects = self.allProjects.filter { (projects) -> Bool in
                return projects.subject == subject
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
    
    static func createDummyProjects() -> [Project] {
        let p1 = Project(name: "Membuktikan Pythagoras dengan Kerikil",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Kerikil",
                          subject: .Mathematic,
                          grade: .ten,
                          topic: .init(subject: .Mathematic, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 1415637900,
                          updatedDate: 232.2)
        
        let p2 = Project(name: "Membuktikan Pythagoras dengan Tusuk Sate",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate",
                          subject: .Mathematic,
                          grade: .eleven,
                          topic: .init(subject: .Mathematic, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p3 = Project(name: "Membuktikan Integral dengan Tusuk Sate",
                          summary: "Siswa akan Membuktikan Integral dengan Tusuk Sate",
                          subject: .Mathematic,
                          grade: .eleven,
                          topic: .init(subject: .Mathematic, name: "Kalkulus", coreCompetence: "Memahami kalkulus", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicDarkBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p4 = Project(name: "Membuat Roket botol air",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate",
                          subject: .Physic,
                          grade: .eleven,
                          topic: .init(subject: .Physic, name: "Tekanan", coreCompetence: "Memahami tekanan", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p5 = Project(name: "Membuat sabun",
                          summary: "Siswa akan Membuat sabun dengan minyak",
                          subject: .Chemist,
                          grade: .twelve,
                          topic: .init(subject: .Chemist, name: "Minyak", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicOrange"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p6 = Project(name: "Membuat Tabung kapiler",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .twelve,
                          topic: .init(subject: .Physic, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p7 = Project(name: "Membuat Tabung kapiler",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .twelve,
                          topic: .init(subject: .Physic, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p8 = Project(name: "Membuat Rail Gun",
                          summary: "Siswa akan Membuat rail gun",
                          subject: .Physic,
                          grade: .ten,
                          topic: .init(subject: .Physic, name: "Magnet", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                          goal: ["Paham caranya", "Bisa ngitungnya"],
                          images: ["MathematicLightBrown"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                          notes: "Oke aja",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        return [p1, p2, p3, p4, p5, p6, p7, p8]
    }
}


let placeholder = Project(name: "Membuktikan Pythagoras dengan Kerikil",
                  summary: "Siswa akan Membuktikan Pythagoras dengan Kerikil",
                  subject: .Mathematic,
                  grade: .ten,
                  topic: .init(subject: .Mathematic, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: "Bisa menggunakan phytagoras"),
                  goal: ["Paham caranya", "Bisa ngitungnya"],
                  images: ["MathematicBlue"],
                  projectStatus: .Published,
                  projectActivities: [ProjectActivity.init(name: "Menghitung", description: "Itung", time: 1)],
                  notes: "Oke aja",
                  comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                  likes: 230,
                  createdDate: 01.1,
                  updatedDate: 232.2)

