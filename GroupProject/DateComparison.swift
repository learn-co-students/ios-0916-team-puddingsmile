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
    
    static func isInRange(between start: Date, and end: Date, comparedTo date: Date) -> Bool {
        
        if date.month > start.month && date.month < end.month {
            return true
        } else if date.month == start.month {
            return date.day > start.day
        } else if date.month == end.month {
            return date.day < end.day
        }
        return false
    }
    
    func getDayOfWeek(from date: Date) -> String {
        
        let myCalender = Calendar(identifier: .gregorian)
        
        let myComponents = myCalender.component(.weekday, from: date)
        
        guard let day = Weekday(rawValue: myComponents) else { return "Incorrect Date" }
        
        switch day {
        case .sunday:
            return "Sunday"
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        }
    }
    
    func isMarketOpenOn(dayOfWeek: String, marketDays: [String]) -> Bool {
        return marketDays.contains(dayOfWeek)
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

enum Weekday: Int {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}




