//
//  MarketDatabase.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/17/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MarketDatabase {
    
    
    
    let testString = "Bronx Borough Hall Greenmarket,Grand Concourse bet 161st & 162nd Street,40.827307,-73.922772,6/7/11/22,8/16,Tuesday,EBT,Bronx,https://www.grownyc.org/greenmarket/bronx/bronx-borough-hall,Textile Recycling/Food Scrap Composting"
    
    
    
    
    func makeMarkets() {
        let ref = FIRDatabase.database().reference()
        
        let marketsRef = ref.child("markets")
        
        let returnDictionary = csvParser(csv: testString)
        
        
        
        for dictionary in returnDictionary {
            
            let nameChild = marketsRef.child(dictionary["name"]!)
            
            let addressRef = nameChild.child("address")
            addressRef.setValue(dictionary["address"])
            
            let latitudeRef = nameChild.child("latitude")
            latitudeRef.setValue(dictionary["latitude"])
            
            let longitudeRef = nameChild.child("longitude")
            longitudeRef.setValue(dictionary["longitude"])
            
            let timeRef = nameChild.child("time")
            timeRef.setValue(dictionary["time"])
            
            let datesRef = nameChild.child("days")
            datesRef.setValue(dictionary["days"])
            
            let ebtRef = nameChild.child("ebt")
            ebtRef.setValue(dictionary["ebt"])
            
            let boroughRef = nameChild.child("borough")
            boroughRef.setValue(dictionary["borough"])
            
            let websiteRef = nameChild.child("website")
            websiteRef.setValue(dictionary["website"])
            
            let extrasRef = nameChild.child("extras")
            extrasRef.setValue(dictionary["extras"])
            
        }
    }
}




    
