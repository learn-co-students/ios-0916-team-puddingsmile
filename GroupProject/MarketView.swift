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

    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var timeLabel: UILabel!
    var dayLabel: UILabel!
    
    var market: Market!{
        didSet {
            if let displayName =  market.name{
                nameLabel.text = "\(displayName)"
            }
            if let displayAddress = market.address{
               addressLabel.text = "\(displayAddress)"
            }
            if let displayTime =  market.startTime {
                timeLabel.text = "\(displayTime)"
            }
            if let displayDay = market.weekDayOpen {
                dayLabel.text = "\(displayDay)"
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setConstraints() 
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MarketViewPrototype", owner: self, options: nil)
        
        contentView = UIView()
        addSubview(contentView)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(nameLabel)
        
        addressLabel = UILabel()
        contentView.addSubview(addressLabel)
        
        timeLabel = UILabel()
        contentView.addSubview(timeLabel)
        
        dayLabel = UILabel()
        contentView.addSubview(dayLabel)
    }
    
    
    func setConstraints() {

        //Content View
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        //Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * 0.02).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.01).isActive = true
        
        
        //Address Label
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * 0.05).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.01).isActive = true
        
        //Time Label
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * 0.07).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.01).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.1).isActive = true
        
        //Day Label
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * 0.07).isActive = true
        dayLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.01).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.6).isActive = true
    }


}
