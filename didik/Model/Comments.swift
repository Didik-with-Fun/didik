//
//  Comments.swift
//  didik
//
//  Created by Haddawi on 06/11/20.
//

import Foundation

struct Comments: Identifiable {
    let id = UUID()
    let comment: String
    let authorID: String
    let createdDate: Date
}
