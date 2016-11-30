//
//  CommentCellXibView.swift
//  GroupProject
//
//  Created by Neill Perry on 11/29/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

class CommentCellView: UIView {
    
    //MARK: - Properties
    @IBOutlet var contentView: UIView!
    var containerView: UIView!
    var commentLabel: UILabel!
    var nameLabel: UILabel!
    var likesLabel: UILabel!
    var likesButton: UIButton!
    
    var comment: MarketComment!{
        didSet {
          commentLabel.text = comment.comment
          nameLabel.text = comment.name
          likesLabel.text = String(comment.likes)
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
       // addConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        //addConstraints()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("DisplayComment", owner: self, options: nil)
        
        addSubview(contentView)
        
        containerView = UIView()
        contentView.addSubview(containerView)
        
        commentLabel = UILabel()
        containerView.addSubview(commentLabel)
        
        nameLabel = UILabel()
        containerView.addSubview(nameLabel)

        likesLabel = UILabel()
        containerView.addSubview(likesLabel)
        
        likesButton = UIButton()
        containerView.addSubview(likesButton)
    }
    
    func addConstraints() {
        //Content View
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.backgroundColor = UIColor.themeSecondary
        
        //Container View
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.9).isActive = true
        containerView.layer.cornerRadius = 10
        
        //Comment Label
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.bounds.height * 0.1).isActive = true
        commentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.7).isActive = true
        commentLabel.textAlignment = NSTextAlignment.justified
        
        //Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.5).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        nameLabel.textAlignment = NSTextAlignment.center
        
        //Likes Label
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.7).isActive = true
        likesLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.25).isActive = true
        
        //Likes Button
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        likesButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.7).isActive = true
        likesButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        likesButton.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        likesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.25).isActive = true
    }
    
    
    
}
