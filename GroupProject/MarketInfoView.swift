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
    
    deinit {
        print("bye bye marketinfoview")
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
        toggleEditButton(state: state)
    }
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
    func swapInfoTableView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * -1
        }, completion: { (success) in
            self.infoTableView.isHidden = true
            UIView.animate(withDuration: 0.2, animations: {
                self.editorBox.center.y = self.editorBox.frame.height * 0.7
            })
        })
    }
    
    func toggleEditButton(state: Bool) {
        if state {
            editButton.layer.borderWidth = 2
        } else {
            editButton.layer.borderWidth = 0
        }
    }
}

//MARK: - ButtonActions
extension MarketInfo: InfoTableDelegate {
    func backButtonAction() {
        self.infoTableView.isHidden = true
        self.editorBox.isHidden = true
        delegate.triggerBackSegue()
    }
    
    func addNewMarketChange() {
        resetOriginalLabels()
        self.editorBox.isHidden = false
        swapInfoTableView()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isEditing {
            endEditState()
        }
    }
    
    func editButtonAction() {
        if isEditing {
            endEditState()
        } else {
            startEditState()
        }
        
    }
    func startEditState() {
        isEditing = true
        toggleButtons(state: true)
        showInfoTableView()
    }
    func endEditState() {
        isEditing = false
        toggleButtons(state: false)
        resetOriginalLabels()
        hideEditorBox()
        hideInfoTableView()
    }
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
        if let borough = marketChanges.borough {
            boroughLabel.text = "Borough: \(borough)"
            boroughLabel.backgroundColor = UIColor.themePrimary
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
    
    func resetOriginalLabels() {
        nameLabel.text = "Name: \(market.name!)"
        nameLabel.backgroundColor = UIColor.themeSecondary
        addressLabel.text = "Address: \(market.address!)"
        addressLabel.backgroundColor = UIColor.themeSecondary
        boroughLabel.text = "Borough: \(market.borough!)"
        boroughLabel.backgroundColor = UIColor.themeSecondary
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
        
    }
    
    func commentsButtonAction() {
        endEditState()
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




