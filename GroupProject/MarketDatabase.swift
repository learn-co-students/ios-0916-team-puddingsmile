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
    
    static func makeMarkets() {
        let ref = FIRDatabase.database().reference()
        
        let marketsRef = ref.child("markets")
        
        let returnDictionary = Parser.csvParser()
        print("called")
        
        for dictionary in returnDictionary {
            print("called")
            
            let nameChild = marketsRef.child(dictionary["name"]!)
            print("after nameChild")
            let addressRef = nameChild.child("address")
            addressRef.setValue(dictionary["address"])
            print("afterAddress")
            let latitudeRef = nameChild.child("latitude")
            latitudeRef.setValue(dictionary["latitude"])
            print("lat")
            let longitudeRef = nameChild.child("longitude")
            longitudeRef.setValue(dictionary["longitude"])
            print("long")
            let timeRef = nameChild.child("timeOfYear")
            timeRef.setValue(dictionary["timeOfYear"])
            print("time")
            let timeOfDay = nameChild.child("timeOfDay")
            timeOfDay.setValue(dictionary["timeOfDay"])
            print("timeOfDay")
            let datesRef = nameChild.child("days")
            datesRef.setValue(dictionary["days"])
            print("datesRef")
            let ebtRef = nameChild.child("ebt")
            ebtRef.setValue(dictionary["EBT"])
            print("ebtRef")
            let boroughRef = nameChild.child("borough")
            boroughRef.setValue(dictionary["borough"])
            print("borough")
            let websiteRef = nameChild.child("website")
            websiteRef.setValue(dictionary["website"])
            print("websiteRef")
            let extrasRef = nameChild.child("extras")
            extrasRef.setValue(dictionary["extras"])
            print("extrasRef")
        }
    }
}




    
