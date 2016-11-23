//
//  MarketCellTableViewCell.swift
//  mapKitTest
//
//  Created by Neill Perry on 11/22/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

class MarketTableCell: UITableViewCell {
    
    @IBOutlet weak var marketView: MarketView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "listToViewSegue" {
            let dest = segue.destination as! MarketInfoViewController
            if self.marketView.market != nil {
                dest.market = self.marketView.market
            } else {
                print("There is no value for market")
            }
            
        }
    }
    

}
