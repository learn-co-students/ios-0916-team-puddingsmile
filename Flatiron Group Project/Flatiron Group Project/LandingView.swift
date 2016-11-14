//
//  LandingView.swift
//  Flatiron Group Project
//
//  Created by Neill Perry on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation
import UIKit

class LandingView: UIView {
    
    var searchButton: UIButton!
    var hereButton: UIButton!
    var moreButton: UIButton!
    
    //searchButton.addTarget(self, action: "action:" forControlEvents.TouchUpInside)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButtons() {
        
        searchButton = UIButton(type: UIButtonType.system) as UIButton
        searchButton.titleLabel?.text = "Search"
        searchButton.setTitleColor(UIColor.blue, for: .normal)
        self.addSubview(searchButton)
        
        hereButton = UIButton(type: UIButtonType.system) as UIButton
        hereButton.titleLabel?.text = "Here"
        hereButton.setTitleColor(UIColor.red, for: .normal)
        self.addSubview(hereButton)
        
        moreButton = UIButton(type: UIButtonType.system) as UIButton
        moreButton.titleLabel?.text = "More"
        moreButton.setTitleColor(UIColor.green, for: .normal)
        self.addSubview(moreButton)
    }
    
    
    func addConstraints() {
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.2).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: self.frame.height * 0.8).isActive = true
        
        self.hereButton.translatesAutoresizingMaskIntoConstraints = false
        hereButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        hereButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.3).isActive = true
        hereButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        hereButton.widthAnchor.constraint(equalToConstant: self.frame.height * 0.8).isActive = true
        
        self.moreButton.translatesAutoresizingMaskIntoConstraints = false
        hereButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        hereButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.4).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: self.frame.height * 0.8).isActive = true
        
    }
    
    
}
