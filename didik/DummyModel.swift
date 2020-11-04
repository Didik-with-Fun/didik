//
//  DummyModel.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 04/11/20.
//

import Foundation

struct DummyMateri : Identifiable {
    let id = UUID()
    
    let imageName : String
    
    let likes : Int
    let duration : Int
    let title : String
    let author : String
}

let placeholderMateri = DummyMateri.init(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Linear", author: "Pak Kirjo")
let placeholderMateri2 = DummyMateri.init(imageName: "photo", likes: 214, duration: 5, title: "Trigonometri", author: "Pak Kirjo")
let placeholderMateri3 = DummyMateri.init(imageName: "photo", likes: 214, duration: 5, title: "Persamaan Kuadratik", author: "Pak Kirjo")


let LibraryMateri : [DummyMateri] = [
    placeholderMateri,
    placeholderMateri2,
    placeholderMateri3,
//    placeholderMateri,
//    placeholderMateri2,
    placeholderMateri3
]
