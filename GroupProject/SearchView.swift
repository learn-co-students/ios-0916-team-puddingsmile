//
//  SearchView.swift
//  Flatiron Group Project
//
//  Created by Alexander Mason on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    lazy var hereButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Find Location Near Me"
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(findNearMe), for: .touchUpInside)
        return button
    }()
    
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Search"
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(searchForLocation), for: .touchUpInside)
        return button
    }()
    
    
    lazy var otherInfoButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Search"
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(otherInfo), for: .touchUpInside)
        return button
    }()
    
    
    func findNearMe() {
        
    }
    
    func searchForLocation() {
        
    }
    
    func otherInfo() {
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        setupHereButton()
        setupSearchButton()
        setupOtherInfo()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension SearchView {
    
    func setupHereButton() {
        self.addSubview(hereButton)
        hereButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        hereButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        hereButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hereButton.topAnchor.constraint(equalTo: self.centerYAnchor, constant: -100).isActive = true
    }
    
    func setupSearchButton() {
        self.addSubview(searchButton)
        searchButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: self.hereButton.topAnchor, constant: 40).isActive = true
    }
    
    func setupOtherInfo() {
        self.addSubview(otherInfoButton)
        otherInfoButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        otherInfoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        otherInfoButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        otherInfoButton.topAnchor.constraint(equalTo: self.searchButton.topAnchor, constant: 40).isActive = true
    }
    
}
