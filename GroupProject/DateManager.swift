//
//  StringToDate.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/18/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation


class DateManager {
    
    static func produceDates(start: String, end: String) -> (Date?, Date?){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/d"
        guard let startDate = dateFormatter.date(from: start),
            let endDate = dateFormatter.date(from: end) else { return (nil,nil) }
        
        return (startDate, endDate)
    }
    
    static func isInRangeOfDay(between startDay: Date, and endDay: Date, comparedTo date: Date) -> Bool {
        
        if date.month > startDay.month && date.month < endDay.month {
            return true
        } else if date.month == startDay.month {
            return date.day >= startDay.day
        } else if date.month == endDay.month {
            return date.day <= endDay.day
        }
        return false
    }
    
    static func produceHours(start: String, end: String) -> (Date?, Date?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mmaa"
        guard let startHour = dateFormatter.date(from: start),
            let endHour = dateFormatter.date(from: end) else { return (nil,nil) }
        
        return (startHour, endHour)
    }
    
    static func isInRangeOfHour(between startHour: Date, and endHour: Date, comparedTo date: Date) -> Bool {
        
        if date.hour > startHour.hour && date.hour < endHour.hour {
            return true
        } else if date.hour == startHour.hour {
            return date.minute >= startHour.minute
        } else if date.hour == endHour.hour {
            return date.minute <= endHour.minute
        }
        return false
    }
    
    static func getDayOfWeek(from date: Date) -> String {
        
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
    
    static func isMarketOpenOn(dayOfWeek: String, marketDays: [String]) -> Bool {
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
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
}


enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
}




