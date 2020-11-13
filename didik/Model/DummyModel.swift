////
////  DummyModel.swift
////  didik
////
////  Created by Fandrian Rhamadiansyah on 04/11/20.
////
//
import Foundation



//MARK: - Generate Dummy Model

extension FirebaseRequestService {

    
    static func createDummyProjects() -> [Project] {
        let p1 = Project(name: "Membuktikan Pythagoras dengan Kerikil sebesar kelereng",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Kerikil",
                          subject: .Mathematic,
                          grade: .twelve,
                          topic: .init(subject: .Mathematic, grade: .twelve, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicBlue"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
                          likes: 230,
                          createdDate: 1415637900,
                          updatedDate: 232.2)
        
        let p2 = Project(name: "Membuktikan Pythagoras dengan Tusuk Sate dan daging kambing dimasak hemmmm enak sekaliii",
                          summary: "Siswa akan Membuktikan Pythagoras dengan Tusuk Sate dan daging kambing dimasak hemmmm enak sekaliii",
                          subject: .Mathematic,
                          grade: .ten,
                          topic: .init(subject: .Mathematic, grade: .ten, name: "Trigonometri", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
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
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
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
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
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
                          projectStatus: .Draft,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
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
                          projectStatus: .Draft,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        let p7 = Project(name: "Membuat Tabung Hisap",
                          summary: "Siswa akan Membuat tabung kapiler",
                          subject: .Physic,
                          grade: .eleven,
                          topic: .init(subject: .Physic, grade: .eleven, name: "Tekanan", coreCompetence: "Memahami trigonometri", basicCompetence: ["Bisa menggunakan phytagoras"]),
                          goal: "Setelah Anda mempelajari bahan belajar ini diharapkan Anda mampu:  1.    Menjelaskan pengertian SPLTV  2.    Menjelaskan bentuk umum SPLTV  3.    Menentukan Himpunan Penyelesaian (HP) SPLTV  4.    Menyelesaikan masalah nyata yang berkaitan dengan SPLTV",
                          images: ["MathematicGreen"],
                          projectStatus: .Published,
                          projectActivities: [ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1),
                                              ProjectActivity.init(name: "Mengintepretasi persamaan dan pertidaksamaan nilai", description: "Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", time: 1)],
                          notes: "Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba",
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
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
                          comments: [Comment.init(comment: "bego lu", authorID: "Mine", createdDate: Date())],
                          likes: 230,
                          createdDate: 01.1,
                          updatedDate: 232.2)
        
        
        return [p1, p2, p3, p4, p5, p6, p7, p8]
    }
}


//MARK: - Generate Dummy Placeholder



let placeholder = Project(name: "Membuktikan Pythagoras dengan Kerikil sebesar kelereng",
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


let placeholderGroup = ProjectsGroup(title: "title", unfilteredGroup: [placeholder], group: [placeholder])

