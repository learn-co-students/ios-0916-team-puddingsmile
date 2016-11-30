//
//  InfoTableView.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

class InfoTableView: UIView {
    
    var tableView: UITableView!
    var suggestions: [MarketChanges] = []
    var market: Market!
    var hasChanges = true
    
    var addNewButton: UIButton!
    var upvoteButton: UIButton!
    var cancelButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfoTableView(market: Market) {
        self.market = market
        readForUpdates()
        setupTableView()
    }
    
    func readForUpdates() {
        FirebaseAPI.readFromUpdate(with: market.name!) { (success, data) in
            if success {
                for (key, value) in data {
                    let info = value as! [String : String]
                    self.suggestions.append(MarketChanges(info: info, key: key))
                }
                self.hasChanges = true
                self.tableView.reloadData()
            } else {
                self.hasChanges = false
            }
        }
    }
}


//MARK: - TableView delegate and set up
extension InfoTableView: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        createTableView()
        setTableViewConstraints()
    }
    func createTableView() {
        tableView = UITableView()
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "infoCell")
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hasChanges ? suggestions.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        
        if hasChanges {
            cell.textLabel?.text = suggestions[indexPath.row].idKey!
        } else {
            cell.textLabel?.text = "No existing changes."
        }
        
        
        return cell
    }
}




//Struct to hold temporary update values from firebase
struct MarketChanges {
    var idKey: String?
    var name: String?
    var address: String?
    var borough: String?
    var season: String?
    var days: String?
    var times: String?
    var ebt: String?
    
    init(info: [String : String], key: String) {
        self.idKey = key
        self.name = info["name"]
        self.address = info["address"]
        self.borough = info["borough"]
        self.season = info["season"]
        self.days = info["days"]
        self.times = info["times"]
        self.ebt = info["ebt"]
    }
    
}




