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
    }
}
