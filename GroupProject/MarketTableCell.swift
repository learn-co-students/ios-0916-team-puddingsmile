//
//  MarketCellTableViewCell.swift
//  mapKitTest
//
//  Created by Neill Perry on 11/22/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class MarketTableCell: UITableViewCell {
    
    var marketView: MarketView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "marketCell")
        
        marketView = MarketView(frame: self.bounds)
        self.addSubview(marketView)
        constrainThisMother()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrainThisMother() {
        
        marketView.translatesAutoresizingMaskIntoConstraints = false
        marketView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        marketView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        marketView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        marketView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        marketView = MarketView(frame: self.bounds)
        print("&&&&&&&&&&&&&&&&&&&&&&&&&")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
