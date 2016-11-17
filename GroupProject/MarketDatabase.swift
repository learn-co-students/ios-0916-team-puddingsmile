//
//  MarketDatabase.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/17/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MakeFirebaseDatabase {
    let ref = FIRDatabase.database().reference()
    let marketsRef = FIRDatabase.database().reference(withPath: "markets")
    
    
    func makeMarkets() {
        
        let marketNameRef = marketsRef.child("address")
        let latitudeRef = marketsRef.child("latitude")
        let longitudeRef = marketsRef.child("longitude")
        let timesRef = marketsRef.child("time")
        let daysRef = marketsRef.child("days")
        let ebtRef = marketsRef.child("ebt")
        let boroughRef = marketsRef.child("borough")
        let websiteRef = marketsRef.child("website")
        let extrasRef = marketsRef.child("extras")
        
        
        
    }
    
    
    
}
