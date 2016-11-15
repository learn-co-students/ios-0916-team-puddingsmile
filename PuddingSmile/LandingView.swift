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
        self.backgroundColor = UIColor.lightGray
        createButtons()
        loadConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButtons() {
        
        searchButton = UIButton()
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitleColor(UIColor.white, for: .normal)
        searchButton.backgroundColor = UIColor.darkGray
        self.addSubview(searchButton)
        
        hereButton = UIButton()
        hereButton.setTitle("Here", for: .normal)
        hereButton.setTitleColor(UIColor.white, for: .normal)
        hereButton.backgroundColor = UIColor.darkGray
        self.addSubview(hereButton)
        
        moreButton = UIButton()
        moreButton.setTitle("More", for: .normal)
        moreButton.setTitleColor(UIColor.white, for: .normal)
        moreButton.backgroundColor = UIColor.darkGray
        self.addSubview(moreButton)
    }
    
    
    func loadConstraints() {
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.1).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        self.hereButton.translatesAutoresizingMaskIntoConstraints = false
        hereButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        hereButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.3).isActive = true
        hereButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        hereButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
        self.moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1).isActive = true
        moreButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.5).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: self.frame.height * 0.1).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        
    }
    
    
}
