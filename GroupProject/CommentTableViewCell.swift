//
//  CommentCellXibView.swift
//  GroupProject
//
//  Created by Neill Perry on 11/29/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

class  CommentTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var containerView: UIView!
    var commentView: UITextView!
    var nameLabel: UILabel!
    var reportButton: UIButton!
    var market: Market!
    var marketLabel: UILabel!
    
    var commentObject: MarketComment!{
        didSet {
            if let displayComment =  commentObject.comment {
                commentView.text = "\(displayComment)"
            }
            if let displayName =  commentObject.name {
                nameLabel.text = "- \(displayName)"
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.themeTertiary
        
        containerView = UIView()
        containerView.backgroundColor = UIColor.themeSecondary
        self.addSubview(containerView)
        
        commentView = UITextView()
        commentView.backgroundColor = UIColor.themeSecondary
        commentView.font = UIFont.systemFont(ofSize: 18)
        commentView.textAlignment = NSTextAlignment.justified
        containerView.addSubview(commentView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.italicSystemFont(ofSize: 14)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.gray
        containerView.addSubview(nameLabel)
        
        reportButton = UIButton()
        reportButton.setTitle("Report", for: .normal)
        reportButton.setTitle("Reported", for: .selected)
        reportButton.addTarget(self, action: #selector(reportButtonAction), for: .touchUpInside)
        reportButton.setTitleColor(UIColor.darkGray, for: .normal)
        reportButton.titleLabel!.font = UIFont.systemFont(ofSize: 24)
        containerView.addSubview(reportButton)
    }

    func reportButtonAction() {
        FirebaseAPI.reportContent(withKey: commentObject.commentID)
    }
    
    func addConstraints() {
        
        //Container View
        containerView.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.05, width: self.bounds.width * 0.9, height: self.bounds.height * 0.9)
        containerView.layer.cornerRadius = 10
        
        //Comment Label
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        commentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.1).isActive = true
        commentView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        commentView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6).isActive = true
        
        //Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: containerView.bounds.height * 0.1).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.25).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.6).isActive = true
        
        //Report Button
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: containerView.bounds.height * 0.2).isActive = true
        reportButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.35).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.15).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.05).isActive = true
        reportButton.layer.cornerRadius = 10
    }
    
    
    
}
