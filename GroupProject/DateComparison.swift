//
//  StringToDate.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/18/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation


class DateComparison {
    
 
    static func produceDates(start: String, end: String) -> (Date?, Date?){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMMd"
        guard let startDate = dateFormatter.date(from: start),
            let endDate = dateFormatter.date(from: end) else { return (nil,nil) }
        
        return (startDate, endDate)
    }
    
    static func isInRange(start: Date, end: Date, comparedTo date: Date) -> Bool {
        
        if date.month > start.month && date.month < end.month {
            return true
        } else if date.month == start.month {
            return date.day > start.day
        } else if date.month == end.month {
            return date.day < end.day
        }
        return false
    }
    
}


extension Date {
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
}


