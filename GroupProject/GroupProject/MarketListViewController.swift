//
//  MarketListViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class MarketListViewController: UITableViewController {

    //MARK: - Properties
    let store = DataStore.sharedInstance
    var filteredMarkets = [Market]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        //Search Bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredMarkets = store.markets.filter { market in
            guard let unwrappedName = market.name else { return false }
            return unwrappedName.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    // MARK: - Table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredMarkets.count
        }
        return store.markets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath)
        let market: Market
        if searchController.isActive && searchController.searchBar.text != "" {
            market = filteredMarkets[indexPath.row]
        } else {
            market = store.markets[indexPath.row]
        }
        cell.textLabel!.text = market.name
        return cell
    }

    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let market: Market
        if segue.identifier != "listToViewSegue" { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            if searchController.isActive && searchController.searchBar.text != "" {
                market = filteredMarkets[indexPath.row]
            } else {
                market = store.markets[indexPath.row]
            }
        
            let dest = segue.destination as! MarketInfoViewController
            dest.market = market
        }
    }
}

extension MarketListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
