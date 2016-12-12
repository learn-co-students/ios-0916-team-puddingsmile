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
        setLayout()
        setConstraints()
        
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
 

    func setLayout() {
        mapView = MapView()
        mapView.mapDelegate = self
        self.view.addSubview(mapView)
        
        let viewFrame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.07)
        navBar = NavBarView(frame: viewFrame)
        navBar.delegate = self
        navBar.titleLabel.text = "CityFresh"
        navBar.titleLabel.textColor = UIColor.themeAccent2
        navBar.titleLabel.font = UIFont(name: "Didot", size: 12)
        navBar.titleLabel.textAlignment = .center
        self.view.addSubview(navBar)
    }
    
    func setConstraints() {
        //MapView constraints
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.07).isActive = true
        mapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mapView.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.93).isActive = true
        
        //NavBar constraints
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.00).isActive = true
        navBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        navBar.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.08).isActive = true
    }
    
    
}

