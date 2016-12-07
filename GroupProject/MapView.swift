//
//  MapView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

protocol MapViewDelegate: class {
    func transitionToMarketInfoView()
    func getInfo(market: Market)
}


class MapView: MKMapView, MKMapViewDelegate {
    
    var locationManager: CLLocationManager!
    let locationArray = DataStore.sharedInstance.markets
    var mapItemList: [MKMapItem] = []
    weak var mapDelegate: MapViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        initialSetupForView()
        setupLocationManager()
        
        let delay = DispatchTime.now() + 4
        DispatchQueue.main.asyncAfter(deadline: delay) {
            self.convertMarketsToMapItem()
            self.addAnnotationsToMap()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialSetupForView() {
        //self.showsUserLocation = true
        self.isZoomEnabled = true
        self.showsUserLocation = true
        
    }
    

    
//MARK: -Create annotation pins
    
    func convertMarketsToMapItem() {
        for location in locationArray {
            let longitude = Double(location.longitude!)
            let latitude = Double(location.latitude!)
            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude!, longitude!))
            mapItemList.append(MKMapItem(placemark: placemark))
        }
    }
    
    func addAnnotationsToMap() {
        var annotations: [MKAnnotation] = []
        for location in locationArray {
              let market = MarketAnnotation(market: location)
              annotations.append(market)
        }
        self.addAnnotations(annotations)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let identifier = "pin"
//        var view: MKPinAnnotationView!
//        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
//            dequedView.annotation = annotation
//        } else {
//            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
//        }
//        
//        let pin = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//        print("apple image")
//        print(pin.image)
//        let pinImage = UIImage(named: "appleImage")
//        view.image = pinImage
//        print(pin.image)
//        return view
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var view: MKAnnotationView!
        
        
        
        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            dequedView.annotation = annotation
        } else {
            view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            
            //Create an instance of UIImage, load in data store. Then set pinImage to that instance
            let pinImage = UIImage(named: "apple")
            view.image = pinImage

            if (view.annotation?.isKind(of: MKUserLocation.self))! {
                print("Cannot show callout")
                view.canShowCallout = false
            }
            
            return view
        }
        return view
    }
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! MarketAnnotation
        guard let marketToPass = location.market else { return }
        
        
        
        self.mapDelegate?.getInfo(market: marketToPass)
        self.mapDelegate?.transitionToMarketInfoView()
    }
    
    
    
}

extension MapView: CLLocationManagerDelegate {
    
// MARK: -Location Information
    
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
        manager.stopUpdatingLocation()
    }

    
    func centerMapOnCurrentLocation(location: CLLocation) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center: center, span: span)
        self.setRegion(region, animated: true)
    }
    
    
}








