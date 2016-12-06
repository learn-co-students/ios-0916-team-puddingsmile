//
//  AddMarket.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation


struct AddMarket {
    let marketName: String?
    let startTime: String?
    let endTime: String?
    let openDate: String?
    let closeDate: String?
    let address: String?
    let latitude: String?
    let longitude: String?
    let ebt: String?
    let website: String?
    let days: String?
    let votes: String?
    
    init(marketName: String, startTime: String, endTime: String, openDate: String, closeDate: String, address: String, latitude: String, longitude: String, ebt: String, website: String, days: String, votes: String) {
        self.marketName = marketName
        self.startTime = startTime
        self.endTime = endTime
        self.openDate = openDate
        self.closeDate = closeDate
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.ebt = ebt
        self.website = website
        self.days = days
        self.votes = votes
    }
    
    
}
