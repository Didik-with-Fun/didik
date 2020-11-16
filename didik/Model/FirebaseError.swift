//
//  FirebaseError.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 13/11/20.
//

import Foundation

enum FirebaseError: Error {
    case error(NSError)
    case noData
    case badHTTPResponse
}
