//
//  ProposedMarket.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketView: UIView {
    
    var addedMarketArray = [AddMarket]()
    
    var containerView = UIView()
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var timeLabel: UILabel!
    var dayLabel: UILabel!
    
    var addedMarket: AddMarket!{
        didSet {
            if let displayName =  addedMarket.marketName {
                nameLabel.text = "\(displayName)"
            }
            if let displayAddress = addedMarket.address {
                addressLabel.text = "\(displayAddress)"
            }
            if let displayTime =  addedMarket.startTime {
                timeLabel.text = "\(displayTime)"
            }
            if let displayDay = addedMarket.days {
                dayLabel.text = "\(displayDay)"
            }
        }
    }

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setConstraints()
        print("view created")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setConstraints()
        print("decoder init")
    }
    
    func commonInit() {
        
        self.addSubview(self.containerView)
        
        self.nameLabel = UILabel()
        self.containerView.addSubview(self.nameLabel)
        self.containerView.backgroundColor = UIColor.orange
        
        self.addressLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        self.containerView.addSubview(self.addressLabel)
        
        self.timeLabel = UILabel()
        self.containerView.addSubview(self.timeLabel)
        
        self.dayLabel = UILabel()
        self.containerView.addSubview(self.dayLabel)
    
    }
    
    func setConstraints() {
//        //Content View
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        contentView.backgroundColor = UIColor.white
        
        //Container View
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        containerView.layer.cornerRadius = 10
        
        let background: UIImage! = UIImage(named: "xibBackground.png")
        containerView.backgroundColor = UIColor(patternImage: background)
        
        //Name Label
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: 8)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.25).isActive = true
        nameLabel.textAlignment = NSTextAlignment.center
        
        //Address Label
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.15).isActive = true
        addressLabel.textAlignment = NSTextAlignment.center
        
        //Time Label
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.15).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        
        //Day Label
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10).isActive = true
        dayLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        dayLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.15).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
    }
}

















