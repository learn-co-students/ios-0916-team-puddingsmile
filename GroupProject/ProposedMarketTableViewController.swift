//
//  ProposedMarketTableViewController.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketTableViewController: UITableViewController {
    
    var addedMarketArray = [AddMarket]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let market = AddMarket(marketName: "Test", startTime: "1", endTime: "1", openDate: "1", closeDate: "1", address: "1", latitude: "1", longitude: "1", ebt: "1", website: "1", days: "1", votes: "1")
        //addedMarketArray.append(market)
        
        FirebaseAPI.pullAddedMarketFromFirebase { (addedMarket) in
            self.addedMarketArray = addedMarket
            self.tableView.reloadData()
            print("firebase called ===============")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("added market array")
        print(addedMarketArray.count)
        return addedMarketArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProposedMarketCell", for: indexPath) as! ProposedMarketCell
        let market = addedMarketArray[indexPath.row]
        cell.proposedMarket.addedMarket = market
        print("setting up cell ++++++++++++++++++")
        return cell
    }


}
