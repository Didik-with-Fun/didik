//
//  ProjectsGroup.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 13/11/20.
//

import Foundation

struct ProjectsGroup: Identifiable {
    let id = UUID()
    let title: String
    let unfilteredGroup: [Project]
    var group: [Project]
}

