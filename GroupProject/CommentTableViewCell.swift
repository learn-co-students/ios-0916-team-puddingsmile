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
    var likesLabel: UILabel!
    var likesButton: UIButton!
    var reportButton: UIButton!
    
    var comment: MarketComment!{
        didSet {
          commentLabel.text = comment.comment
          nameLabel.text = comment.name
          likesLabel.text = String(comment.likes)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("DisplayComment", owner: self, options: nil)
        
        containerView = UIView()
        self.addSubview(containerView)
        
        commentLabel = UILabel()
        containerView.addSubview(commentLabel)
        
        nameLabel = UILabel()
        containerView.addSubview(nameLabel)

        likesLabel = UILabel()
        containerView.addSubview(likesLabel)
        
        likesButton = UIButton()
        containerView.addSubview(likesButton)
        
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
    
    func reportCommentButtonAction() {
        //add the deletes comment function here ********
    }
    
    func addConstraints() {
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
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.85).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.1).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.2)
        nameLabel.textAlignment = NSTextAlignment.center
        
        //Likes Label
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.85).isActive = true
        likesLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.5).isActive = true
        likesLabel.text = "\(comment.likes) Likes"
        
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

        //Report Button
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.85).isActive = true
        reportButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        reportButton.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.1).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.85).isActive = true
        reportButton.setTitle("Report", for: .normal)
        reportButton.setTitle("Reported", for: .selected)
        reportButton.addTarget(self, action: #selector(reportButtonAction), for: .touchUpInside)
    }
    
    
    
}
