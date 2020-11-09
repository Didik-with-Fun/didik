//
//  Topics.swift
//  didik
//
//  Created by Haddawi on 05/11/20.
//

import Foundation

struct Topic: Identifiable {
    let id = UUID()
    let subject: Subjects
    let name: String
    let KI: String
    let KD: String
}
