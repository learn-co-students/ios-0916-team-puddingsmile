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
        
        hereButton = UIButton(type: UIButtonType.system) as UIButton
        hereButton.titleLabel?.text = "Here"
        hereButton.setTitleColor(UIColor.red, for: .normal)
        
        moreButton = UIButton(type: UIButtonType.system) as UIButton
        moreButton.titleLabel?.text = "More"
        moreButton.setTitleColor(UIColor.green, for: .normal)
        
    }
    
    
    func addConstraints() {
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searchButton.topAnchor
        searchButton.heightAnchor.constraint(equalTo: self.frame.height * 0.1).isActive = true
        searchButton.widthAnchor
        
        self.hereButton.translatesAutoresizingMaskIntoConstraints = false
        hereButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hereButton.topAnchor
        hereButton.heightAnchor
        hereButton.widthAnchor
        
        self.moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        moreButton.topAnchor
        moreButton.heightAnchor
        moreButton.widthAnchor
        
    }
    
    
}
