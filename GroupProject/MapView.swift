//
//  MapView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import MapKit


class MapView: MKMapView, MKMapViewDelegate {
    
    var locationManager: CLLocationManager!
    let locationArray = DataStore.sharedInstance.markets
    var mapItemList: [MKMapItem] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        initialSetupForView()
        setupLocationManager()
        self.convertMarketsToMapItem()
        self.addAnnotationsToMap()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialSetupForView() {
        self.showsUserLocation = true
        self.isZoomEnabled = true
    }
    
    func convertMarketsToMapItem() {
        for location in locationArray {
            let longitude = Double(location.longitude!)
            let latitude = Double(location.latitude!)
            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude!, longitude!))
            mapItemList.append(MKMapItem(placemark: placemark))
        }
    }
    
    
//    func addAnnotationsToMap() {
//        
//        var annotations: [MKAnnotation] = []
//        for location in mapItemList {
//            let annotation = MKPointAnnotation()
//            
//            annotation.coordinate = location.placemark.coordinate
//            annotations.append(annotation)
//        }
//        self.addAnnotations(annotations)
//    }
    
    
    func addAnnotationsToMap() {
        var annotations: [MKAnnotation] = []
        for location in locationArray {
            let annotation = MKPointAnnotation()
            let latitude = Double(location.latitude!)
            let longitude = Double(location.longitude!)
            
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            annotation.title = location.name
            annotation.subtitle = location.address
            annotations.append(annotation)
        }
        self.addAnnotations(annotations)
    }
    
    
}

extension MapView: CLLocationManagerDelegate {
    
    func setupLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        centerMapOnCurrentLocation(location: location)
       
    }
    
    func centerMapOnCurrentLocation(location: CLLocation) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.02, 0.02) //arbitrary span (about 2X2 miles i think)
        let region = MKCoordinateRegion(center: center, span: span)
        self.setRegion(region, animated: true)
  
    }
    
}








