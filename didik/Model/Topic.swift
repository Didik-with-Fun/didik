//
//  Topic.swift
//  didik
//
//  Created by Haddawi on 05/11/20.
//

import Foundation

struct Topic: Identifiable, Codable {
    var id = UUID()
    let subject: Subject
    let grade: Grades
    let name: String
    let coreCompetence: String  // stands for Kompetensi Inti
    let basicCompetence: [String] // stands for Kompentensi Dasar
}

let defaultTopic = Topic(subject: .allSubjects, grade: .allGrades, name: "Pilih Materi Pembelajaran", coreCompetence: "", basicCompetence: ["Akan terisi secara otomatis berdasarkan materi pembelajaran yang dipilih"])

let topicMath1 = Topic(subject: .Mathematic, grade: .eleven, name: "Induksi Matematika", coreCompetence: "", basicCompetence: ["Menjelaskan metode pembuktian pernyataan matematis berupa barisan, ketidaksamaan, keterbagiaan dengan induksi matematika", "Menggunakan metode pembuktian induksi matematika untuk menguji pernyataan matematis berupa barisan, ketidaksamaan, keterbagiaan"])

let topicMath2 = Topic(subject: .Mathematic, grade: .eleven, name: "Program Linear", coreCompetence: "", basicCompetence: ["Menjelaskan program linear dua variabel dan metode penyelesaiannya dengan menggunakan masalah kontekstual", "Menyelesaikan masalah kontekstual yang berkaitan dengan program linear dua variabel"])

let topicMath3 = Topic(subject: .Mathematic, grade: .eleven, name: "Matriks dan Operasi Matriks", coreCompetence: "", basicCompetence: ["Menjelaskan matriks dan kesamaan menggunakankontekstual operasi pada matriks yang meliputi penjumlahan, pengurangan, perkalian skalar, dan perkalian, serta transpose matriks dan dengan masalah melakukan", "Menyelesaikan masalah kontekstual yang berkaitan dengan matriks dan operasinya"])

let topicMath4 = Topic(subject: .Mathematic, grade: .eleven, name: "Determinan dan Invers Matriks", coreCompetence: "", basicCompetence: ["Menganalisis sifat-sifat determinan dan invers matriks berordo 2×2 dan 3×3", "Menyelesaikan masalah yang berkaitan dengan determinan dan invers matriks berordo 2×2 dan 3×3"])

let topicMath5 = Topic(subject: .Mathematic, grade: .eleven, name: "Transformasi Geometri dan Komposisi Matriks", coreCompetence: "", basicCompetence: ["Menganalisis dan membandingkan transformasi dan komposisi transformasi dengan menggunakan matriks", "Menyelesaikan masalah yang berkaitan dengan matriks transformasi geometri (translasi, refleksi, dilatasi dan rotasi)"])

let topicMath6 = Topic(subject: .Mathematic, grade: .eleven, name: "Limit Fungsi Aljabar", coreCompetence: "", basicCompetence: ["Menjelaskan limit fungsi aljabar (fungsi polinom dan fungsi rasional) secara intuitif dan sifat-sifatnya, serta menentukan eksistensinya", "Menyelesaikan masalah yang berkaitan dengan limit fungsi aljabar"])

let topicMath7 = Topic(subject: .Mathematic, grade: .eleven, name: "Turunan Fungsi Aljabar", coreCompetence: "", basicCompetence: ["Menjelaskan sifat-sifat turunan fungsi aljabar dan menentukan turunan fungsi aljabar menggunakan definisi atau sifat- sifat turunan fungsi", "Menyelesaikan masalah yang berkaitan dengan turunan fungsi aljabar"])

let topicMath8 = Topic(subject: .Mathematic, grade: .eleven, name: "Penerapan Turunan", coreCompetence: "", basicCompetence: ["Menganalisis keberkaitanan turunan pertama fungsi dengan nilai maksimum, nilai minimum, dan selang kemonotonan fungsi, serta kemiringan garis singgung kurva", "Menggunakan turunan pertama fungsi untuk menentukan titik maksimum, titik minimum, dan selang kemonotonan fungsi, serta kemiringan garis singgung kurva, persamaan garis singgung, dan garis normal kurva berkaitan dengan masalah kontekstual"])

let topicMath9 = Topic(subject: .Mathematic, grade: .eleven, name: "Integral Tak Tentu", coreCompetence: "", basicCompetence: ["Mendeskripsikan integral tak tentu (anti turunan) fungsi aljabar dan menganalisis sifat- sifatnya berdasarkan sifat-sifat turunan fungsi", "Menyelesaikan masalah yang berkaitan dengan integral tak tentu (anti turunan) fungsi aljabar"])

let topicMath10 = Topic(subject: .Mathematic, grade: .ten, name: "Eksponen dan Logaritma", coreCompetence: "", basicCompetence: ["Menerapkan konsep bilangan berpangkat, bentuk akardan logaritma dalam menyelesaikan masalah", "Menyajikan penyelesaian masalah bilangan berpangkat, bentuk akar dan logaritma"])

let topicMath11 = Topic(subject: .Mathematic, grade: .ten, name: "Persamaan dan Pertidaksamaan Linear", coreCompetence: "", basicCompetence: ["Menerapkan persamaan dan pertidaksamaan nilai mutlak bentuk linear satu variabe", "Menyajikan penyelesaian masalah yang berkaitan dengan persamaan dan pertidaksamaan nilai mutlak bentuk linear satu variabel"])

let topicMath12 = Topic(subject: .Mathematic, grade: .ten, name: "Sistem Persamaan dan Pertidaksamaan Linear", coreCompetence: "", basicCompetence: ["Menentukan nilai variabel pada sistem persamaan linear dua variabel dalam masalah kontekstual", "Menyelesaikan masalah sistem persamaan linier dua variabel"])

let topicMath13 = Topic(subject: .Mathematic, grade: .ten, name: "Barisan dan Deret Aritmetika", coreCompetence: "", basicCompetence: ["Menganalisis barisan dan deret aritmetika", "Menyelesaikan masalah kontekstual yang berkaitan dengan barisan dan deret aritmetika"])

let topicMath14 = Topic(subject: .Mathematic, grade: .ten, name: "Barisan dan Deret Geometri", coreCompetence: "", basicCompetence: ["Menganalisis barisan dan deret geometri", "Menyelesaikan masalah kontekstual yang berkaitan dengan barisan dan deret geometri"])

let topicMath15 = Topic(subject: .Mathematic, grade: .ten, name: "Trigonometri", coreCompetence: "", basicCompetence: ["Menerapkan nilai perbandingan trigonometri pada grafik fungsi trigonometri", "Menyajikan grafik fungsi trigonometri"])

let topicMath16 = Topic(subject: .Mathematic, grade: .ten, name: "Integral Tak Tentu", coreCompetence: "", basicCompetence: ["Mendeskripsikan integral tak tentu (anti turunan) fungsi aljabar dan menganalisis sifat- sifatnya berdasarkan sifat-sifat turunan fungsi", "Menyelesaikan masalah yang berkaitan dengan integral tak tentu (anti turunan) fungsi aljabar"])

let topicList = [
    defaultTopic,
    topicMath1,
    topicMath2,
    topicMath3,
    topicMath4,
    topicMath5,
    topicMath6,
    topicMath7,
    topicMath8,
    topicMath9,
    topicMath10,
    topicMath11,
    topicMath12,
    topicMath13,
    topicMath14,
    topicMath15,
    topicMath16
]