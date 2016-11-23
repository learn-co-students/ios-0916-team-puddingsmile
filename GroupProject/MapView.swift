//
//  MapView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import MapKit

protocol MapViewDelegate: class {
    func transitionToMarketInfoView()
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var view: MKPinAnnotationView!
        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            dequedView.annotation = annotation
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as! UIView
        }
        return view
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("tapped")
        let location = view.annotation
        guard let name = location?.title else { return }
        print("Name")
        guard let marketName = name else { return }
        print("name")
        //print(mapDelegate)
        //self.infoDelegate.passInTitle(marketName)
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
    }
    
    func centerMapOnCurrentLocation(location: CLLocation) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.02, 0.02) //arbitrary span (about 2X2 miles i think)
        let region = MKCoordinateRegion(center: center, span: span)
        self.setRegion(region, animated: true)
    }
    
}








