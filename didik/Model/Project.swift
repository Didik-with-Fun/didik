//
//  Project.swift
//  didik
//
//  Created by Haddawi on 06/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Project: Identifiable, Codable {
    @DocumentID var id: String?
    var projectId = UUID()
    let name: String
    let summary: String
    let subject: Subject //String
    let grade: Grades
    let topic: Topic
    let goal: String
    let images: [String]
    let projectStatus: ProjectStatus
    let projectActivities: [ProjectActivity]
    let notes: String
    let comments: [Comment]
    let likes: Int
    let authorUID: String
    let authorName: String
    @ServerTimestamp var createdDate: Timestamp?
    @ServerTimestamp var updatedDate: Timestamp?
    
    
    func getTotalActivitiesDays() -> Int {
        self.projectActivities.map { $0.time }.reduce(0, +)
    }
}
