//
//  Project.swift
//  didik
//
//  Created by Haddawi on 06/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Project: Identifiable {
    let id = UUID()
    let name: String
    let summary: String
    let subject: Subject //String
    let grade: Grade
    let topic: Topic
    let goal: [String]
    let images: [String]
    let projectStatus: ProjectStatus
    let projectActivities: [ProjectActivity]
    let notes: String
    let comments: [Comment]
    let likes: Int
    let createdDate: Double
    let updatedDate: Double

}
