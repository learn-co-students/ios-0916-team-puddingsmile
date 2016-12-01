//
//  AddMarketDaysOfWeekView.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/1/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

class AddMarketDayOfWeek: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        //setupSundayLabel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Setup Labels and buttons to be added to view that is animated onto screen when Days Of Week Open is pressed
    
    let sundayLabel: UILabel = {
        let label = UILabel()
        label.text = "Sun:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let sundayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let mondayLabel: UILabel = {
        let label = UILabel()
        label.text = "Mon:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let mondayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let tuesdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Tue:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tuesdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let wednesdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Wed:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let wednesdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let thursdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Th:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let thursdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let fridayLabel: UILabel = {
        let label = UILabel()
        label.text = "Fri:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let fridayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    func sundayChanged() {
        print("button works")
    }
    
    func mondayChanged() {
        
    }
    
    func tuesdayChanged() {
        
    }
    
    func wednesdayChanged() {
        
    }
    
    func thursdayChanged() {
        print("thursday working")
    }
    
    
}

extension AddMarketDayOfWeek {
    
    func setupSundayLabel() {
        self.addSubview(sundayLabel)
        self.addSubview(sundayButton)
       
        sundayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        sundayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        sundayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sundayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        sundayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        sundayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        sundayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sundayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sundayButton.addTarget(self, action: #selector(sundayChanged), for: .touchUpInside)
    }
    
    func setupMondayLabel() {
        self.addSubview(mondayLabel)
        self.addSubview(mondayButton)
        
        mondayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mondayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.375).isActive = true
        mondayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mondayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        mondayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mondayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.375).isActive = true
        mondayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mondayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mondayButton.addTarget(self, action: #selector(mondayChanged), for: .touchUpInside)
    }
    
    func setupTuesdayLabel() {
        self.addSubview(tuesdayLabel)
        self.addSubview(tuesdayButton)
        
        tuesdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        tuesdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.625).isActive = true
        tuesdayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tuesdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        tuesdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        tuesdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.625).isActive = true
        tuesdayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tuesdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        tuesdayButton.addTarget(self, action: #selector(tuesdayChanged), for: .touchUpInside)
    }
    
    func setupWednesdayLabel() {
        self.addSubview(wednesdayLabel)
        self.addSubview(wednesdayButton)
        
        wednesdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        wednesdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.875).isActive = true
        wednesdayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        wednesdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        wednesdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        wednesdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.875).isActive = true
        wednesdayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        wednesdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        wednesdayButton.addTarget(self, action: #selector(wednesdayChanged), for: .touchUpInside)
    }
    
    func setupThursdayLabel() {
        self.addSubview(thursdayLabel)
        self.addSubview(thursdayButton)
        
        thursdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        thursdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.25).isActive = true
        thursdayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        thursdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        thursdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        thursdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.25).isActive = true
        thursdayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        thursdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        thursdayButton.addTarget(self, action: #selector(thursdayChanged), for: .touchUpInside)
    }
    
    func setupFridayLabel() {
        self.addSubview(fridayLabel)
        self.addSubview(fridayButton)
        
        fridayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        fridayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.5).isActive = true
        fridayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fridayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        fridayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        fridayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.5).isActive = true
        fridayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fridayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        fridayButton.addTarget(self, action: #selector(thursdayChanged), for: .touchUpInside)
    }
    
    
}


















