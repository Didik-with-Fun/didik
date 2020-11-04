//
//  DummyModel.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 04/11/20.
//

import Foundation
import SwiftUI

enum Kelas : String {
    case X, XI, XII
}

enum Matpel : String {
    case Matematika, Fisika, Kimia
}

enum Subjek : String {
    case Linear = "Persamaan Linear"
    case Trigonometri = "Trigonometri"
    case Magnet = "Magnet"
    case Kuadratik = "Persamaan Kuadratik"
}


struct DummyMateri : Identifiable {
    let id = UUID()
    
    let imageName : String
    
    let likes : Int
    let duration : Int
    let title : String
    let author : String
    let kelas : Kelas
    let matpel : Matpel
    let subjek : Subjek
}

struct DummyMateriGroup: Identifiable {
    let id = UUID()
    let title : String
    let dummyMateri : [DummyMateri]
}

let placeholderMateri = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Linear I", author: "Pak Kirjo", kelas: .X, matpel: .Matematika, subjek: .Linear)

let placeholderMateri2 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Trigonometri", author: "Pak Kirjo", kelas: .XI, matpel: .Matematika, subjek: .Trigonometri)

let placeholderMateri3 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Kuadratik I", author: "Pak Kirjo", kelas: .XII, matpel: .Matematika, subjek: .Kuadratik)

let placeholderMateri4 = DummyMateri(imageName: "photo", likes: 214, duration: 5, title: "Magnet I", author: "Pak Kirjo", kelas: .X, matpel: .Fisika, subjek: .Magnet)


let LibraryMateri : [DummyMateri] = [
    placeholderMateri,
    placeholderMateri2,
    placeholderMateri3,
    placeholderMateri4,
    placeholderMateri,
    placeholderMateri3
]

let dummyMateriGroup = [
    DummyMateriGroup(title: "Trigonometri", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Magnet", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Biologi", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Pesawat Sederhana", dummyMateri: LibraryMateri),
    DummyMateriGroup(title: "Trigonometri", dummyMateri: LibraryMateri)
]


class DummyModel : ObservableObject {
    @Published var AllMateri : [DummyMateri] = LibraryMateri
    
    
}
