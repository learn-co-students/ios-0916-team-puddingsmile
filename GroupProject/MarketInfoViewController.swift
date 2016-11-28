//
//  MarketInfoViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import Firebase
import SafariServices
class MarketInfoViewController: UIViewController, MarketInfoDelegate {
    
    var market: Market!
    var safari: SFSafariViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappedMarket = market else { return }
        
        let marketInfoView = MarketInfo(frame: self.view.frame)
        marketInfoView.market = unwrappedMarket
        marketInfoView.delegate = self
        self.view = marketInfoView
        marketInfoView.setupMarketInfoView(market: market)
        
    }
    
    func startSegue() {
        dismiss(animated: true, completion: nil)
    }

    func showSafariVC(url: URL) {
        safari = SFSafariViewController(url: url)
        present(safari, animated: true, completion: nil)
    }

}
