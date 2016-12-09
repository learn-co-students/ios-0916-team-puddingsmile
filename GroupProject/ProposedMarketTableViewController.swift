//
//  ProposedMarketTableViewController.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketTableViewController: UITableViewController {
    
    var market: AddMarket!
    var selectedMarket: Int!
    var addedMarketArray = [AddMarket]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        FirebaseAPI.pullAddedMarketFromFirebase { (addedMarket) in
            self.addedMarketArray = addedMarket
            FirebaseAPI.getUserReportedList(handler: { (response) in
                
                if response != nil {
                    
                    for (key, value) in response! {
                        
                        for (index, market) in self.addedMarketArray.enumerated() {
                            if market.marketName == key {
                                self.addedMarketArray.remove(at: index)
                                self.tableView.reloadData()
                                
                            }
                            
                        }
                        
                    }
                    
                } else {
                    print("empty")
                }
                
            })
            self.tableView.reloadData()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedMarketArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProposedMarketCell", for: indexPath) as! ProposedMarketCell
        let market = addedMarketArray[indexPath.row]
        cell.proposedMarket.addedMarket = market
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "proposedMarketInfo" { return }
        
        if let destVC = segue.destination as? ProposedMarketInfoViewController {
            
            destVC.market = self.addedMarketArray[(tableView.indexPathForSelectedRow?.row)!]
            
        }
        
    }

}









