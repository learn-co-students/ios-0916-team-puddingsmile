//
//  MarketTableViewTableViewCell.swift
//  mapKitTest
//
//  Created by Neill Perry on 11/18/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import MapKit

protocol MarketTableViewDelegate: class {
    func startSegueRow(market: Market)
}


class MarketTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    let store = DataStore.sharedInstance
    
    weak var tableDelegate: MarketTableViewDelegate!
    
    override func awakeFromNib() {
        dataSource = self
        delegate = self
        super.awakeFromNib()
    }

    func numberOfSections(in tableView:UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return store.markets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath) as! MarketTableCell
        
        let market = store.markets[indexPath.row]
        
        cell.marketView.market = market
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableDelegate.startSegueRow(market: store.markets[indexPath.row])
    }
    
}














