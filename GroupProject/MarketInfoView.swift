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
    var cityButton:     UIButton!
    var cityLabel:      UILabel!
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
    
    //MARK: - Editor Objects
    var editorBox: EditorBox!
    var infoTableView: InfoTableView!
    var isEditing: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themePrimary

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        if touch.y > bounds.height * 0.43 {
            if isEditing {
                endEditState()
                toggleEditButton(state: false)
            }
        }
       
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
        cityButton.isEnabled = state
        seasonButton.isEnabled = state
        daysButton.isEnabled = state
        timeButton.isEnabled = state
        ebtButton.isEnabled = state
    }
}

//MARK: - ButtonActions
extension MarketInfo {
    func backButtonAction() {
        self.infoTableView.isHidden = true
        self.editorBox.isHidden = true
        delegate.triggerBackSegue()
    }
    

    func editButtonAction() {
        if isEditing {
            endEditState()
            toggleEditButton(state: false)
        } else {
            startEditState()
            toggleEditButton(state: true)
        }
    }
    func startEditState() {
        isEditing = true
        infoTableView.readForUpdates()
        showInfoTableView()
    }
    func endEditState() {
        isEditing = false
        toggleButtons(state: false)
        resetOriginalLabels()
        hideEditorBox()
        hideInfoTableView()
    }
    
    //MARK: - EditorBoxDelegate methods
    func editorBoxCancel() {
        print(1)
        swapToInfoTable()
        toggleButtons(state: false)
    }
    
    //MARK: - InfoTableViewDelegate methods
    func sendMarketChanges(marketChanges: MarketChanges) {
        resetOriginalLabels()
        if let name = marketChanges.name {
            nameLabel.text = "Name: \(name)"
            nameLabel.backgroundColor = UIColor.themePrimary
        }
        if let address = marketChanges.address {
            addressLabel.text = "Address: \(address)"
            addressLabel.backgroundColor = UIColor.themePrimary
        }
        if let city = marketChanges.city {
            cityLabel.text = "City: \(city)"
            cityLabel.backgroundColor = UIColor.themePrimary
        }
        if let season = marketChanges.season {
            seasonLabel.text = "Season: \(season)"
            seasonLabel.backgroundColor = UIColor.themePrimary
        }
        if let days = marketChanges.days {
            daysLabel.text = "Days Open: \(days)"
            daysLabel.backgroundColor = UIColor.themePrimary
        }
        if let time = marketChanges.times {
            timeLabel.text = "Times Open: \(time)"
            timeLabel.backgroundColor = UIColor.themePrimary
        }
        if let ebt = marketChanges.ebt {
            ebtLabel.text = "Accept EBT - \(ebt)"
            ebtLabel.backgroundColor = UIColor.themePrimary
        }
    }
    
    func addNewMarketChange() {
        resetOriginalLabels()
        swapToEditorBox()
        editorBox.setNeutralState()
        toggleButtons(state: true)
    }
    
    func resetOriginalLabels() {
        nameLabel.text = "Name: \(market.name!)"
        nameLabel.backgroundColor = UIColor.themeSecondary
        addressLabel.text = "Address: \(market.address!)"
        addressLabel.backgroundColor = UIColor.themeSecondary
        cityLabel.text = "City: \(market.borough!)"
        cityLabel.backgroundColor = UIColor.themeSecondary
        seasonLabel.text = "Season: \(market.openDate!) - \(market.closeDate!)"
        seasonLabel.backgroundColor = UIColor.themeSecondary
        daysLabel.text = "Days Open: \(market.weekDayOpen!)"
        daysLabel.backgroundColor = UIColor.themeSecondary
        timeLabel.text = "Times Open: \(market.startTime!) - \(market.endTime!)"
        timeLabel.backgroundColor = UIColor.themeSecondary
        ebtLabel.text = "Accept EBT - \(market.acceptEBT == "EBT" ? "True" : "False")"
        ebtLabel.backgroundColor = UIColor.themeSecondary
    }
    
    func favoriteButtonAction() {
        endEditState()
    }
    
    func commentsButtonAction() {
        endEditState()
        delegate.triggerCommentsSegue()
    }
    
    func startSafari() {
        if !isEditing {
            let url = URL(string: market.marketWebsite!)
            guard let uUrl = url else { return }
            delegate.showSafariVC(url: uUrl)
        }
    }
    
    func editNameAction() {
        if editorBox.editorState != .nameEdit {
            editorBox.setNameEditState()
        }
    }
    func editAddressAction(){
        editorBox.setAddressEditState()
    }
    func editCityAction(){
        editorBox.setCityEditState()
    }
    func editSeasonAction(){
        editorBox.setSeasonEditState()
    }
    func editDaysAction(){
        editorBox.setDaysEditState()
    }
    func editTimeAction(){
        editorBox.setTimesEditState()
    }
    func editEBTAction(){print(1)}
    func editWebsiteAction(){}
}

//MARK: - Animation functions
extension MarketInfo {
    func showInfoTableView() {
        self.infoTableView.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * 0.7
        }, completion: { (success) in
            
        })
    }
    func hideInfoTableView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * -1
        }, completion: { (success) in
            self.infoTableView.isHidden = true
        })
    }
    func hideEditorBox() {
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = self.editorBox.frame.height * -1
        }, completion: { (success) in
            self.editorBox.isHidden = true
        })
    }
    func swapToEditorBox() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * -1
        }, completion: { (success) in
            self.infoTableView.isHidden = true
            self.editorBox.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.editorBox.center.y = self.editorBox.frame.height * 0.7
            })
        })
    }
    func swapToInfoTable() {
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = self.editorBox.frame.height * -1
        }, completion: { (success) in
            self.editorBox.isHidden = true
            self.infoTableView.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.infoTableView.center.y = self.infoTableView.frame.height * 0.7
            })
        })
    }
    
    func toggleEditButton(state: Bool) {
        if state {
            editButton.layer.borderWidth = 3
        } else {
            editButton.layer.borderWidth = 0
        }
    }
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
