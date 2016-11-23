//
//  MarketListViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class MarketListViewController: UIViewController {

    let store = DataStore.sharedInstance
    
    @IBOutlet weak var marketTableView: MarketTableView!
    
    
    @IBOutlet weak var searchBar: SearchBarXibView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // pass any object as parameter, i.e. the tapped row
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "listToViewSegue" {
                let marketRow = store.markets[indexPath.row]
                let dest = segue.destination as! MarketInfoViewController
                dest.market = marketRow
            }
        }
    }
  

}
