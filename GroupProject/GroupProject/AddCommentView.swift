//
//  AddComment.swift
//  GroupProject
//
//  Created by Neill Perry on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddCommentView: UIView {

    @IBOutlet var contentView: UIView!
    var addCommentButton: UIButton!
    var cancelCommentButton: UIButton!
    var commentField: UITextField! 
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("DisplayComment", owner: self, options: nil)
        
        addSubview(contentView)
        
        addCommentButton = UIButton()
        cancelCommentButton = UIButton()
    }
}
