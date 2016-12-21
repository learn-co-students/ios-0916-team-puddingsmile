//
//  AddComment.swift
//  GroupProject
//
//  Created by Neill Perry on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

protocol AddCommentDelegate: class {
    func triggerBackSegue()
}

class AddCommentView: UIView {

    weak var delegate: AddCommentDelegate!
    
    var backButton: UIButton!
    var contentView: UIView!
    var addCommentButton: UIButton!
    var cancelButton: UIButton!
    var commentLabel: UITextView!
    var commentField: UITextView!
    
    var market: Market!{
        didSet {
            if let displayName =  market.name {
                commentLabel.text = "\(displayName)"
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
        addConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        addConstraints()
    }
    
    func commonInit() {
        contentView = UIView()
        contentView.backgroundColor = UIColor.themeSecondary
        addSubview(contentView)
        
        //Add Comment Text Field
        commentField = UITextView()
        commentField.backgroundColor = UIColor.themeTertiary
        commentField.autocorrectionType = .yes
        commentField.textAlignment = NSTextAlignment.center
        commentField.font = UIFont.systemFont(ofSize: 22)
        commentField.layer.borderColor = UIColor.black.cgColor
        commentField.layer.borderWidth = 2
        commentField.textContainer.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(commentField)
        
        //Add Comment Label
        commentLabel = UITextView()
        commentLabel.backgroundColor = UIColor.themeSecondary
        commentLabel.textAlignment = NSTextAlignment.center
          commentLabel.textContainer.lineBreakMode = .byWordWrapping
        commentLabel.font = UIFont.systemFont(ofSize: 20)
        commentLabel.textColor = UIColor.black
        contentView.addSubview(commentLabel)
        
        //Add Back Button
        backButton = UIButton()
        self.addSubview(backButton)
        backButton.setImage(UIImage(named: "backIconPng"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        //Add Comment Button
        addCommentButton = UIButton()
        addCommentButton.setTitle("Post", for: .normal)
        addCommentButton.addTarget(self, action: #selector(addCommentButtonAction), for: .touchUpInside)
        addCommentButton.backgroundColor = UIColor.blue
        addCommentButton.setTitleColor(UIColor.white, for: .normal)
        addCommentButton.titleLabel!.font = UIFont.systemFont(ofSize: 18)
        addCommentButton.titleLabel!.textColor = UIColor.white
        contentView.addSubview(addCommentButton)
        
        //Add Cancel Button
        cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        cancelButton.backgroundColor = UIColor.red
        cancelButton.titleLabel!.font = UIFont.systemFont(ofSize: 18)
        cancelButton.titleLabel!.textColor = UIColor.white
        contentView.addSubview(cancelButton)
    }
    
    func addCommentButtonAction() {
        let commentString = commentField.text
        if commentField.becomeFirstResponder() && commentField.text != "" {
            FirebaseAPI.getCurrentUserName(completion: { (currentUsername) in
                FirebaseAPI.writeCommentFor(market: self.market.name!, with: commentString!, from: currentUsername)
            })
        }
        delegate?.triggerBackSegue()
    }
    
    func backButtonAction() {
        delegate?.triggerBackSegue()
    }

    
    func addConstraints() {
        //Content View
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        //Back Button Constraints
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.03).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.height * 0.035).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.035).isActive = true

        //Comment Field
        commentField.translatesAutoresizingMaskIntoConstraints = false
        commentField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        commentField.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: self.bounds.width * 0.04).isActive = true
        commentField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85).isActive = true
        commentField.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45).isActive = true
        commentField.layer.cornerRadius = CGFloat(7)
        
        //Comment Label
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        commentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.width * 0.15).isActive = true
        commentLabel.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        commentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        
        //Add Comment
        addCommentButton.translatesAutoresizingMaskIntoConstraints = false
        addCommentButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        addCommentButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        addCommentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: self.bounds.width * 0.15).isActive = true
        addCommentButton.topAnchor.constraint(equalTo: commentField.bottomAnchor, constant: self.bounds.width * 0.09).isActive = true
        addCommentButton.layer.cornerRadius = CGFloat(7)
        
        //Cancel Button
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: self.bounds.width * 0.55).isActive = true
        cancelButton.topAnchor.constraint(equalTo: commentField.bottomAnchor, constant: self.bounds.width * 0.09).isActive = true
        cancelButton.layer.cornerRadius = CGFloat(7)
    }
}




















