//
//  ViewController.swift
//  Flatiron Group Project
//
//  Created by Neill Perry on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MarketDatabase.makeMarkets()
        // Do any additional setup after loading the view, typically from a nib.
        let landingView = LandingView(frame: self.view.frame)
        self.view = landingView
        

        let info = Parser.csvParser()
        let timeofday = info[50]["timeOfDay"]
        let timeofyear = info[50]["timeOfYear"]
        let tupleDay = Parser.timeOfDay(dayString: timeofday!)
        let tupleMonth = Parser.timeOfYear(monthString: timeofyear!)
        
        print("\(tupleMonth)\(tupleDay)")
        
    }
}

