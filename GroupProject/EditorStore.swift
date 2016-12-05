//
//  EditorStore.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/1/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation

class EditorStore {
    var name: String?
    var address: String?
    var city: String?
    var startSeason: String?
    var endSeason: String?
    var days: String?
    var startTimes: String?
    var endTimes: String?
    var ebt: String?
    
    var lat: String?
    var long: String?
    
    
    init() {}
    
    func packageData() -> [String : String] {
        var data: [String : String] = [:]
        if let name = self.name {
            data["name"] = name
        }
        if let address = self.address {
            data["address"] = address
        }
        if let city = self.city {
            data["city"] = city
        }
        if let endSeason = self.endSeason {
            if let startSeason = self.startSeason {
                data["openDate"] = startSeason
                data["closeDate"] = endSeason
            }
        }
        if let days = self.days {
            data["days"] = days
        }
        if let endTimes = self.endTimes {
            if let startTimes = self.startTimes {
                data["startTime"] = startTimes
                data["endTime"] = endTimes
            }
        }
//        if let ebt = self.ebt {
//            data["ebt"] = ebt
//        }
        if let lat = self.lat,
            let long = self.long {
            data["latitude"] = lat
            data["longitude"] = long
        }
        
        return data
    }
    
    func resetProperties() {
        name = nil
        address = nil
        city = nil
        startSeason = nil
        endSeason = nil
        days = nil
        startTimes = nil
        endTimes = nil
        ebt = nil
    }
    
    func hasValue() -> Bool {
        
        if let _ = name {
            return true
        }
        if let _ = address {
            return true
        }
        if let _ = city {
            return true
        }
        if let _ = endSeason {
            return true
        }
        if let _ = days {
            return true
        }
        if let _ = endTimes {
            return true
        }
        if let _ = ebt {
            return true
        }
        
        
        return false
    }
    
}
