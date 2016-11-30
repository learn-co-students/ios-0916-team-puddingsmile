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
    func triggerCommentsSegue()
    func showSafariVC(url: URL)
}

class MarketInfo: UIView {
    
    weak var delegate: MarketInfoDelegate!
    var market: Market!
    
    //MARK: - Map objects
    var mapView:    MKMapView!
    var marketPin:  MKMapItem!
    var locationManager: CLLocationManager!
    
    //MARK: - Navigation Objects
    var navigationView : UIView!
    
    var backButton:     UIButton!
    var editButton:     UIButton!
    var favoriteButton: UIButton!
    var commentsButton: UIButton!
    
    //MARK: - DetailView Objects
    var detailView:     UIView!
    
    var nameButton:     UIButton!
    var nameLabel:      UILabel!
    var addressButton:  UIButton!
    var addressLabel:   UILabel!
    var boroughButton:  UIButton!
    var boroughLabel:   UILabel!
    var seasonButton:   UIButton!
    var seasonLabel:    UILabel!
    var daysButton:     UIButton!
    var daysLabel:      UILabel!
    var timeButton:     UIButton!
    var timeLabel:      UILabel!
    var ebtButton:      UIButton!
    var ebtLabel:       UILabel!
    var websiteButton:  UIButton!
    var websiteLabel:   UILabel!
    
    //MARK: - Logic States
    var editorBox: EditorBox?
    var isEditing: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themePrimary
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMarketInfoView(market: Market) {
        self.market = market
        createObjects()
        loadContraints()
        setupLocationManager()
        centerMapOnCurrentLocation()
        convertToMapItem()
        addAnnotationToMap()
    }
    
    func toggleButtons(state: Bool) {
        nameButton.isEnabled = state
        addressButton.isEnabled = state
        boroughButton.isEnabled = state
        seasonButton.isEnabled = state
        daysButton.isEnabled = state
        timeButton.isEnabled = state
        ebtButton.isEnabled = state
        websiteButton.isEnabled = !state
    }
}

//MARK: - ButtonActions
extension MarketInfo {
    func backButtonAction() {
        delegate.triggerBackSegue()
    }
    
    func editButtonAction() {
//        editorBox = EditorBox(frame: CGRect(x: 0, y: self.bounds.height * 0.07, width: self.bounds.width, height: self.bounds.height * 0.36))
//        editorBox?.createObjects()
//        self.addSubview(editorBox!)
//        if isEditing {
//            isEditing = false
//            toggleButtons(state: false)
//        } else {
//            isEditing = true
//            toggleButtons(state: true)
//        }
        let infoTableView = InfoTableView(frame: CGRect(x: 0, y: self.bounds.height * 0.07, width: self.bounds.width, height: self.bounds.height * 0.36))
        infoTableView.setupInfoTableView(market: self.market)
        self.addSubview(infoTableView)
    }
    
    func favoriteButtonAction() {
        
    }
    
    func commentsButtonAction() {
        delegate.triggerCommentsSegue()
    }
    
    func startSafari() {
        let url = URL(string: market.marketWebsite!)
        guard let uUrl = url else { return }
        delegate.showSafariVC(url: uUrl)
    }
    
    func editNameAction() {
        
    }
    func editAddressAction(){print(1)}
    func editBoroughAction(){print(1)}
    func editSeasonAction(){print(1)}
    func editDaysAction(){print(1)}
    func editTimeAction(){print(1)}
    func editEBTAction(){print(1)}
    func editWebsiteAction(){}
}

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

//MARK: - Create Subviews
extension MarketInfo {
    func createObjects() {
        createMapView()
        createNavigationView()
        createBackButton()
        createEditButton()
        createFavoriteButton()
        createCommentsButton()
        createDetailView()
        createNameButtonView()
        createAddressButtonView()
        createBoroughButtonView()
        createSeasonButtonView()
        createDaysButtonView()
        createTimeButtonView()
        createEBTButtonView()
        createWebsiteButtonView()
    }
    
    func createMapView() {
        mapView = MKMapView()
        self.addSubview(mapView)
        mapView.isUserInteractionEnabled = false
        mapView.layer.cornerRadius = 10
    }
    
    func createNavigationView() {
        navigationView = UIView()
        self.addSubview(navigationView)
        navigationView.backgroundColor = UIColor.themeTertiary
    }
    
