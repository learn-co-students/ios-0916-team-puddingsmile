//
//  LocationManager.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/18/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import CoreLocation


struct LocationManager {
    
    static func inRange(withDistance: Double, inRadius: Double) -> Bool {
        return withDistance < inRadius
    }
    
    static func getDistance(ofLocation location: (Double, Double), ofMarket market: (Double, Double)) -> Double {
        
        let p = 0.017453292519943295
        
        let a = 0.5 - cos((market.0 - location.0) * p)/2 + cos(location.0 * p) * cos(market.0 * p) * (1 - cos((market.1 - location.1) * p)) / 2
        
        return 12742 * asin(sqrt(a))
    }
    
    func getGeoLocation(with address: String) {
        
    }
    
    
}

// lat , long
//title / name of market
//address of market
