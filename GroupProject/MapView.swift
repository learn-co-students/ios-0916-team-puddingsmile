//
//  MapView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import MapKit

class MapView: UIView {
    
    let mapView = MKMapView()
    
    
    
    
    
    
    
    
    func initialSetupForView() {
        self.mapView.isScrollEnabled = true
        self.mapView.isZoomEnabled = true
    }
    
    
}
