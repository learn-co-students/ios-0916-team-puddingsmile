//
//  LocationManager.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/18/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

struct LocationManager {
    
    let manager = CLLocationManager()
    
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

class LocationFinder: NSObject, CLLocationManagerDelegate {
    static let sharedInstance = LocationFinder()
    private override init() {}
    
    private var manager = CLLocationManager()
    private var geocoder = CLGeocoder()
    
    func getLatLong(with address: String, completion: @escaping (Bool, (Double, Double)?) -> Void) {
        var isAcceptableLocation = true
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        print("before geocoder")
        geocoder.geocodeAddressString(address, completionHandler: { (response, error) in
            print("in geocoder")
            if error != nil {
                print(error)
                return
            }
            
            guard let placemark = response else { return }
            for place in placemark {
                
                print("determine placemark")
                let latitude = place.location?.coordinate.latitude
                let longitude = place.location?.coordinate.longitude
                
                guard let unwrappedLatitude = latitude else { return }
                guard let unwrappedLongitude = longitude else { return }
                
                let returnTuple = (Double(unwrappedLatitude), Double(unwrappedLongitude))
                
                if returnTuple == (0,0) {
                    isAcceptableLocation = false
                    completion(isAcceptableLocation, nil)
                }
                
                completion(isAcceptableLocation, (returnTuple.0, returnTuple.1))
            }
        })
        print("after completion")
    }
    
}




// lat , long
//title / name of market
//address of market