    func createBackButton() {
        backButton = UIButton()
        navigationView.addSubview(backButton)
        backButton.setTitle("⬅", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }
    
    func createEditButton() {
        editButton = UIButton()
        navigationView.addSubview(editButton)
        editButton.setTitle("📝", for: .normal)
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
    }
    
    func createFavoriteButton() {
        favoriteButton = UIButton()
        navigationView.addSubview(favoriteButton)
        favoriteButton.setTitle("♥️", for: .normal)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    func createCommentsButton() {
        commentsButton = UIButton()
        navigationView.addSubview(commentsButton)
        commentsButton.setTitle("💬", for: .normal)
        commentsButton.addTarget(self, action: #selector(commentsButtonAction), for: .touchUpInside)
    }
    
    func createDetailView() {
        detailView = UIView()
        self.addSubview(detailView)
        detailView.backgroundColor = UIColor.themeSecondary
        detailView.layer.cornerRadius = 10
    }
    
    func createNameButtonView() {
        nameButton = UIButton()
        self.detailView.addSubview(nameButton)
        nameButton.isEnabled = false
        nameButton.addTarget(self, action: #selector(editNameAction), for: .touchUpInside)
        
        nameLabel = UILabel()
        self.detailView.addSubview(nameLabel)
        nameLabel.backgroundColor = UIColor.themeSecondary
        nameLabel.text = "Name: \(market.name!)"
        nameLabel.font = Constants.themeFont()
    }
    func createAddressButtonView() {
        addressButton = UIButton()
        self.detailView.addSubview(addressButton)
        addressButton.isEnabled = false
        addressButton.addTarget(self, action: #selector(editAddressAction), for: .touchUpInside)
        
        addressLabel = UILabel()
        self.detailView.addSubview(addressLabel)
        addressLabel.backgroundColor = UIColor.themeSecondary
        addressLabel.text = "Address: \(market.address!)"
        addressLabel.font = Constants.themeFont()
    }
    
    func createBoroughButtonView() {
        boroughButton = UIButton()
        self.detailView.addSubview(boroughButton)
        boroughButton.isEnabled = false
        boroughButton.addTarget(self, action: #selector(editBoroughAction), for: .touchUpInside)
        
        boroughLabel = UILabel()
        self.detailView.addSubview(boroughLabel)
        boroughLabel.backgroundColor = UIColor.themeSecondary
        boroughLabel.text = "Borough: \(market.borough!)"
        boroughLabel.font = Constants.themeFont()
    }
    
    func createSeasonButtonView() {
        seasonButton = UIButton()
        self.detailView.addSubview(seasonButton)
        seasonButton.isEnabled = false
        seasonButton.addTarget(self, action: #selector(editSeasonAction), for: .touchUpInside)
        
        seasonLabel = UILabel()
        self.detailView.addSubview(seasonLabel)
        seasonLabel.backgroundColor = UIColor.themeSecondary
        seasonLabel.text = "Season: \(market.openDate!) - \(market.closeDate!)"
        seasonLabel.font = Constants.themeFont()
    }
    
    func createDaysButtonView() {
        daysButton = UIButton()
        self.detailView.addSubview(daysButton)
        daysButton.isEnabled = false
        daysButton.addTarget(self, action: #selector(editDaysAction), for: .touchUpInside)
        
        daysLabel = UILabel()
        self.detailView.addSubview(daysLabel)
        daysLabel.backgroundColor = UIColor.themeSecondary
        daysLabel.text = "Days Open: \(market.weekDayOpen!)"
        daysLabel.font = Constants.themeFont()
    }
    
    func createTimeButtonView() {
        timeButton = UIButton()
        self.detailView.addSubview(timeButton)
        timeButton.isEnabled = false
        timeButton.addTarget(self, action: #selector(editTimeAction), for: .touchUpInside)
        
        timeLabel = UILabel()
        self.detailView.addSubview(timeLabel)
        timeLabel.backgroundColor = UIColor.themeSecondary
        timeLabel.text = "Times Open: \(market.startTime!) - \(market.endTime!)"
        timeLabel.font = Constants.themeFont()
    }
    
    func createEBTButtonView() {
        ebtButton = UIButton()
        self.detailView.addSubview(ebtButton)
        ebtButton.isEnabled = false
        ebtButton.addTarget(self, action: #selector(editEBTAction), for: .touchUpInside)
        
        ebtLabel = UILabel()
        self.detailView.addSubview(ebtLabel)
        ebtLabel.backgroundColor = UIColor.themeSecondary
        ebtLabel.text = "Accept EBT - \(market.acceptEBT == "EBT" ? "True" : "False")"
        ebtLabel.font = Constants.themeFont()
    }
    
    func createWebsiteButtonView() {
        websiteButton = UIButton()
        self.detailView.addSubview(websiteButton)
        websiteButton.addTarget(self, action: #selector(startSafari), for: .touchUpInside)
        
        websiteLabel = UILabel()
        self.detailView.addSubview(websiteLabel)
        websiteLabel.backgroundColor = UIColor.themeSecondary
        websiteLabel.text = "Check out website"
        websiteLabel.textColor = UIColor.themePrimary
        websiteLabel.font = Constants.themeFont()
        websiteLabel.textAlignment = .center
    }
}

//MARK: - Create Contraints
extension MarketInfo {
    func loadContraints() {
        setMapViewConstraints()
        setNavigationViewConstraints()
        setBackConstraints()
        setFavoriteConstraints()
        setCommentsConstraints()
        setEditConstraints()
        setDetailViewConstraints()
        setNameConstraints()
        setAddressConstraints()
        setBoroughConstraints()
        setSeasonConstraints()
        setDaysConstraints()
        setTimeConstraints()
        setEBTConstraints()
        setWebsiteConstraints()
    }
    
    func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.08).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.05).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.05).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.35).isActive = true
    }
    
    func setNavigationViewConstraints() {
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.07).isActive = true
    }
    
    func setBackConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: self.bounds.width * 0.03).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
  
    func setFavoriteConstraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: self.bounds.width * -0.03).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
    
    func setCommentsConstraints() {
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        commentsButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        commentsButton.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: self.bounds.width * -0.02).isActive = true
        commentsButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        commentsButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
    
    func setEditConstraints() {
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        editButton.trailingAnchor.constraint(equalTo: commentsButton.leadingAnchor, constant: self.bounds.width * -0.02).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
    
    func setDetailViewConstraints() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        detailView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: self.bounds.height * 0.02).isActive = true
        detailView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * -0.02).isActive = true
    }
    
    func setNameConstraints() {
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        nameButton.topAnchor.constraint(equalTo: detailView.topAnchor, constant: detailView.bounds.height * 0.02).isActive = true
        nameButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        nameButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: detailView.bounds.height * 0.02).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        nameLabel.createBottomBorder(forView: nameLabel)
    }
    
