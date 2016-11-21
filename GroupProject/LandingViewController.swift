//
//  ViewController.swift
//  Flatiron Group Project
//
//  Created by Neill Perry on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController, LandingViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MarketDatabase.makeMarkets()
        // Do any additional setup after loading the view, typically from a nib.
    
        DataStore.sharedInstance.fetchData()
        let landingView = LandingView(frame: self.view.frame)
        self.view = landingView
        landingView.delegate = self

        
        
    }
    
    func moveToLoginTapped(with sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    
}

