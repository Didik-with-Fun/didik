//
//  JelajahMateriViewModel.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 10/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class ProjectDatabaseViewModel: ObservableObject {
    
    // all projects from firebase
    var allProjects: [Project] = []
    
    // variabel to filter projects from jelajah materi view
    @Published var filteredProjects: [Project] = []

    @Published var jelajahMateriGroup: [ProjectsGroup] = []
    var referenceJelajahMateriGroup: [ProjectsGroup] = []
    
    
    var myAllProjects: [Project] = []
    @Published var myProjects: [Project] = []

    @Published var myProjectsGroup: [ProjectsGroup] = []
    var referenceMyProjectsGroup: [ProjectsGroup] = []
    
    
    var specificProjects: [Project] = []
    @Published var filteredSpecificProjects: [Project] = []
    
    let service = FirebaseRequestService()
//MARK: - init
    
    init() {
        
        // request all projects
        FirebaseRequestService.requestAllProject { (result) in
            switch result {
            case .success(let requestProjects):
                // initialize jelajah materi project database
                self.allProjects = requestProjects
                self.filteredProjects = requestProjects

                
                

                
                let temp = Dictionary(grouping: self.filteredProjects) { (project) -> String in
                    return project.topic.name
                }
                for (key, value) in temp {
                    self.jelajahMateriGroup.append(ProjectsGroup(title: key, unfilteredGroup: value, group: value))
                    self.referenceJelajahMateriGroup.append(ProjectsGroup(title: key, unfilteredGroup: value, group: value))
                }
                
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // request my projects
        FirebaseRequestService.requestMyProject { (result) in
            switch result {
            case .success(let requestProjects):
                // initialize my materi project database
                self.myAllProjects = requestProjects
                self.myProjects = requestProjects
                
                let myTemp = Dictionary(grouping: self.myProjects) { (project) -> ProjectStatus in
                    return project.projectStatus
                }
                for (key, value) in myTemp {
                    self.myProjectsGroup.append(ProjectsGroup(title: key.rawValue, unfilteredGroup: value, group: value))
                    self.referenceMyProjectsGroup.append(ProjectsGroup(title: key.rawValue, unfilteredGroup: value, group: value))
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
//MARK: - Filter Function
    
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
    

}



//MARK: - Extension for ViewType Jelajah

extension ProjectDatabaseViewModel {

    
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
    
    
    
    
    func updateProjectsGroup() {
        var updateGroup: [ProjectsGroup] = []
        
        let temp = Dictionary(grouping: filteredProjects) { (project) -> String in
            return project.topic.name
        }
        
        for (key, value) in temp {
            for i in referenceJelajahMateriGroup {
                if i.title == key {
                    updateGroup.append(ProjectsGroup(title: key, unfilteredGroup: i.unfilteredGroup, group: value))
                }
                print(i.title)
            }
        }

        
        self.jelajahMateriGroup = updateGroup
        
    }
    
    
}




//MARK: - Extension for ViewType myMateri

extension ProjectDatabaseViewModel {
    
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
    
    

    func updateMyProjectsGroup() {
        var updateGroup: [ProjectsGroup] = []
        
        let temp = Dictionary(grouping: myProjects) { (project) -> ProjectStatus in
            return project.projectStatus
        }
        
        for (key, value) in temp {
            for i in referenceMyProjectsGroup {
                if i.title == key.rawValue {
                    updateGroup.append(ProjectsGroup(title: key.rawValue, unfilteredGroup: i.unfilteredGroup, group: value))
                }
                print(i.title)
            }
        }
        
        self.myProjectsGroup = updateGroup
        
    }
    
}


//MARK: - Extension for View Type Lihat Semua


extension ProjectDatabaseViewModel {
    
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
