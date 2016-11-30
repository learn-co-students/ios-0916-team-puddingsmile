//
//  AddMarketDateView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

protocol MarketDateDelegate: class {
    
    func openDateDelegate(date: String)
    func closeDateDelegate(date: String)
    
}

class AddMarketDatePicker: UIView {
    
    weak var delegate: MarketDateDelegate?
    var closeDate = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        setupOpenTimeLabel()
        setupPicker()
        setupNextDateButon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let enterLabel: UILabel = {
        let label = UILabel()
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
        button.setTitle("Next", for: .normal)
        button.titleLabel?.textColor = UIColor.blue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    func dateDidChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/d"
        print("date changing")
        if closeDate == false {
            delegate?.openDateDelegate(date: dateFormatter.string(from: sender.date))
        } else {
            delegate?.closeDateDelegate(date: dateFormatter.string(from: sender.date))
        }
    }
    
    func enterCloseDate() {
        enterLabel.text = "Enter Last Day of Season"
        closeDate = true
        
        nextDateButton.isEnabled = false
        nextDateButton.setTitle("", for: .disabled)
        nextDateButton.isHidden = true
    }
    
    func resetView() {
        nextDateButton.isEnabled = true
        nextDateButton.isHidden = false
        enterLabel.text = "Enter First Day of Season"
    }
    
}


extension AddMarketDatePicker {
    
    func setupOpenTimeLabel() {
        self.addSubview(enterLabel)
        
        enterLabel.text = "Enter First Day of Season"
        enterLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        enterLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        enterLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        enterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupPicker() {
        self.addSubview(dayPicker)

        dayPicker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dayPicker.topAnchor.constraint(equalTo: self.enterLabel.bottomAnchor).isActive = true
        dayPicker.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dayPicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
    }
    
    func setupNextDateButon() {
        self.addSubview(nextDateButton)
        
        nextDateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nextDateButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nextDateButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nextDateButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextDateButton.addTarget(self, action: #selector(enterCloseDate), for: .touchUpInside)
    }
    
    
    
}
