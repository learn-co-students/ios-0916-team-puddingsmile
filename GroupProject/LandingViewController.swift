//
//  ViewController.swift
//  Flatiron Group Project
//
//  Created by Neill Perry on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let landingView = LandingView(frame: self.view.frame)
        self.view = landingView
        
        
        let test = MarketDatabase()
        test.makeMarkets()
        
    }
    
}

