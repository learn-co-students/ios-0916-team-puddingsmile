//
//  Parser.swift
//  Flatiron Group Project
//
//  Created by Alexander Mason on 11/15/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation

struct Parser {
    private static func readDataFromFile() -> String? {
        guard let filePath = Bundle.main.path(forResource: "MarketInfo", ofType: "csv") else { return nil }
        
        do {
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            return contents
        } catch {
            print("File failed for \(filePath) with \(error)")
            return nil
        }
    }
    
    
    static func csvParser() -> [[String : String]] {
        let csv = readDataFromFile()
        
        guard let uCSV = csv else { return [["Error": ""]] }
        
        var jsonDictionary = [[String: String]]()
        var dictionary = [String: String]()
        let line: [String] = uCSV.components(separatedBy: NSCharacterSet.newlines) as [String]
        var values = [String]()
        var arrayOfValues = [[String]]()
        
        for market in line {
            
            if market != "" {
                values = market.components(separatedBy: ",")
                
                arrayOfValues.append(values)
            }
        }
        for values in arrayOfValues {
            dictionary["name"] = values[0]
            dictionary["address"] = values[1]
            dictionary["latitude"] = values[2]
            dictionary["longitude"] = values[3]
            dictionary["timeOfYear"] = values[4]
            dictionary["timeOfDay"] = values[5]
            dictionary["days"] = values[6]
            dictionary["EBT"] = values[7]
            dictionary["borough"] = values[8]
            dictionary["website"] = values[9]
            dictionary["extras"] = values[10]
            jsonDictionary.append(dictionary)
        }
        return jsonDictionary
    }
    

    static func timeOfDay(dayString: String) -> (String, String) {
        let times = dayString.components(separatedBy: "/") as [String]
        var startTimes = [String]()
        var endTimes = [String]()
        if times[0].contains(":") {
            startTimes = times[0].components(separatedBy: ":") as [String]
        } else {
            startTimes.append(times[0])
            startTimes.append("00")
        }
        if times[1].contains(":") {
            endTimes = times[1].components(separatedBy: ":") as [String]
        } else {
            endTimes.append(times[1])
            endTimes.append("00")
        }
     
        var startTime = Int(startTimes[0])!
        var startAA = "am"
        var endTime = Int(endTimes[0])!
        var endAA = "am"

        if startTime > 12 {
            startTime -= 12
            startAA = "pm"
        }
        if endTime > 12 {
            endTime -= 12
            endAA = "pm"
        }

        let startValue = "\(startTime):\(startTimes[1])\(startAA)"
        let endValue = "\(endTime):\(endTimes[1])\(endAA)"
        return (startValue, endValue)

    }
    
    static func timeOfYear(monthString: String) -> (String, String) {
        let times = monthString.components(separatedBy: "/") as [String]
        let startDay = "\(times[0])/\(times[1])"
        let endDay = "\(times[2])/\(times[3])"
        
        return (startDay, endDay)
    }
    
    
}
//func produceDates(from string: String) -> (Date, Date){
//    let elements = terribleString.components(separatedBy: "/")
//    
//    let string1 = elements[0] + elements[1]
//    let string2 = elements[2] + elements[3]
//    
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MMMMd"
//    
//    return (dateFormatter.date(from: string1)!, dateFormatter.date(from: string2)!)
//}
//let dates = produceDates(from: terribleString)
//func isInRange(start: Date, end: Date) -> Bool {
//    let now = Date()
//    if now.month > start.month && now.month < end.month {
//        return true
//    } else if now.month == start.month {
//        return now.day > start.day
//    } else if now.month == end.month {
//        return now.day < end.day
//    }
//    return false
//}
//extension Date {
//    var month: Int {
//        return Calendar.current.component(.month, from: self)
//    }
//    var day: Int {
//        return Calendar.current.component(.day, from: self)
//    }
//}
//isInRange(start: dates.0, end: dates.1)




