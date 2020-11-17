//
//  ProjectActivity.swift
//  didik
//
//  Created by Haddawi on 06/11/20.
//

import Foundation

struct ProjectActivity: Hashable, Codable {
    var name: String
    var description: String
    var time: Int // time refer to range, not date time
}
