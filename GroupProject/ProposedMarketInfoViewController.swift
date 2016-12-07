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
    var safari: SFSafariViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loading view")
        let proposedMarketInfoView = ProposedMarketInfo(frame: self.view.frame)
        proposedMarketInfoView.market = self.market
        print("in proposedMarketInfo market is \(market?.marketName)")
        self.view = proposedMarketInfoView
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let testMarket = market?.marketName else { return }
        print(testMarket)
    }
    

    

}
