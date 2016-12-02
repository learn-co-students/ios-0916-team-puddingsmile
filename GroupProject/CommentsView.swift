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
    func triggerCommentsSegue()

}


class CommentsView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: CommentsViewDelegate!
    
    var market: Market!
    var tableView: UITableView!
    var comments = [MarketComment]()
    
    //MARK: - Navigation Objects
    var navigationView : UIView!
    var backButton:     UIButton!
    var commentButton: UIButton!

    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit() {
        createLayout()
        loadConstraints()
        readForComments()
    }
    
    //MARK: - Logic functions
    func readForComments() {
        self.comments.removeAll()
        FirebaseAPI.readCommentFor(market: market.name!, completion: { commentId in
            for (key, value) in commentId {
                self.comments.append(MarketComment(id: key, value: value))
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }


    func backButtonAction() {
       delegate?.triggerBackSegue()
    }
    
    func commentButtonAction() {
        delegate?.triggerCommentsSegue()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: - Segues
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        let comment: MarketComment!
        
        comment = comments[indexPath.row]
        
        cell.commentObject = comment
        return cell
    }
}


//MARK: - create subviews
extension CommentsView {
    func createLayout() {
        //Add TableView
        tableView = UITableView()
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.allowsSelection = false
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "commentCell")
        
        //Add Navigation Bar
        navigationView = UIView()
        self.addSubview(navigationView)
        navigationView.backgroundColor = UIColor.themeTertiary
        
        //Add Back Button
        backButton = UIButton()
        navigationView.addSubview(backButton)
        backButton.setTitle("⬅️", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        //Add Comment Button
        commentButton = UIButton()
        navigationView.addSubview(commentButton)
        commentButton.setTitle("Add a Comment", for: .normal)
        commentButton.addTarget(self, action: #selector(commentButtonAction), for: .touchUpInside)
        commentButton.titleEdgeInsets.left = 5
        commentButton.titleEdgeInsets.right = 5
    }
    
}


//MARK: - Constraints
extension CommentsView {
    func loadConstraints() {
        
        //TableView Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.07).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.93).isActive = true
        tableView.separatorStyle = .none
        
        
        //Navigation Bar Constraints
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.07).isActive = true
        
        //Back Button Constraints
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: self.bounds.width * 0.03).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        
        //Comment Button Constraints
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: self.bounds.width * 0.55).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.4).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.07).isActive = true
        commentButton.backgroundColor = UIColor.themePrimary
        commentButton.titleLabel?.textColor = UIColor.black
        commentButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: 10)
        commentButton.layer.borderWidth = CGFloat(2)
        
        commentButton.layer.cornerRadius = CGFloat(7)
        commentButton.layer.borderColor = UIColor.themeAccent2.cgColor
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


















