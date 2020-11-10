//
//  Projects.swift
//  didik
//
//  Created by Haddawi on 06/11/20.
//

import Foundation

struct Projects: Identifiable {
    let id = UUID()
    let name: String
    let summary: String
    let subject: String
    let grade: Grades
    let topic: Topic
    let goal: [String]
    let images: [String]
    let projectStatus: ProjectStatus
    let projectActivities: [ProjectActivity]
    let notes: String
    let comments: [Comments]
    let likes: Int
    let createdDate: Double
    let updatedDate: Double
}
