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
        label.text = "Sun:"
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
    
    func sundayChanged() {
        print("button works")
    }
    
    func mondayChanged() {
        
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
        mondayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        mondayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mondayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        mondayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mondayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        mondayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mondayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mondayButton.addTarget(self, action: #selector(mondayChanged), for: .touchUpInside)
    }
    
    
    
    
}










//func setupAlternateSundayLabel() {
//    let dayView = DayAndButtonView()
//    self.addSubview(dayView)
//    dayView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
//    dayView.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
//    dayView.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    dayView.widthAnchor.constraint(equalToConstant: 40).isActive = true
//    dayView.setupCheckbox()
//    dayView.setupSundayLabel()
//}





//class DayAndButtonView: UIView {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let dayLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.black
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let checkboxButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("", for: .normal)
//        button.backgroundColor = UIColor.black
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        return button
//    }()
//    
//    
//    let checkboxImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "uncheckedBox")
//        
//        return image
//    }()
//    
//    func setupSundayLabel() {
//        self.addSubview(dayLabel)
//        dayLabel.text = "Sun:"
//        print("sunday label called")
//        dayLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//        dayLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//        dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        dayLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//    }
//    
//    func setupCheckbox() {
//        self.addSubview(checkboxButton)
//        checkboxButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//        checkboxButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//        checkboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        checkboxButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        
//        checkboxButton.addTarget(self, action: #selector(dayOfWeekChanged), for: .touchUpInside)
//    }
//    
//    
//}







