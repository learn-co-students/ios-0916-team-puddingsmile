//
//  RequestChangeView.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

protocol CommentsViewDelegate: class {
    func triggerBackSegue()
    func triggerSaveChanges()
}

class CommentsView: UIView {
    
    weak var delegate: CommentsViewDelegate!
    var market: Market!
    var tableView: UITableView!
    var backButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themePrimary
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupRequestChangeView(market: Market) {
        self.market = market
        createLayout()
        loadConstraints()
        loadLabels()
        print("\(market.closeDate)")
    }
    
    func backButtonAction() {
        delegate.triggerBackSegue()
    }
}


//MARK: - create subviews
extension CommentsView {
    func createLayout() {
        tableView = UITableView()
        self.addSubview(tableView)
        //tableView.delegate = self.
        //tableView.dataSource = self
        
        backButton = UIButton()
        self.addSubview(backButton)
        
    }
    
    func loadLabels() {
        backButton.backgroundColor = UIColor.themeSecondary
        backButton.layer.borderWidth = 2
        backButton.layer.cornerRadius = 10
        backButton.layer.borderColor = UIColor.themeAccent2.cgColor
        backButton.setTitle("<", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }
    
    func loadTableView() {
        //
        let commentsCount = 10
        
        tableView.dequeueReusableCell(withIdentifier: "commentCell")
        tableView.numberOfRows(inSection: commentsCount)
 
    }
}


//MARK: - create contraints
extension CommentsView {
    func loadConstraints() {
        setBackConstraints()
    }
    
    func setBackConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.04).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.02).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
    }
    
}
