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
    
    let locationArray = DataStore.sharedInstance.markets
    let mapView = MKMapView()
    var mapItemList: [MKMapItem] = []
    
    
    
    func initialSetupForView() {
        self.mapView.isScrollEnabled = true
        self.mapView.isZoomEnabled = true
    }
    
    
    func addAnnotationsToMap() {
        var annotations: [MKAnnotation] = []
        for location in mapItemList {
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.placemark.coordinate
            
            annotations.append(annotation)
        }
        let region = MKCoordinateRegion(center: annotations[0].coordinate, span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotations as! MKAnnotation)
    }
    
    
    func convertMarketsToMapItem() {
        print("convert item called")
        for location in locationArray {
            let longitude = Double(location.longitude!)
            let latitude = Double(location.latitude!)
            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude!, longitude!))
            mapItemList.append(MKMapItem(placemark: placemark))
        }
    }
    
    //func mapView(
    
    
    
    
    
}






