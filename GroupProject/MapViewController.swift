//
//  MapViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MapViewDelegate {
    var passedMarket: Market!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = MapView(frame: self.view.frame)
        mapView.mapDelegate = self
        self.view = mapView
    }
    
    func getInfo(market: Market) {
        passedMarket = market
    }

    func transitionToMarketInfoView() {
        performSegue(withIdentifier: "marketInfoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "marketInfoSegue" {
            let dest = segue.destination as! MarketInfoViewController
            dest.market = passedMarket
        } else {
            let dest = segue.destination as! MarketListViewController
        }
    }
    
 
}



