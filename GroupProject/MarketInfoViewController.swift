//
//  MarketInfoViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import Firebase

class MarketInfoViewController: UIViewController {
    
    var market: Market!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedMarket = market else { return }
        
        let marketInfoView = MarketInfo(frame: self.view.frame)
        marketInfoView.market = unwrappedMarket
        
        self.view = marketInfoView
        marketInfoView.loadLabels()
        marketInfoView.setupLocationManager()
        marketInfoView.centerMapOnCurrentLocation()
        marketInfoView.convertToMapItem()
        marketInfoView.addAnnotationToMap()
        
    }
    
    

   

}
