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
    
    // all projects from firebase
    let allProjects: [Project]
    
    // variabel to filter projects from jelajah materi view
    @Published var filteredProjects: [Project]
    var filteredProjectsBySubject: [Project]
    var filteredProjectsByGrade: [Project]
    @Published var jelajahMateriGroup: [ProjectsGroup] = []
    
    
    let myAllProjects : [Project]
    @Published var myProjects: [Project]
    var myProjectsBySubject: [Project]
    var myProjectsByGrade: [Project]
    
    
    @Published var myProjectsGroup: [ProjectsGroup] = []
    
    
    init() {
        // insert fetch projects from firebase here
        let requestProjects = ProjectDatabaseViewModel.createDummyProjects()
        
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
        
        
        print("view model init")

    }
    
    
    func filterByGrades(grade: Grades) {
        
        if grade == .allGrades {
            self.filteredProjects = self.filteredProjectsBySubject.filter { (Projects) -> Bool in
                return (Projects.grade == .ten) || (Projects.grade == .eleven) || (Projects.grade == .twelve)
            }
            
            return
            
        } else {
            self.filteredProjects = self.filteredProjectsBySubject.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            self.filteredProjectsByGrade = self.allProjects.filter { (Projects) -> Bool in
                return Projects.grade == grade
            }
            
            return
            
        }
        
    }
    
    func filterBySubjects(subject: Subject) {
        
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


//MARK: - Generate Dummy Model

extension ProjectDatabaseViewModel {
    
    static func createDummyProjects() -> [Project] {
        let p1 = Project(name: "Membuktikan Pythagoras dengan Kerikil",
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
                          createdDate: 1415637900,
                          updatedDate: 232.2)
        
        let p2 = Project(name: "Membuktikan Pythagoras dengan Tusuk Sate dan daging kambing dimasak hemmmm enak sekaliii",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate dan daging kambing dimasak hemmmm enak sekaliii",
                          subject: .Mathematic,
                          grade: .eleven,
                          topic: .init(subject: .Mathematic, grade: .eleven, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 2),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 2)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p3 = Project(name: "Membuktikan Integral dengan Tusuk Sate",
                          summary: "Siswa akan Membuktikan Integral dengan Tusuk Sate",
                          subject: .Mathematic,
                          grade: .eleven,
                          topic: .init(subject: .Mathematic, grade: .eleven, name: "Kalkulus", coreCompetence: "Memahami kalkulus", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicDarkBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p4 = Project(name: "Membuat Roket botol air",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate",
                          subject: .Physic,
                          grade: .eleven,
                          topic: .init(subject: .Physic, grade: .eleven, name: "Tekanan", coreCompetence: "Memahami tekanan", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p5 = Project(name: "Membuat sabun",
                          summary: "Siswa akan Membuat sabun dengan minyak",
                          subject: .Chemist,
                          grade: .twelve,
                          topic: .init(subject: .Chemist, grade: .twelve, name: "Minyak", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicOrange"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p6 = Project(name: "Membuat Tabung kapiler",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .twelve,
                          topic: .init(subject: .Physic, grade: .twelve, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p7 = Project(name: "Membuat Tabung kapiler",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .twelve,
                          topic: .init(subject: .Physic, grade: .twelve, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Atun", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p8 = Project(name: "Membuat Rail Gun",
                          summary: "Siswa akan Membuat rail gun",
                          subject: .Physic,
                          grade: .ten,
                          topic: .init(subject: .Physic, grade: .ten, name: "Magnet", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicLightBrown"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
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

