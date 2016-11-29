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
        
        let marketInfoView = MarketInfo(frame: self.view.frame)
        marketInfoView.market = self.market
        marketInfoView.delegate = self
        self.view = marketInfoView
        marketInfoView.setupMarketInfoView(market: market)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func triggerBackSegue() {
        dismiss(animated: true, completion: nil)
    }

    func triggerEditSegue() {
        performSegue(withIdentifier: "requestChangeSegue", sender: self)
    }
    
    func showSafariVC(url: URL) {
        safari = SFSafariViewController(url: url)
        present(safari, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? RequestChangeViewController {
            dest.market = self.market
        }
    }

    
}
