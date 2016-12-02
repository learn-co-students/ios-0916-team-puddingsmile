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
    
    
    init() {}
    
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
