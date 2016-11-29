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
    var nameLabel: UILabel!
    var commentLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
       // setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        //setConstraints()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("DisplayComment", owner: self, options: nil)
        
        addSubview(contentView)
        
        containerView = UIView()
        contentView.addSubview(containerView)
        
        nameLabel = UILabel()
        containerView.addSubview(nameLabel)
        
        commentLabel = UILabel()
        containerView.addSubview(commentLabel)

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
    }
    
    
    
}
