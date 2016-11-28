//
//  AddMarketViewController.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddMarketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let addMarketView = AddMarketView(frame: self.view.frame)
        self.view = addMarketView
        print("view loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    

}
