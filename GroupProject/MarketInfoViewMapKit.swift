//
//  MarketInfoViewMapKit.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/2/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import MapKit
import UIKit

//MARK: - Setup Mapkit view
extension MarketInfo: CLLocationManagerDelegate {
    func setupLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func centerMapOnCurrentLocation() {
        let center = CLLocationCoordinate2D(latitude: Double(market.latitude!)!, longitude: Double(market.longitude!)!)
        let span = MKCoordinateSpanMake(0.002, 0.005) //arbitrary span (about 2X2 miles i think)
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(region, animated: true)
    }
    
    func convertToMapItem() {
        let longitude = Double(market.longitude!)
        let latitude = Double(market.latitude!)
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude!, longitude!))
        marketPin = MKMapItem(placemark: placemark)
    }
    
    func addAnnotationToMap() {
        let marketAnno = MarketAnnotation(market: self.market)
        mapView.addAnnotation(marketAnno)
    }
    
}
