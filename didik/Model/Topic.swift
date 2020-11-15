//
//  Topic.swift
//  didik
//
//  Created by Haddawi on 05/11/20.
//

import Foundation

struct Topic: Identifiable, Codable {
    let id = UUID()
    let subject: Subject
    let grade: Grades
    let name: String
    let coreCompetence: String  // stands for Kompetensi Inti
    let basicCompetence: [String] // stands for Kompentensi Dasar
}

let defaultTopic = Topic(subject: .allSubjects, grade: .allGrades, name: "Pilih Materi Pembelajaran", coreCompetence: "", basicCompetence: ["Akan terisi secara otomatis berdasarkan materi yang dipilih"])

let topicMath1 = Topic(subject: .Mathematic, grade: .ten, name: "Pertidaksamaan Linear", coreCompetence: "", basicCompetence: ["Mengintepretasi persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel dengan persamaan dan pertidaksamaan linear Aljabar lainnya.", "Menyelesaikan masalah yang berkaitan dengan persamaan dan pertidaksamaan nilai mutlak dari bentuk linear satu variabel."])

let topicMath2 = Topic(subject: .Mathematic, grade: .ten, name: "Sistem Persamaan Linear", coreCompetence: "", basicCompetence: ["Menjelaskan dan menentukan penyelesaian pertidaksamaan rasional dan irasional satu variabel.", "Menjelaskan dan menentukan penyelesaian pertidaksamaan rasional dan irasional satu variabel."])

let topicMath3 = Topic(subject: .Mathematic, grade: .ten, name: "Persamaan Garis Lurus", coreCompetence: "", basicCompetence: ["Menyusun sistem persamaan linear tiga variabel dari masalah kontekstual.", "Menyelesaikan masalah kontekstual yang berkaitan dengan sistem persamaan linear tiga variabel."])

let topicMath4 = Topic(subject: .Mathematic, grade: .ten, name: "Persamaan Kuadrat", coreCompetence: "", basicCompetence: ["Menjelaskan dan menentukan penyelesaian sistem pertidaksamaan dua variabel (linear-kuadrat dan kuadrat-kuadrat).", "Menyajikan dan menyelesaikan masalah yang berkaitan dengan sistem pertidaksamaan dua variabel (linear-kuadrat dan kuadrat-kuadrat)."])

let topicMath5 = Topic(subject: .Mathematic, grade: .ten, name: "Fungsi Kuadrat", coreCompetence: "", basicCompetence: ["Menjelaskan dan menentukan fungsi (terutama fungsi linear, fungsi kuadrat, dan fungsi rasional) secara formal yang meliputi notasi, daerah asal, daerah hasil, dan ekspresi simbolik, serta sketsa grafiknya.", "Menganalisa karakteristik masing-masing grafik (titik potong dengan sumbu, titik puncak, asimtot) dan perubahan grafik fungsinya akibat transformasi  dsb."])

let topicList = [defaultTopic, topicMath1, topicMath2, topicMath3, topicMath4, topicMath5]
