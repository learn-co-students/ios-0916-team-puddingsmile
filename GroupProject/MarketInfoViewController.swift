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
        print("!!!market is \(market.name)")
        
        guard let unwrappedMarket = market else { return }
        print("unwrapped market is \(unwrappedMarket)")
        
        let marketInfoView = MarketInfo(frame: self.view.frame)
        marketInfoView.market = unwrappedMarket
        self.view = marketInfoView
        marketInfoView.loadLabels()
        marketInfoView.setupLocationManager()
        marketInfoView.centerMapOnCurrentLocation()
    }
    
    

   

}
