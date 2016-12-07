//
//  PropsedMarketViewController.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/7/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketInfoViewController: UIViewController {
    
    var market: AddMarket!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading view")
        let proposedMarketInfoView = ProposedMarketInfo(frame: self.view.frame)
        self.view = proposedMarketInfoView
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    

}
