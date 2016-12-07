//
//  InfoTableViewCell.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/1/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    var cellView = UIView()
    var titleLabel = UILabel()
    var votedLabel = UILabel()
    var voteButton = UIButton()
    var reportButton = UIButton()
    
    var marketName: String = ""
    var market: MarketChanges!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(with market: MarketChanges?, named: String) {
        marketName = named
        if market != nil {
            self.market = market
            titleLabel.text = market!.getCellTitleString()
            votedLabel.text = market!.votes
            
            voteButton.isHidden = market!.hasVoted ? true : false
            reportButton.isHidden = market!.hasVoted ? true : false
            votedLabel.isHidden = false
        } else {
            titleLabel.text = "No suggestions for this market"
            voteButton.isHidden = true
            reportButton.isHidden = true
            votedLabel.isHidden = true
        }
    }
    
    func voteForSuggestion() {
        
        FirebaseAPI.upvoteInUpdateMarket(forName: marketName, withId: market.idKey!, upvoted: true)
        
        votedLabel.text = changeVotes(increment: true)
        
        voteButton.isHidden = true
        
        reportButton.isHidden = true
        
    }
    
    func reportSuggestion() {
        
        FirebaseAPI.upvoteInUpdateMarket(forName: marketName, withId: market.idKey!, upvoted: false)
        
        votedLabel.text = changeVotes(increment: false)
        
        voteButton.isHidden = true
        
        reportButton.isHidden = true
        
    }
    
    func changeVotes(increment: Bool) -> String {
        
        var newVotes = ""
        
        if let votes = Int(votedLabel.text!) {
            
            newVotes = increment ? "\(votes + 1)" : "\(votes - 1)"
            
        }
        
        return newVotes
    }
    
}

//MARK: - Subviews
extension InfoTableViewCell {
    func createSubviews() {
        createTitleLabel()
        createVotedLabel()
        createVoteButton()
        createReportButton()
    }
    func createTitleLabel() {
        contentView.addSubview(titleLabel)
    }
    func createVotedLabel() {
        contentView.addSubview(votedLabel)
        votedLabel.backgroundColor = UIColor.cyan
    }
    func createVoteButton() {
        contentView.addSubview(voteButton)
        voteButton.backgroundColor = UIColor.blue
        voteButton.setTitle("⬆", for: .normal)
        voteButton.addTarget(self, action: #selector(voteForSuggestion), for: .touchUpInside)
    }
    func createReportButton() {
        contentView.addSubview(reportButton)
        reportButton.backgroundColor = UIColor.red
        reportButton.setTitle("🚫", for: .normal)
        reportButton.addTarget(self, action: #selector(reportSuggestion), for: .touchUpInside)
    }
}

//MARK: - Constraints
extension InfoTableViewCell {
    func setConstraints() {
        setTitleLabelConstraints()
        setVotedLabelConstraints()
        setVoteButtonConstraints()
        setReportButtonConstraints()
    }
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
    }
    func setVotedLabelConstraints() {
        votedLabel.translatesAutoresizingMaskIntoConstraints = false
        votedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        votedLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        votedLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        votedLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
    func setVoteButtonConstraints() {
        voteButton.translatesAutoresizingMaskIntoConstraints = false
        voteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        voteButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        voteButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        voteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
    func setReportButtonConstraints() {
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.trailingAnchor.constraint(equalTo: voteButton.leadingAnchor).isActive = true
        reportButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        reportButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        reportButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
}









