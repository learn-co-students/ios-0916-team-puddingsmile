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
    
    weak var delegate: CommentsViewDelegate?
    weak var tableViewDelegate: UITableViewDelegate?
    weak var tableViewDataSource: UITableViewDataSource?
    
    var market: Market!
    var tableView: UITableView!
    var backButton: UIButton!
    var comments = [MarketComment]()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        createLayout()
        loadConstraints()
    }
    
    func backButtonAction() {
        delegate?.triggerBackSegue()
    }
    
    //MARK: - Segues
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        let comment: MarketComment!
        
        comment = comments[indexPath.row]
        
        cell.commentView = comment
        return cell
    }
}


//MARK: - create subviews
extension CommentsView {
    func createLayout() {
        createFakeData()
        
        //Add TableView
        tableView = UITableView()
        self.addSubview(tableView)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        let commentsCount = comments.count
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "commentCell")
        tableView.numberOfRows(inSection: commentsCount)
        
        //Add Back Button
        backButton = UIButton()
        self.addSubview(backButton)
        backButton.backgroundColor = UIColor.themeSecondary
        backButton.layer.borderWidth = 2
        backButton.layer.cornerRadius = 10
        backButton.layer.borderColor = UIColor.themeAccent2.cgColor
        backButton.setTitle("<", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
    }
    
}


//MARK: - create contraints
extension CommentsView {
    func loadConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.04).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.02).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.06).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.3).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.7).isActive = true
        tableView.separatorStyle = .none
    }
    
    func createFakeData() {
        let comment1 = MarketComment(id: "1", value: ["comment":"This is the greatest market ever", "likes":10, "timeStamp": 102.10, "name":"BubbaFish"])
        let comment2 = MarketComment(id: "2", value: ["comment":"Rockefeller Smeller is better", "likes":2, "timeStamp": 102.10, "name":"BubbaFish"])
        let comment3 = MarketComment(id: "3", value: ["comment":"Pudding Smile is a great name for a rock band", "likes":10, "timeStamp": 102.10, "name":"LionsRampant43"])
        let comment4 = MarketComment(id: "4", value: ["comment":"Hello Darkness, my old friend. Come to see your Mom!", "likes":0, "timeStamp": 102.10, "name":"Joe_Biden"])
        let comment5 = MarketComment(id: "5", value: ["comment":"Flatiron is never going to buy more root beer", "likes":10, "timeStamp": 102.10, "name":"_Amelia"])
        let comment6 = MarketComment(id: "6", value: ["comment":"It is going to rain all day tomorrow", "likes":10, "timeStamp": 102.10, "name":"RocktheSockBlock"])
        let comment7 = MarketComment(id: "7", value: ["comment":"Our fourth team member is the ghost of Steve Jobs", "likes":19, "timeStamp": 102.10, "name":"EagerBeaver19"])
        comments = [comment1, comment2, comment3, comment4, comment5, comment6, comment7]
    }
    
    
    
}


















