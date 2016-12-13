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

    var containerView: UIView!
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var timeLabel: UILabel!
    var dayLabel: UILabel!
    //var backgroundView: UIImageView!
    var background: UIImage!
    
    
    var market: Market!{
        didSet {
            if let displayName =  market.name {
                nameLabel.text = "\(displayName)"
            }
            if let displayAddress = market.address {
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
        
        addSubview(contentView)
        
        containerView = UIView()
        contentView.addSubview(containerView)
        
        var background = UIImage(named: "newXibBackground.png")
        containerView.backgroundColor = UIColor(patternImage: background!)
        
        nameLabel = UILabel()
        containerView.addSubview(nameLabel)
        
        addressLabel = UILabel()
        containerView.addSubview(addressLabel)
        
        timeLabel = UILabel()
        containerView.addSubview(timeLabel)
        
        dayLabel = UILabel()
        dayLabel.textAlignment = NSTextAlignment.left
        containerView.addSubview(dayLabel)
    }
    
    
    func setConstraints() {
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
        
        //let background: UIImage! = UIImage(named: "newXibBackground.png")
        
//        UIGraphicsBeginImageContext(containerView.frame.size)
//        UIImage(named: "newXibBackground.png")?.draw(in: containerView.bounds)
//        
//        let background = UIGraphicsGetImageFromCurrentImageContext()!
//        
//        UIGraphicsEndImageContext()
        
        //containerView.backgroundColor = UIColor(patternImage: backgroundView)
        
        //Name Label
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: 4)
        nameLabel.numberOfLines = 2
        nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.bounds.height * 0.1).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.45).isActive = true
        nameLabel.textAlignment = NSTextAlignment.center
        
        //Address Label
        addressLabel.font = UIFont.systemFont(ofSize: 15)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: contentView.bounds.height * 0.025).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.14).isActive = true
        addressLabel.textAlignment = NSTextAlignment.center
        
        //Time Label
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: contentView.bounds.height * 0.06).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.14).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.25).isActive = true
        
        //Day Label
        dayLabel.font = UIFont.systemFont(ofSize: 15)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: contentView.bounds.height * 0.06).isActive = true
        dayLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.14).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.5).isActive = true
    }
    
}
