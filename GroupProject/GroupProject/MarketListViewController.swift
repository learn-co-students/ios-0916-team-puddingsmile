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
    var backButton: UIButton!
    var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .flipHorizontal
        loadButtons()
        setBackConstraints()
        setFavoriteContraints()
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set Up Search Bar
        self.tableView.separatorStyle = .none
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredMarkets = store.markets.filter { market in
            guard let unwrappedName = market.name else { return false }
            guard let unwrappedDay = market.weekDayOpen else { return false }
            return unwrappedName.lowercased().contains(searchText.lowercased()) || unwrappedDay.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    //MARK: - Button Functions
    func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func favoriteButtonAction() {
        
    }
    
    // MARK: - Table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredMarkets.count
        }
        return store.markets.count
    }
    
    overide func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath) as! MarketTableCell
        let market: Market
        if searchController.isActive && searchController.searchBar.text != "" {
            market = filteredMarkets[indexPath.row]
        } else {
            market = store.markets[indexPath.row]
        }
        cell.marketView.market = market
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
    
    
    func loadButtons() {
        
        backButton = UIButton()
        view.addSubview(backButton)
        
        favoriteButton = UIButton()
        view.addSubview(favoriteButton)
        
        let borderWidth: CGFloat = 2
        let cornerRadius: CGFloat = 7
        
        backButton.backgroundColor = UIColor.themePrimary
        backButton.layer.borderWidth = borderWidth
        backButton.layer.cornerRadius = cornerRadius
        backButton.layer.borderColor = UIColor.themeAccent2.cgColor
        backButton.setTitle("<", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        favoriteButton.backgroundColor = UIColor.themePrimary
        favoriteButton.layer.borderWidth = borderWidth
        favoriteButton.layer.cornerRadius = cornerRadius
        favoriteButton.layer.borderColor = UIColor.themeAccent2.cgColor
        favoriteButton.setTitle("Favorites", for: .normal)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    func setBackConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.04).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.02).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.06).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.06).isActive = true
    }
    
    func setFavoriteContraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.04).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.02).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.06).isActive = true
    }
    
}

extension MarketListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}



