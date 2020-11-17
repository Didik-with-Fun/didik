//
//  DateUtil.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/11/20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct DateUtil {
    static func convertDoubleToDate(date: Double) -> String {
        let date = Date(timeIntervalSince1970: date)
         let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.timeZone = .current
         let localDate = dateFormatter.string(from: date)
        
        return localDate
    }
    
    static func convertTimestampToDate(timestamp: Timestamp) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp.seconds))
        
        
         let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.timeZone = .current
         let localDate = dateFormatter.string(from: date)
        
        return localDate
    }
}
