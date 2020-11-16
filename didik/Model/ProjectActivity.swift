//
//  ProjectActivity.swift
//  didik
//
//  Created by Haddawi on 06/11/20.
//

import Foundation

struct ProjectActivity: Hashable, Codable {
    let name: String
    let description: String
    let time: Int // time refer to range, not date time
}
