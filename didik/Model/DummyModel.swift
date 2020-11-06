//
//  DummyModel.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 04/11/20.
//

import Foundation
import SwiftUI

enum Kelas: String, CaseIterable {
    case Kelas = "Semua Kelas"
    case X, XI, XII
}

enum Matpel: String, CaseIterable {
    case MatPel = "Semua MatPel"
    case Matematika, Fisika, Kimia
}

enum Subjek: String, CaseIterable {
    case Linear = "Persamaan Linear"
    case Trigonometri = "Trigonometri"
    case Magnet = "Magnet"
    case PesawatSederhana = "Pesawat Sederhana"
    case Kuadratik = "Persamaan Kuadratik"
}


struct DummyMateri: Identifiable {
    let id = UUID()
    
    let imageName: String
    
    let likes: Int
    let duration: Int
    let title: String
    let author: String
    let kelas: Kelas
    let matpel: Matpel
    let subjek: Subjek
}

struct DummyMateriGroup: Identifiable {
    let id = UUID()
    let title: String
    let dummyMateri: [DummyMateri]
}

let placeholderMateri = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Linear I", author: "Pak Kirjo", kelas: .X, matpel: .Matematika, subjek: .Linear)

let placeholderMateri2 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Trigonometri", author: "Pak Kirjo", kelas: .XI, matpel: .Matematika, subjek: .Trigonometri)

let placeholderMateri3 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Kuadratik I", author: "Pak Kirjo", kelas: .XII, matpel: .Matematika, subjek: .Kuadratik)

let placeholderMateri4 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Magnet I", author: "Pak Kirjo", kelas: .X, matpel: .Fisika, subjek: .Magnet)

let placeholderMateri5 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Bidang Miring I", author: "Pak Kirjo", kelas: .XI, matpel: .Fisika, subjek: .PesawatSederhana)

let placeholderMateri6 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Bidang Miring II", author: "Pak Kirjo", kelas: .XII, matpel: .Fisika, subjek: .PesawatSederhana)

let placeholderMateri7 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Trigonometri II", author: "Pak Kirjo", kelas: .XII, matpel: .Matematika, subjek: .Trigonometri)


let LibraryMateri: [DummyMateri] = [
    placeholderMateri,
    placeholderMateri2,
    placeholderMateri3,
    placeholderMateri4,
    placeholderMateri5,
    placeholderMateri6,
    placeholderMateri7
    
]

let dummyMateriGroup = [
    DummyMateriGroup(title: "Trigonometri", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Magnet", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Biologi", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Pesawat Sederhana", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Trigonometri", dummyMateri: LibraryMateri)
]


class DummyModel: ObservableObject {
    @Published var filteredMateri: [DummyMateri] = LibraryMateri
    
    let allMateri: [DummyMateri] = LibraryMateri
    var filteredKelas: [DummyMateri] = LibraryMateri
    var filteredMatpel: [DummyMateri] = LibraryMateri
    
    @Published var materiGroup: [DummyMateriGroup] = []
    
    init() {
        print("init dummyModel")
        for i in Subjek.allCases {
            materiGroup.append(.init(title: i.rawValue, dummyMateri: filterSubjek(subjek: i)))
        }
        
        
    }
    
    
    func filterKelas(kelas: Kelas) {
        
        if kelas == .Kelas {
            self.filteredMateri = self.filteredMatpel.filter { (isi) -> Bool in
                return (isi.kelas == .X) || (isi.kelas == .XI) || (isi.kelas == .XII)
            }
            
            return
            
        } else {
            self.filteredMateri = self.filteredMatpel.filter { (isi) -> Bool in
                return isi.kelas == kelas
            }
            
            self.filteredKelas = self.allMateri.filter { (isi) -> Bool in
                return isi.kelas == kelas
            }
            
            return
            
        }
        
    }
    
    func filterMatpel(matpel: Matpel) {
        
        if matpel == .MatPel {
            self.filteredMateri = self.filteredKelas.filter { (isi) -> Bool in
                return (isi.matpel == .Matematika) || (isi.matpel == .Fisika) || (isi.matpel == .Kimia)
            }
            return
            
        } else {
            self.filteredMateri = self.filteredKelas.filter { (isi) -> Bool in
                return isi.matpel == matpel
            }
            
            self.filteredMatpel = self.allMateri.filter { (isi) -> Bool in
                return isi.matpel == matpel
            }
            return
            
        }
        
    }
    
    
    func filterSubjek(subjek : Subjek) -> [DummyMateri] {
        return self.filteredMateri.filter { (isi) -> Bool in
            return isi.subjek == subjek
        }
    }
    
    func updateMateriGroup() {
        self.materiGroup = []
        
        for i in Subjek.allCases {
            if filterSubjek(subjek: i).isEmpty == false {
                materiGroup.append(.init(title: i.rawValue, dummyMateri: filterSubjek(subjek: i)))
            }
        }
    }
    
    
    
    
}
