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

protocol MarketInfoDelegate: class {
    func triggerBackSegue()
    func triggerEditSegue()
    func showSafariVC(url: URL)
}

class MarketInfo: UIView {
    
    weak var delegate: MarketInfoDelegate!
    
    var market: Market!
    
    var mapView: MKMapView!
    var marketPin: MKMapItem!
    
    var backButton: UIButton!
    var editButton: UIButton!
    
    var nameTitle: UILabel!
    var nameLabel: UILabel!
    
    var addressTitle: UILabel!
    var addressLabel: UILabel!
    
    var boroughTitle: UILabel!
    var boroughLabel: UILabel!
    
    var seasonTitle: UILabel!
    var seasonLabel: UILabel!
    
    var daysTitle: UILabel!
    var daysLabel: UILabel!
    
    var timeTitle: UILabel!
    var timeLabel: UILabel!
    
    var ebtTitle: UILabel!
    var ebtLabel: UILabel!
    
    var extrasTitle: UILabel!
    var extrasLabel: UILabel!
    
    var websiteTitle: UILabel!
    var websiteButton: UIButton!
    
    var locationManager: CLLocationManager!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = UIColor.themePrimary
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMarketInfoView(market: Market) {
        self.market = market
        createLabels()
        loadContraints()
        loadLabels()
        setupLocationManager()
        centerMapOnCurrentLocation()
        convertToMapItem()
        addAnnotationToMap()
    }
    

    
    func backButtonAction() {
        delegate.triggerBackSegue()
    }
    
    func editButtonAction() {
        delegate.triggerEditSegue()
    }
    
    func startSafari() {
        let url = URL(string: market.marketWebsite!)
        guard let uUrl = url else { return }
        delegate.showSafariVC(url: uUrl)
    }
}

//MARK: - Setup Mapkit view
extension MarketInfo: CLLocationManagerDelegate {

    // MARK: -Location Information

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

//MARK: - Create Subviews
extension MarketInfo {
    
