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
  //  var likesLabel: UILabel!
  //  var likesButton: UIButton!
    
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
        
        commentView = UITextView()
        commentView.textAlignment = NSTextAlignment.justified
        containerView.addSubview(commentView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.italicSystemFont(ofSize: 14)
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.gray
        containerView.addSubview(nameLabel)
        
        reportButton = UIButton()
        reportButton.setTitle("Report Comment", for: .normal)
        reportButton.setTitle("Reported", for: .selected)
        reportButton.addTarget(self, action: #selector(reportButtonAction), for: .touchUpInside)
        reportButton.setTitleColor(UIColor.red, for: .normal)
        reportButton.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        containerView.addSubview(reportButton)
        
        //Like Label - to be completed later, perhaps
//        likesLabel = UILabel()
//        likesLabel.text = "0 Likes"
//        containerView.addSubview(likesLabel)
//        
//        likesButton = UIButton()
//        containerView.addSubview(likesButton)
    }
    
    
    
    func likesButtonAction() {
        //add the likes function here *******
    }
    
    func unlikesButtonAction() {
        //add the unlikes function here ********
    }
    
    func reportButtonAction() {
        print("User pressed the report comment button!")
        //add the deletes comment function here ********
    }
    
    func addConstraints() {
        containerView.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.05, width: self.bounds.width * 0.9, height: self.bounds.height * 0.9)
        containerView.layer.cornerRadius = 10
        
        //Comment Label
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        commentView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.1).isActive = true
        commentView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        commentView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        
        //Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.6).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.25).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.6).isActive = true
        
        //Report Button
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.65).isActive = true
        reportButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.35).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.25).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.1).isActive = true
    
        //Likes Label
//        likesLabel.translatesAutoresizingMaskIntoConstraints = false
//        likesLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: containerView.bounds.height * 0.85).isActive = true
//        likesLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.15).isActive = true
//        likesLabel.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.15).isActive = true
//        likesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.5).isActive = true
        
        //Likes Button
//        likesButton.translatesAutoresizingMaskIntoConstraints = false
//        likesButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: self.bounds.height * 0.85).isActive = true
//        likesButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.1).isActive = true
//        likesButton.heightAnchor.constraint(equalToConstant: containerView.bounds.height * 0.1).isActive = true
//        likesButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: containerView.bounds.width * 0.7).isActive = true
//        likesButton.setTitle("👍🏽", for: .normal)
//        likesButton.setTitle("Unlike", for: .selected)
//        likesButton.addTarget(self, action: #selector(likesButtonAction), for: .touchUpInside)
//        likesButton.addTarget(self, action: #selector(unlikesButtonAction), for: .touchUpOutside)
    }
    
    
    
}
