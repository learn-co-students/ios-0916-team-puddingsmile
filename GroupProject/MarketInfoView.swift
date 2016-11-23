//
//  MarketInfoView.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SafariServices


class MarketInfo: UIView {
    
    var market: Market!
    
    var mapView: MKMapView!
    
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var boroughLabel: UILabel!
    var seasonLabel: UILabel!
    var daysLabel: UILabel!
    var timeLabel: UILabel!
    var ebtLabel: UILabel!
    var websiteButton: UIButton!
    var extrasLabel: UILabel!
    
    var thing: SFSafariViewController?
    
    var locationManager: CLLocationManager!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = UIColor.themeDarkBlue
        createLabels()
        loadContraints()
        //loadLabels()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func createLabels() {
        mapView = MKMapView()
        self.addSubview(mapView)
        mapView.isUserInteractionEnabled = false
        
        nameLabel = UILabel()
        self.addSubview(nameLabel)
        addressLabel = UILabel()
        self.addSubview(addressLabel)
        boroughLabel = UILabel()
        self.addSubview(boroughLabel)
        seasonLabel = UILabel()
        self.addSubview(seasonLabel)
        daysLabel = UILabel()
        self.addSubview(daysLabel)
        timeLabel = UILabel()
        self.addSubview(timeLabel)
        ebtLabel = UILabel()
        self.addSubview(ebtLabel)
        websiteButton = UIButton()
        self.addSubview(websiteButton)
        extrasLabel = UILabel()
        self.addSubview(extrasLabel)
    }
//    func convertMarketsToMapItem() {
//        for location in locationArray {
//            let longitude = Double(location.longitude!)
//            let latitude = Double(location.latitude!)
//            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude!, longitude!))
//            mapItemList.append(MKMapItem(placemark: placemark))
//        }
//    }
//    
//    func addAnnotationsToMap() {
//        var annotations: [MKAnnotation] = []
//        for location in locationArray {
//            
//            let market = MarketAnnotation(market: location)
//            annotations.append(market)
//            
//            
//        }
//        self.addAnnotations(annotations)
//    }
//    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let identifier = "pin"
//        var view: MKPinAnnotationView!
//        if let dequedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
//            dequedView.annotation = annotation
//        } else {
//            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as! UIView
//        }
//        return view
//    }
//    
//    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        print("tapped")
//        
//        let location = view.annotation as! MarketAnnotation
//        
//        //        guard let name = location?.title else { return }
//        //        print("Name")
//        //        guard let marketName = name else { return }
//        //        print("name")
//        guard let marketToPass = location.market else { return }
//        print("Market to pass is \(marketToPass.name)")
//        self.mapDelegate?.getInfo(market: marketToPass)
//        self.mapDelegate?.transitionToMarketInfoView()
    
    func loadLabels() {
    
        nameLabel.backgroundColor = UIColor.themeSand
        nameLabel.text = market.name
        
        addressLabel.backgroundColor = UIColor.themeBrightBlue
        addressLabel.text = market.address
        
        boroughLabel.backgroundColor = UIColor.themeMedBlue
        boroughLabel.text = market.borough
        
        seasonLabel.backgroundColor = UIColor.themeSand
        seasonLabel.text = "\(market.openDate!) - \(market.closeDate!)"
        
        daysLabel.backgroundColor = UIColor.themeTealBlue
        daysLabel.text = market.weekDayOpen
        
        timeLabel.backgroundColor = UIColor.themeMedBlue
        timeLabel.text = "\(market.startTime!) - \(market.endTime!)"
        
        ebtLabel.backgroundColor = UIColor.themeTealBlue
        print("ebt")
        ebtLabel.text = "Accept EBT - \(market.acceptEBT == "EBT" ? "True" : "False")"
        
        websiteButton.backgroundColor = UIColor.themeSand
        websiteButton.setTitle("\(market.marketWebsite!)", for: .normal)
        
        extrasLabel.backgroundColor = UIColor.themeBrightBlue
        extrasLabel.text = market.extras
    }
    
}

extension MarketInfo: CLLocationManagerDelegate {

    // MARK: -Location Information

    func setupLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }


    func centerMapOnCurrentLocation() {
        let center = CLLocationCoordinate2D(latitude: Double(market.latitude!)!, longitude: Double(market.longitude!)!)
        let span = MKCoordinateSpanMake(0.01, 0.01) //arbitrary span (about 2X2 miles i think)
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapView.setRegion(region, animated: true)
    }

}

//MARK: - Create Contraints
extension MarketInfo {
    func loadContraints() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.05).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.1).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.1).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.35).isActive = true
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

        boroughLabel.translatesAutoresizingMaskIntoConstraints = false
        boroughLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        boroughLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        boroughLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        boroughLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        seasonLabel.topAnchor.constraint(equalTo: boroughLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        seasonLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        seasonLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        daysLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        daysLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        daysLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

        ebtLabel.translatesAutoresizingMaskIntoConstraints = false
        ebtLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ebtLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        ebtLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        ebtLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

        extrasLabel.translatesAutoresizingMaskIntoConstraints = false
        extrasLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        extrasLabel.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        extrasLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        extrasLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: extrasLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        websiteButton.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true

    }
}
