//
//  MarketView.swift
//  mapKitTest
//
//  Created by Neill Perry on 11/22/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit


class MarketView: UIView {
   
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var market: Market!{
        didSet {
            if let title =  market.title{
                infoLabel.text = "\(title)"
            }
            addressLabel.text = "\(market.address)"
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MarketView", owner: self, options: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }

}
