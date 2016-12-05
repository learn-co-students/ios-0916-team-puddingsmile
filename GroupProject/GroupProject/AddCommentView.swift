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
    var commentLabel: UILabel!
    var commentField: UITextField! 
    
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
        commentField = UITextField()
        commentField.backgroundColor = UIColor.lightGray
        commentField.autocorrectionType = .yes
        commentField.textAlignment = NSTextAlignment.center
        commentField.placeholder = "Add comment"
        commentField.isEnabled = true
        contentView.addSubview(commentField)
        
        //Add Comment Label
        commentLabel = UILabel()
        commentLabel.text = "Comment"
        commentLabel.font = UIFont.systemFont(ofSize: 18)
        commentLabel.textColor = UIColor.black
        contentView.addSubview(commentLabel)
        
        //Add Back Button
        backButton = UIButton()
        self.addSubview(backButton)
        backButton.setTitle("⬅️", for: .normal)
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
        cancelButton.setTitleColor(UIColor.red, for: .normal)
        cancelButton.titleLabel!.font = UIFont.systemFont(ofSize: 22)
        cancelButton.titleLabel!.textColor = UIColor.white
        contentView.addSubview(cancelButton)
    }
    
    func addCommentButtonAction() {
        print("User has pressed the add comment button")
        //FirebaseAPI.writeCommentFor(market: <#T##String#>, with: <#T##String#>, from: <#T##String#>)
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
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        
        
        //Comment Field
        commentField.translatesAutoresizingMaskIntoConstraints = false
        commentField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        commentField.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.width * 0.2).isActive = true
        commentField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85).isActive = true
        commentField.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45).isActive = true
        commentField.layer.cornerRadius = CGFloat(7)
        
        //Add Comment
        addCommentButton.translatesAutoresizingMaskIntoConstraints = false
        addCommentButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        addCommentButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        addCommentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.2).isActive = true
        //addCommentButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addCommentButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //addCommentButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: contentView.bounds.width * 0.25).isActive = true
        addCommentButton.layer.cornerRadius = CGFloat(7)
        
        //Cancel Button
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.6).isActive = true
        cancelButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: contentView.bounds.width * 0.25).isActive = true
    }
}




















