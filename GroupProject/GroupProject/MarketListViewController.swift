//
//  MarketListViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class MarketListViewController: UIViewController, MarketTableViewDelegate {

    let store = DataStore.sharedInstance
    
    var passMarket: Market?
    
    @IBOutlet weak var marketTableView: MarketTableView!
    
    @IBOutlet weak var searchBar: SearchBarXibView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marketTableView.tableDelegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startSegueRow(market: Market) {
        passMarket = market
        performSegue(withIdentifier: "listToViewSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToViewSegue" {
            let dest = segue.destination as! MarketInfoViewController
            dest.market = passMarket
        }
    }
  

}
