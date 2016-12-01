//
//  InfoTableViewCell.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/1/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var votedLabel: UILabel!
    var voteButton: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
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
    
    func setupCell() {
        createSubviews()
        setConstraints()
        voteButton.isHidden = false
    }
}

//MARK: - Subviews
extension InfoTableViewCell {
    func createSubviews() {
        createTitleLabel()
        createVotedLabel()
        createVoteButton()
    }
    func createTitleLabel() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
    }
    func createVotedLabel() {
        votedLabel = UILabel()
        contentView.addSubview(votedLabel)
    }
    func createVoteButton() {
        voteButton = UIButton()
        contentView.addSubview(voteButton)
    }
}

//MARK: - Constraints
extension InfoTableViewCell {
    func setConstraints() {
        setTitleLabelConstraints()
        setVotedLabelConstraints()
        setVoteButtonConstraints()
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
        votedLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        votedLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
    func setVoteButtonConstraints() {
        voteButton.translatesAutoresizingMaskIntoConstraints = false
        voteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        voteButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        voteButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        voteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
    }
}









