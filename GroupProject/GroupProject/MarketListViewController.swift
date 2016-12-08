//
//  MarketListViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.

import UIKit

class MarketListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    
    //Views
    var tableView = UITableView()
    var navBar: UIView!
    
    //Nav Bar Buttons
    var backButton: UIButton!
    var favoriteButton: UIButton!
    var addMarketButton: UIButton!
    
    let store = DataStore.sharedInstance
    var filteredMarkets = [Market]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .flipHorizontal
        setLayout()
        setConstraints()
    }

    //MARK: - Button Functions
    func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func favoriteButtonAction() {
        
    }
    
    func addMarketButtonAction() {
        //segue to add market view controller
    }

    
    //MARK: - Layout
    func setLayout() {
        
        //TableView
        //tableView = UITableView()
        tableView.backgroundColor = UIColor.themeTertiary
        tableView.register(MarketTableCell.self, forCellReuseIdentifier: "marketCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        //Search Bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        //Navigation Bar
        navBar = UIView()
        navBar.backgroundColor = UIColor.themeTertiary
        self.view.addSubview(navBar)
        
        //Back Button
        backButton = UIButton()
        backButton.setTitle("⬅️", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        navBar.addSubview(backButton)
        
        //Favorite Button
        favoriteButton = UIButton()
        navBar.addSubview(favoriteButton)
        
        //Add Market Button
        addMarketButton = UIButton()
        addMarketButton.setTitle("➕", for: .normal)
        addMarketButton.addTarget(self, action: #selector(addMarketButtonAction), for: .touchUpInside)
        navBar.addSubview(addMarketButton)
    }
    
    //MARK: - Constraints
    func setConstraints() {
        //TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.bounds.height * 0.07).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.93).isActive = true
        
        //Navigation Bar
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        navBar.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.07).isActive = true
        
        //Back Button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.065).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width * 0.01).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.08).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.08).isActive = true
    
        //Favorite Button
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.04).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.02).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.06).isActive = true
        
        //Add Market Button
        
    }
}

extension MarketListViewController: UISearchResultsUpdating {
    //MARK: - Table View
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredMarkets.count
        }
        return store.markets.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "listToViewSegue", sender: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath) as! MarketTableCell
        let market: Market
        print("\(cell.bounds)")
        
        if searchController.isActive && searchController.searchBar.text != "" {
            market = filteredMarkets[indexPath.row]
              cell.marketView.market = market
        } else {
            market = store.markets[indexPath.row]
            print("The market name is: \(market)")
            dump(cell.marketView)
            
            cell.marketView.market = market
        }
        //cell.marketView.market = market
        return cell
    }
    
    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "listToViewSegue" { return }
        let sender = sender as! UITableView
        let destController = segue.destination as! MarketInfoViewController
        
        if let indexPath = sender.indexPathForSelectedRow {
            if searchController.isActive && searchController.searchBar.text != "" {
                destController.market = filteredMarkets[indexPath.row]
                searchController.isActive = false
            } else {
                destController.market = store.markets[indexPath.row]
            }
        }
    }
    
    //MARK: - Search Bar Functions
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredMarkets = store.markets.filter { market in
            guard let unwrappedName = market.name else { return false }
            guard let unwrappedDay = market.weekDayOpen else { return false }
            return unwrappedName.lowercased().contains(searchText.lowercased()) || unwrappedDay.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}



