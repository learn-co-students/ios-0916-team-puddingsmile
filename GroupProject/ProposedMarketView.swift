//
//  ProposedMarket.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketView: UIView {

    @IBOutlet var contentView: UIView!
    
    let label: UILabel = {
        let label = UILabel()
        
        
        
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        print("view created")

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        print("decoder init")
    }
    
    func commonInit() {
        
        Bundle.main.loadNibNamed("AddedMarket", owner: self, options: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(contentView)
        
        print("Setting up contentView")

        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }

}










