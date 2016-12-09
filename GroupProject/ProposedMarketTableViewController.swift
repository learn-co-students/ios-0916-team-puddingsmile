//
//  ProposedMarketTableViewController.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketTableViewController: UIViewController {
    
    var tableView = UITableView()
    var navBar = UIView()
    var backButton = UIButton()
    var addButton = UIButton()
    
    
    var market: AddMarket!
    var selectedMarket: Int!
    var addedMarketArray = [AddMarket]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupSubviews()
        
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
                
                self.tableView.reloadData()
            })
            
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "proposedMarketInfo" { return }
        
        if let destVC = segue.destination as? ProposedMarketInfoViewController {
            
            destVC.market = self.addedMarketArray[(tableView.indexPathForSelectedRow?.row)!]
            
        }
        
    }
    
    func backButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addButtonAction() {
        self.performSegue(withIdentifier: "addMarketSegue", sender: self)
    }

}

//MARK: - Tableview protocol methods
extension ProposedMarketTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedMarketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ProposedMarketCell", for: indexPath) as! ProposedMarketCell
//        cell.setCellConstraints()
//        cell.proposedMarket.setConstraints()
        let market = addedMarketArray[indexPath.row]
        cell.proposedMarket.addedMarket = market
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "proposedMarketInfo", sender: self)
    }
    
}

//MARK: - Subview Setup
extension ProposedMarketTableViewController {
    
    func setupSubviews() {
        
        addSubviewObjects()
        constrainSubviewObjects()
        
    }
    
    func addSubviewObjects() {
    
        self.view.addSubview(tableView)
        tableView.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.height * 0.07, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.93)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.themeTertiary
        tableView.register(ProposedMarketCell.self, forCellReuseIdentifier: "ProposedMarketCell")
        tableView.separatorStyle = .none
        
        self.view.addSubview(navBar)
        navBar.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.07)
        navBar.backgroundColor = UIColor.themeTertiary
        
        
        self.navBar.addSubview(backButton)
        backButton.setTitle("⬅️", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        
        self.navBar.addSubview(addButton)
        addButton.setTitle("➕", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
    }
    
    func constrainSubviewObjects() {
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: navBar.topAnchor, constant: navBar.bounds.width * 0.05).isActive = true
        backButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: navBar.bounds.width * 0.05).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: navBar.bounds.width * 0.08).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: navBar.bounds.width * 0.08).isActive = true
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: navBar.topAnchor, constant: navBar.bounds.width * 0.05).isActive = true
        addButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: navBar.bounds.width * -0.05).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: navBar.bounds.width * 0.08).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: navBar.bounds.width * 0.08).isActive = true
        
        
    }
    
    
}




