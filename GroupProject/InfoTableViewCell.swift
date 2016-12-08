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
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
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
            
            voteButton.isHidden = false
            reportButton.isHidden = false
            votedLabel.isHidden = false
            
            if market!.hasVoted {
                
                voteButton.isUserInteractionEnabled = false
                voteButton.alpha = 0.5
                
                reportButton.isUserInteractionEnabled = false
                reportButton.alpha = 0.5
                
                votedLabel.isHidden = false
                
            } else {
                
                voteButton.isUserInteractionEnabled = true
                voteButton.alpha = 1
                
                reportButton.isUserInteractionEnabled = true
                reportButton.alpha = 1
                
                votedLabel.isHidden = false
                
            }

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
        
        voteButton.isUserInteractionEnabled = false
        voteButton.alpha = 0.5
        
        reportButton.isUserInteractionEnabled = false
        reportButton.alpha = 0.5
        
    }
    
    func reportSuggestion() {
        
        FirebaseAPI.upvoteInUpdateMarket(forName: marketName, withId: market.idKey!, upvoted: false)
        
        votedLabel.text = changeVotes(increment: false)
        
        voteButton.isUserInteractionEnabled = false
        voteButton.alpha = 0.5
        
        reportButton.isUserInteractionEnabled = false
        reportButton.alpha = 0.5
        
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
        
        createCellView()
        createTitleLabel()
        createVotedLabel()
        createVoteButton()
        createReportButton()
        
    }
    
    func createCellView() {
        
        contentView.addSubview(cellView)
        cellView.backgroundColor = UIColor.themeSecondary
        cellView.layer.cornerRadius = 7
        
    }
    
    func createTitleLabel() {
        
        cellView.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
    }
    
    func createVotedLabel() {
        
        cellView.addSubview(votedLabel)
        votedLabel.textAlignment = .center
        
    }
    
    func createVoteButton() {
        
        cellView.addSubview(voteButton)
        voteButton.setTitle("⬆", for: .normal)
        voteButton.addTarget(self, action: #selector(voteForSuggestion), for: .touchUpInside)
        
    }
    
    func createReportButton() {
        
        cellView.addSubview(reportButton)
        reportButton.setTitle("🚫", for: .normal)
        reportButton.addTarget(self, action: #selector(reportSuggestion), for: .touchUpInside)
        
    }
    
}

//MARK: - Constraints
extension InfoTableViewCell {
    
    func setConstraints() {
        
        setCellViewConstraints()
        setTitleLabelConstraints()
        setVotedLabelConstraints()
        setVoteButtonConstraints()
        setReportButtonConstraints()
        
    }
    
    func setCellViewConstraints() {
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: self.contentView.bounds.height * 0.05).isActive = true
        cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: self.contentView.bounds.height * -0.05).isActive = true
        cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: self.contentView.bounds.width * 0.05).isActive = true
        cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: self.contentView.bounds.width * -0.05).isActive = true
        
    }
    
    func setTitleLabelConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 8).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.8).isActive = true
        
    }
    
    func setVotedLabelConstraints() {
        
        votedLabel.translatesAutoresizingMaskIntoConstraints = false
        votedLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        votedLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        votedLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.6).isActive = true
        votedLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.2).isActive = true
        
    }
    
    func setVoteButtonConstraints() {
        
        voteButton.translatesAutoresizingMaskIntoConstraints = false
        voteButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        voteButton.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        voteButton.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.4).isActive = true
        voteButton.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.1).isActive = true
        
    }
    
    func setReportButtonConstraints() {
        
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.trailingAnchor.constraint(equalTo: voteButton.leadingAnchor).isActive = true
        reportButton.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        reportButton.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.4).isActive = true
        reportButton.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.1).isActive = true
        
    }
    
}
