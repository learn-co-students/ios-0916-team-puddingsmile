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

protocol ProposedMarketViewDelegate {
    
    func triggerBackSegue()
    func showSafariVC(url: URL)
    
}

class ProposedMarketInfo: UIView {
    weak var delegate: MarketInfoDelegate!
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("setting up proposed market info")
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











