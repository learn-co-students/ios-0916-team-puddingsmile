//
//  MarketTableViewTableViewCell.swift
//  mapKitTest
//
//  Created by Neill Perry on 11/18/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import MapKit

class MarketTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    let store = MarketDataStore.sharedInstance
    
    override func awakeFromNib() {
        print("Hello! Is anyone home?")
        print(store.markets.count)
        dataSource = self
        delegate = self
        super.awakeFromNib()
    }

    func numberOfSections(in tableView:UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        print("creating table section for a second time")
        return store.markets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath) as! MarketCell
        
        let market = store.markets[indexPath.row]
        
        cell.marketView.market = market
    
        return cell
    }
    
}














