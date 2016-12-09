//
//  ProposedMarketSubview.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/7/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SafariServices

protocol ProposedMarketViewDelegate: class {
    
    func triggerBackSegue()
    func showSafariVC(url: URL)
    
}

class ProposedMarketInfo: UIView {
    weak var delegate: ProposedMarketViewDelegate!
    
    var market: AddMarket!
    
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
    
    var canFavorite = true
    
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
    var reportButton:   UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themePrimary
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMarketInfoView(market: AddMarket) {
        self.market = market
        createObjects()
        loadContraints()
        setupLocationManager()
        centerMapOnCurrentLocation()
        convertToMapItem()
        addAnnotationToMap()
    }
    
}

extension ProposedMarketInfo {
    func backButtonAction() {
        delegate.triggerBackSegue()
    }
    
    func resetOriginalLabels() {
        nameLabel.text = "Name: \(market.marketName!)"
        nameLabel.backgroundColor = UIColor.themeSecondary
        addressLabel.text = "Address: \(market.address!)"
        addressLabel.backgroundColor = UIColor.themeSecondary
        seasonLabel.text = "Season: \(market.openDate!) - \(market.closeDate!)"
        seasonLabel.backgroundColor = UIColor.themeSecondary
        daysLabel.text = "Days Open: \(market.days!)"
        daysLabel.backgroundColor = UIColor.themeSecondary
        timeLabel.text = "Times Open: \(market.startTime!) - \(market.endTime!)"
        timeLabel.backgroundColor = UIColor.themeSecondary
        ebtLabel.text = "Accept EBT - \(market.ebt == "EBT" ? "True" : "False")"
        ebtLabel.backgroundColor = UIColor.themeSecondary
    }
    
    func favoriteButtonAction() {
        FirebaseAPI.upvoteAddedMarket(forName: market.marketName!)
    }
    
    func startSafari() {
        let url = URL(string: market.website!)
        guard let unwrappedURL = url else {
            return
        }
        
        let fixedURL = addHTTPTo(url: unwrappedURL)
        
        delegate.showSafariVC(url: fixedURL)
    }
    
    func addHTTPTo(url inputURL: URL) -> URL {
        let httpToAppend = "http://"
        let httpsString = "https://"
        let urlString = String(describing: inputURL).lowercased()
        var returnString = ""
        
        if urlString.characters.count < 10 {
            returnString = httpToAppend + urlString
        }
        
        if !urlString.contains(httpToAppend)  {
            returnString = httpToAppend + urlString
        }
        
        let returnURL = URL(string: returnString)
        
        if let unwrappedURL = returnURL {
            return unwrappedURL
        }
        
        return inputURL
    }
    
    
    
}


//MARK: - InfoTableViewDelegate methods
extension ProposedMarketInfo {
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
    
    
}











