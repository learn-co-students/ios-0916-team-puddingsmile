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
    var commentLabel: UILabel!
    var nameLabel: UILabel!
    var reportButton: UIButton!
    
    var commentObject: MarketComment!{
        didSet {
            if let displayComment =  commentObject.comment {
                commentLabel.text = "\(displayComment)"
            }
            if let displayName =  commentObject.name {
                nameLabel.text = "\(displayName)"
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
       // addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        //addConstraints()
    }
    
    func commonInit() {
        self.backgroundColor = UIColor.themeTertiary
        
        containerView = UIView()
        containerView.backgroundColor = UIColor.themeSecondary
        self.addSubview(containerView)
        
        commentLabel = UILabel()
        containerView.addSubview(commentLabel)
        
        nameLabel = UILabel()
        containerView.addSubview(nameLabel)
        
        reportButton = UIButton()
        containerView.addSubview(reportButton)
    }
    
    
    
    func likesButtonAction() {
        //add the likes function here *******
    }
    
    func unlikesButtonAction() {
        //add the unlikes function here ********
    }
    
    func reportButtonAction() {
        //add the deletes comment function here ********
    }
    
    func addConstraints() {
        containerView.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.05, width: self.bounds.width * 0.9, height: self.bounds.height * 0.9)
        containerView.layer.cornerRadius = 10
        //Container View
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        containerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
//        containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
//        containerView.layer.cornerRadius = 10
        
        //Comment Label
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        commentLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.1).isActive = true
        commentLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        commentLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        commentLabel.textAlignment = NSTextAlignment.justified
        
        //Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.6).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.25).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.6).isActive = true
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.blue
        //nameLabel.text = "Name Label"
        
        //Report Button
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.6).isActive = true
        reportButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.25).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.6).isActive = true
        reportButton.setTitle("Report", for: .normal)
        reportButton.setTitle("Reported", for: .selected)
        reportButton.addTarget(self, action: #selector(reportButtonAction), for: .touchUpInside)
        reportButton.setTitleColor(UIColor.red, for: .normal)
        
        
        print("The frame is \(reportButton.frame)")
        print("The bounds are \(reportButton.bounds)")
        /*
        //Likes Label
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.85).isActive = true
        likesLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.5).isActive = true
        likesLabel.text = "10 Likes"
        
        //Likes Button
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        likesButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.85).isActive = true
        likesButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        likesButton.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.1).isActive = true
        likesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.7).isActive = true
        likesButton.setTitle("👍🏽", for: .normal)
        likesButton.setTitle("Unlike", for: .selected)
        likesButton.addTarget(self, action: #selector(likesButtonAction), for: .touchUpInside)
        likesButton.addTarget(self, action: #selector(unlikesButtonAction), for: .touchUpOutside)
         */
        
    }
    
    
    
}
