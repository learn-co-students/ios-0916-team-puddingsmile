//
//  MarketInfoView.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation
import UIKit

class MarketInfo: UIView {
    
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var daysLabel: UILabel!
    var timeLabel: UILabel!
    var ebtLabel: UILabel!
    var websiteButton: UIButton!
    var infoLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.brown
        createLabels()
        loadContraints()
        loadLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLabels() {
        print("create")
        nameLabel = UILabel()
        self.addSubview(nameLabel)
        addressLabel = UILabel()
        self.addSubview(addressLabel)
        daysLabel = UILabel()
        self.addSubview(daysLabel)
        timeLabel = UILabel()
        self.addSubview(timeLabel)
        ebtLabel = UILabel()
        self.addSubview(ebtLabel)
        websiteButton = UIButton()
        self.addSubview(websiteButton)
        infoLabel = UILabel()
        self.addSubview(infoLabel)
    }
    
    func loadContraints() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.1).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.2).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        daysLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.3).isActive = true
        daysLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        daysLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.4).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        ebtLabel.translatesAutoresizingMaskIntoConstraints = false
        ebtLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        ebtLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.5).isActive = true
        ebtLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        ebtLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        websiteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.6).isActive = true
        websiteButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.05).isActive = true
        websiteButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.7).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.2).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
    }
    
    func loadLabels() {
        print("colors")
        nameLabel.backgroundColor = UIColor.blue
        addressLabel.backgroundColor = UIColor.blue
        daysLabel.backgroundColor = UIColor.blue
        timeLabel.backgroundColor = UIColor.blue
        ebtLabel.backgroundColor = UIColor.blue
        websiteButton.backgroundColor = UIColor.blue
        infoLabel.backgroundColor = UIColor.blue
    }
    
}
