//
//  AddMarketDateView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

class AddMarketDatePicker: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        setupOpenTimeLabel()
        setupPicker()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter First Day of Season"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //clip to bounds to hide year
    let dayPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = UIDatePickerMode.date
        picker.locale = Locale.current
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let nextDateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.textColor = UIColor.blue
        
        return button
    }()
    
    
    func leftDateDidChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/d"

//        delegate?.stringInfoDelegateOpen(time: dateFormatter.string(from: sender.date))
        
    }
    
    func openDateDidChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/d"
        print("date changing")
//        delegate?.stringInfoDelegateClose(time: dateFormatter.string(from: sender.date))
    }
    
}

extension AddMarketDatePicker {
    
    func setupOpenTimeLabel() {
        self.addSubview(enterLabel)
        enterLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        enterLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        enterLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        enterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupPicker() {
        self.addSubview(dayPicker)
//        
//        dayPicker.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//        dayPicker.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        dayPicker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dayPicker.topAnchor.constraint(equalTo: self.enterLabel.bottomAnchor).isActive = true
        dayPicker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dayPicker.addTarget(self, action: #selector(openDateDidChange), for: .valueChanged)
    }
    
    
    
    
}
