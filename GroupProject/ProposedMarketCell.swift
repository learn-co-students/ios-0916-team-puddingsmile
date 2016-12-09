//
//  MarketTableViewCell.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketCell: UITableViewCell {
    
    var proposedMarket: ProposedMarketView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "marketCell")
        
        self.proposedMarket = ProposedMarketView(frame: self.contentView.bounds)
        self.contentView.addSubview(self.proposedMarket)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
