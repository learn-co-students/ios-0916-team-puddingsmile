//
//  MapViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MapViewDelegate, NavBarViewDelegate {
    var passedMarket: Market!
    
    var mapView: MapView!
    var navBar: NavBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        setLayout()
        
=======
        let mapView = MapView(frame: self.view.frame)
        mapView.mapDelegate = self
        self.view = mapView
>>>>>>> master
    }
    
    func getInfo(market: Market) {
        passedMarket = market
    }

    func transitionToMarketInfoView() {
        performSegue(withIdentifier: "marketInfoSegue", sender: self)
    }
    
    func triggerSearchSegue() {
        performSegue(withIdentifier: "marketSearchSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "marketInfoSegue" {
            let dest = segue.destination as! MarketInfoViewController
            dest.market = passedMarket
        }
    }
 
}

extension MapViewController {
    
    func setLayout() {
        //let mapView = MapView(frame: self.view.frame)
        mapView = MapView()
        mapView.mapDelegate = self
        self.view.addSubview(mapView)
        
        navBar = NavBarView()
        self.view.addSubview(navBar)
    }
    
    
    
    
}