    func createLabels() {
        mapView = MKMapView()
        self.addSubview(mapView)
        mapView.isUserInteractionEnabled = false
        
        backButton = UIButton()
        self.addSubview(backButton)
        editButton = UIButton()
        self.addSubview(editButton)
        
        nameTitle = UILabel()
        self.addSubview(nameTitle)
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
    
    func loadLabels() {
        
        let borderWidth: CGFloat = 2
        let cornerRadius: CGFloat = 7
        
        backButton.backgroundColor = UIColor.themeSecondary
        backButton.layer.borderWidth = borderWidth
        backButton.layer.cornerRadius = cornerRadius
        backButton.layer.borderColor = UIColor.themeAccent2.cgColor
        backButton.setTitle("<", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
       
        editButton.backgroundColor = UIColor.themeSecondary
        editButton.layer.borderWidth = borderWidth
        editButton.layer.cornerRadius = cornerRadius
        editButton.layer.borderColor = UIColor.themeAccent2.cgColor
        editButton.setTitle(">", for: .normal)
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        
//        nameTitle.backgroundColor = UIColor.themeSecondary
        nameTitle.layer.borderWidth = borderWidth
        nameTitle.layer.cornerRadius = cornerRadius
        nameTitle.layer.borderColor = UIColor.themeAccent1.cgColor
//        nameTitle.font = UIFont(name: "System", size: 7)
        nameTitle.text = "Market:"
        
        nameLabel.backgroundColor = UIColor.themeSecondary
        nameLabel.layer.borderWidth = borderWidth
        nameLabel.layer.cornerRadius = cornerRadius
        nameLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        nameLabel.text = market.name
        
        addressLabel.backgroundColor = UIColor.themeSecondary
        addressLabel.layer.borderWidth = borderWidth
        addressLabel.layer.cornerRadius = cornerRadius
        addressLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        addressLabel.text = market.address
        
        boroughLabel.backgroundColor = UIColor.themeSecondary
        boroughLabel.layer.borderWidth = borderWidth
        boroughLabel.layer.cornerRadius = cornerRadius
        boroughLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        boroughLabel.text = market.borough
        
        seasonLabel.backgroundColor = UIColor.themeSecondary
        seasonLabel.layer.borderWidth = borderWidth
        seasonLabel.layer.cornerRadius = cornerRadius
        seasonLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        seasonLabel.text = "\(market.openDate!) - \(market.closeDate!)"
        
        daysLabel.backgroundColor = UIColor.themeSecondary
        daysLabel.layer.borderWidth = borderWidth
        daysLabel.layer.cornerRadius = cornerRadius
        daysLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        daysLabel.text = market.weekDayOpen
        
        timeLabel.backgroundColor = UIColor.themeSecondary
        timeLabel.layer.borderWidth = borderWidth
        timeLabel.layer.cornerRadius = cornerRadius
        timeLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        timeLabel.text = "\(market.startTime!) - \(market.endTime!)"
        
        ebtLabel.backgroundColor = UIColor.themeSecondary
        ebtLabel.layer.borderWidth = borderWidth
        ebtLabel.layer.cornerRadius = cornerRadius
        ebtLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        ebtLabel.text = "Accept EBT - \(market.acceptEBT == "EBT" ? "True" : "False")"
        
        websiteButton.backgroundColor = UIColor.themeSecondary
        websiteButton.layer.borderWidth = borderWidth
        websiteButton.layer.cornerRadius = cornerRadius
        websiteButton.layer.borderColor = UIColor.themeAccent2.cgColor
        websiteButton.setTitle("\(market.marketWebsite!)", for: .normal)
        websiteButton.addTarget(self, action: #selector(startSafari), for: .touchUpInside)
        
        extrasLabel.backgroundColor = UIColor.themeSecondary
        extrasLabel.layer.borderWidth = borderWidth
        extrasLabel.layer.cornerRadius = cornerRadius
        extrasLabel.layer.borderColor = UIColor.themeAccent2.cgColor
        extrasLabel.text = market.extras
    }
    
}



//MARK: - Create Contraints
extension MarketInfo {
    func loadContraints() {
        setMapViewConstraints()
        setBackConstraints()
        setEditContraints()
        setNameConstraints()
        setAddressConstraints()
        setBoroughConstraints()
        setSeasonConstraints()
        setDaysConstraints()
        setTimeConstraints()
        setEBTConstraints()
        setExtrasConstraints()
        setWebsiteConstraints()
    }
    
    func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.04).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.1).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.1).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.35).isActive = true
    }
    
    func setBackConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.04).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.02).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
    }
    //self.bounds.width * -0.02
    func setEditContraints() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.04).isActive = true
        editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
    }
    
    func setNameConstraints() {
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.03)
        nameTitle.topAnchor.constraint(equalTo: mapView.bottomAnchor).isActive = true
        nameTitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        nameTitle.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.02).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: self.bounds.height * 0.02).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.04).isActive = true
    }
    
    func setAddressConstraints() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setBoroughConstraints() {
        boroughLabel.translatesAutoresizingMaskIntoConstraints = false
        boroughLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        boroughLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        boroughLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        boroughLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setSeasonConstraints() {
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        seasonLabel.topAnchor.constraint(equalTo: boroughLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        seasonLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        seasonLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setDaysConstraints() {
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        daysLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        daysLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        daysLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setTimeConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setEBTConstraints() {
        ebtLabel.translatesAutoresizingMaskIntoConstraints = false
        ebtLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ebtLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        ebtLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        ebtLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setExtrasConstraints() {
        extrasLabel.translatesAutoresizingMaskIntoConstraints = false
        extrasLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        extrasLabel.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        extrasLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        extrasLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
    
    func setWebsiteConstraints() {
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: extrasLabel.bottomAnchor, constant: self.bounds.height * 0.01).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        websiteButton.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.05).isActive = true
    }
}
