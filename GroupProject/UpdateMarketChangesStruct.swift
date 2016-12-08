//
//  UpdateMarketChangesStruct.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/7/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation

//Struct to hold temporary update values from firebase
struct MarketChanges {
    
    var idKey: String?
    var name: String?
    var address: String?
    var city: String?
    var season: String?
    var days: String?
    var times: String?
    var ebt: String?
    var votes: String?
    var hasVoted = false
    
    init(info: [String : String], key: String?) {
        
        self.idKey = key
        self.address = info["address"]
        self.city = info["city"]
        self.days = info["days"]
        self.ebt = info["ebt"]
        self.votes = info["votes"]
        
        if let open = info["openDate"], let close = info["closeDate"] {
            
            self.season = "\(open) - \(close)"
            
        }
        
        if let start = info["startTime"], let end = info["endTime"] {
            
            self.times = "\(start) - \(end)"
            
        }
        
    }
    
    init() {}
    
    func getCellTitleString() -> String {
        
        var titleString = ""
        
        if let _ = address {
            
            if titleString != "" { titleString += " / " }
            
            titleString += "Address"
            
        }
        
        if let _ = city {
            
            if titleString != "" { titleString += " / " }
            
            titleString += "City"
            
        }
        
        if let _ = season {
            
            if titleString != "" { titleString += " / " }
            
            titleString += "Season"
            
        }
        
        if let _ = days {
            
            if titleString != "" { titleString += " / " }
            
            titleString += "Days"
            
        }
        
        if let _ = times {
            
            if titleString != "" { titleString += " / " }
            
            titleString += "Times"
            
        }
        
        if let _ = ebt {
            
            if titleString != "" { titleString += " / " }
            
            titleString += "Ebt"
            
        }
        
        return titleString
        
    }
    
}