    func setAddressConstraints() {
        addressButton.translatesAutoresizingMaskIntoConstraints = false
        addressButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        addressButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor).isActive = true
        addressButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        addressButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        addressLabel.createBottomBorder(forView: addressLabel)
    }
    
    func setBoroughConstraints() {
        boroughButton.translatesAutoresizingMaskIntoConstraints = false
        boroughButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        boroughButton.topAnchor.constraint(equalTo: addressButton.bottomAnchor).isActive = true
        boroughButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        boroughButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        boroughLabel.translatesAutoresizingMaskIntoConstraints = false
        boroughLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        boroughLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
        boroughLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        boroughLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        boroughLabel.createBottomBorder(forView: boroughLabel)
    }
    
    func setSeasonConstraints() {
        seasonButton.translatesAutoresizingMaskIntoConstraints = false
        seasonButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        seasonButton.topAnchor.constraint(equalTo: boroughButton.bottomAnchor).isActive = true
        seasonButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        seasonButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        seasonLabel.topAnchor.constraint(equalTo: boroughLabel.bottomAnchor).isActive = true
        seasonLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        seasonLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        seasonLabel.createBottomBorder(forView: seasonLabel)
    }
    
    func setDaysConstraints() {
        daysButton.translatesAutoresizingMaskIntoConstraints = false
        daysButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        daysButton.topAnchor.constraint(equalTo: seasonButton.bottomAnchor).isActive = true
        daysButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        daysButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        daysLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor).isActive = true
        daysLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        daysLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        daysLabel.createBottomBorder(forView: daysLabel)
    }
    
    func setTimeConstraints() {
        timeButton.translatesAutoresizingMaskIntoConstraints = false
        timeButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        timeButton.topAnchor.constraint(equalTo: daysButton.bottomAnchor).isActive = true
        timeButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        timeButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        timeLabel.createBottomBorder(forView: timeLabel)
    }
    
    func setEBTConstraints() {
        ebtButton.translatesAutoresizingMaskIntoConstraints = false
        ebtButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        ebtButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        ebtButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        ebtButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        ebtLabel.translatesAutoresizingMaskIntoConstraints = false
        ebtLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        ebtLabel.topAnchor.constraint(equalTo: timeButton.bottomAnchor).isActive = true
        ebtLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        ebtLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        ebtLabel.createBottomBorder(forView: ebtLabel)
    }
    
    func setWebsiteConstraints() {
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        websiteButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        websiteLabel.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor).isActive = true
        websiteLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        websiteLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
    }
}
