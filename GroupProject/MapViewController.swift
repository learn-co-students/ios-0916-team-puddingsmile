//
//  MapViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataStore.sharedInstance.fetchData()
        print("mapview called")
        let mapView = MapView(frame: self.view.frame)
        self.view = mapView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

 
}



