//
//  InfoTableView.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

protocol InfoTableDelegate: class {
    func sendMarketChanges(marketChanges: MarketChanges)
    func addNewMarketChange()
}

class InfoTableView: UIView {
    
    weak var delegate: InfoTableDelegate!
    
    var tableView: UITableView!
    var suggestions: [MarketChanges] = []
    var market: Market!
    var hasChanges = false
    
    var addNewButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeTertiary
        alpha = 0.8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfoTableView(market: Market) {
        self.market = market
        setupTableView()
        setupSubViews()
    }
    
    //MARK: - Logic functions
    func readForUpdates() {
        FirebaseAPI.readFromUpdate(with: market.name!) { (success, data) in
            if success {
                self.suggestions.removeAll()
                for (key, value) in data {
                    
                    let info = value as! [String : String]
                    
                    FirebaseAPI.hasVotedForUpdate(marketID: key, isTrue: { (success) in
            
                        self.suggestions.append(MarketChanges(info: info, key: key, voted: success))
                        
                        self.tableView.reloadData()
                        
                    })
                }
                
                self.hasChanges = true
                
            } else {

                self.hasChanges = false
                
            }
        }
    }
    
    func addNewMarketChange() {
        delegate.addNewMarketChange()
    }
}

//MARK: - Setup subviews
extension InfoTableView {
    func setupSubViews() {
        createAddNewButton()
        setAddNewButtonConstraints()
    }
    
    func createAddNewButton() {
        addNewButton = UIButton()
        self.addSubview(addNewButton)
        addNewButton.layer.cornerRadius = 7
        addNewButton.backgroundColor = UIColor.themeSecondary
        addNewButton.setTitle("Add A New Request", for: .normal)
        addNewButton.setTitleColor(UIColor.darkGray, for: .normal)
        addNewButton.titleLabel?.font = Constants.themeFont()
        addNewButton.addTarget(self, action: #selector(addNewMarketChange), for: .touchUpInside)
        
    }
    
    func setAddNewButtonConstraints() {
        addNewButton.translatesAutoresizingMaskIntoConstraints = false
        addNewButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addNewButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        addNewButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bounds.height * -0.02).isActive = true
        addNewButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
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
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "infoCell")
    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.bounds.height / 3
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hasChanges ? suggestions.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        
        if hasChanges {
            
            cell.setupCell(with: suggestions[indexPath.row], named: market.name!)
            
        } else {
            
            cell.setupCell(with: nil, named: "")
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if hasChanges {
            delegate.sendMarketChanges(marketChanges: suggestions[indexPath.row])
        }
    }
}




//Struct to hold temporary update values from firebase
struct MarketChanges {
    var idKey: String?
    var name: String?
    var address: String?
    var city: String?
    var season: String?
    var days: String?
    var times: String?
    var ebt: String?
    var votes: String?
    var hasVoted = false
    
    init(info: [String : String], key: String?, voted: Bool) {
        self.idKey = key
        self.name = info["name"]
        self.address = info["address"]
        self.city = info["city"]
        if let open = info["openDate"],
            let close = info["closeDate"] {
            self.season = "\(open) - \(close)"
        }
        self.days = info["days"]
        if let start = info["startTime"],
            let end = info["endTime"] {
            self.times = "\(start) - \(end)"
        }
        self.ebt = info["ebt"]
        self.votes = info["votes"]
        self.hasVoted = voted
        
    }
    
    init() {}
    
    func getCellTitleString() -> String {
        var titleString = ""
        if let _ = name {
            titleString += "Name"
        }
        if let _ = address {
            if titleString != "" { titleString += " / " }
            titleString += "Address"
        }
        if let _ = city {
            if titleString != "" { titleString += " / " }
            titleString += "City"
        }
        if let _ = season {
            if titleString != "" { titleString += " / " }
            titleString += "Season"
        }
        if let _ = days {
            if titleString != "" { titleString += " / " }
            titleString += "Days"
        }
        if let _ = times {
            if titleString != "" { titleString += " / " }
            titleString += "Times"
        }
        if let _ = ebt {
            if titleString != "" { titleString += " / " }
            titleString += "Ebt"
        }

        return titleString
    }
    
}




