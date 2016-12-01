//
//  AddMarketExtension.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/30/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit


// MARK: Setup Labels and one button


extension AddMarketView {
    
    func setupHeaderLabel() {
        self.addSubview(headerLabel)
        
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
    }
    
    func setupNameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupAddressLabel() {
        self.addSubview(addressLabel)
        
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupOpenDateLabel() {
        self.addSubview(hoursOfOperationLabel)
        
        hoursOfOperationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        hoursOfOperationLabel.topAnchor.constraint(equalTo: self.addressTextField.bottomAnchor, constant: 10).isActive = true
    }
    
    func setupBeginningOfSeasonLabel() {
        self.addSubview(beginningOfSeasonLabel)
        
        beginningOfSeasonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        beginningOfSeasonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationButton.bottomAnchor, constant: 10).isActive = true
    }
    
    
    func setupOpenButtonLabel() {
        self.addSubview(openTimeButtonLabel)
        
        openTimeButtonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationLabel.bottomAnchor, constant: 15).isActive = true
        openTimeButtonLabel.leadingAnchor.constraint(equalTo: hoursOfOperationButton.leadingAnchor).isActive = true
        openTimeButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
    }
    
    func setupCloseButtonLabel() {
        self.addSubview(closeTimeButtonLabel)
        
        closeTimeButtonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationLabel.bottomAnchor, constant: 15).isActive = true
        closeTimeButtonLabel.trailingAnchor.constraint(equalTo: hoursOfOperationButton.trailingAnchor).isActive = true
        closeTimeButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
    }
    
    func setupOpenDateButtonLabel() {
        self.addSubview(openDateButtonLabel)
        
        openDateButtonLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 15).isActive = true
        openDateButtonLabel.leadingAnchor.constraint(equalTo: beginningOfSeasonButton.leadingAnchor).isActive = true
        openDateButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
    }
    
    func setupCloseDateButtonLabel() {
        self.addSubview(closeDateButtonLabel)
        
        closeDateButtonLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 15).isActive = true
        closeDateButtonLabel.trailingAnchor.constraint(equalTo: beginningOfSeasonButton.trailingAnchor).isActive = true
        closeDateButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
    }
    
    func setupAcceptEBTLabel() {
        self.addSubview(acceptsEBTLabel)
        
        acceptsEBTLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonButton.bottomAnchor, constant: 10).isActive = true
        acceptsEBTLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        acceptsEBTLabel.leadingAnchor.constraint(equalTo: self.hoursOfOperationButton.leadingAnchor).isActive = true
    }
    
    func setupEBTCheckbox() {
        self.addSubview(ebtCheckbox)
        print("setupEBTCAlled")
        ebtCheckbox.centerYAnchor.constraint(equalTo: self.acceptsEBTLabel.centerYAnchor).isActive = true
        ebtCheckbox.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ebtCheckbox.leadingAnchor.constraint(equalTo: self.acceptsEBTLabel.trailingAnchor, constant: 10).isActive = true
        ebtCheckbox.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ebtCheckbox.addTarget(self, action: #selector(ebtCheckboxClicked), for: .touchUpInside)
    }
    
    func setupEBTCheckboxImage() {
        self.addSubview(checkboxImage)
        checkboxImage.centerYAnchor.constraint(equalTo: self.acceptsEBTLabel.centerYAnchor).isActive = true
        checkboxImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        checkboxImage.leadingAnchor.constraint(equalTo: self.acceptsEBTLabel.trailingAnchor, constant: 10).isActive = true
        checkboxImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupDayOfWeekLabel() {
        
    }
    
    
    
    func setupSubmitMarketButton() {
        self.addSubview(submitMarketButton)
        
        submitMarketButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitMarketButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        submitMarketButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitMarketButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
}


// MARK: Setup textfield

extension AddMarketView {
    
    func setupNameTextField() {
        self.addSubview(nameTextField)
        
        nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //nameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupAddressTextField() {
        self.addSubview(addressTextField)
        
        addressTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        addressTextField.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 5).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addressTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupHoursOfOperationButton() {
        self.addSubview(hoursOfOperationButton)
        
        hoursOfOperationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        hoursOfOperationButton.topAnchor.constraint(equalTo: self.hoursOfOperationLabel.bottomAnchor, constant: 5).isActive = true
        hoursOfOperationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        hoursOfOperationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        hoursOfOperationButton.addTarget(self, action: #selector(bringUpTimePicker), for: .touchUpInside)
    }
    
    func setupBeginningOfSeasonButton() {
        self.addSubview(beginningOfSeasonButton)
        
        beginningOfSeasonButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        beginningOfSeasonButton.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 5).isActive = true
        beginningOfSeasonButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beginningOfSeasonButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        beginningOfSeasonButton.addTarget(self, action: #selector(enterSeason), for: .touchUpInside)
    }
    
  
    
}


//    let openTimeTextField: UITextField = {
//        let field = UITextField()
//        field.placeholder = "Enter Open Time"
//        field.backgroundColor = UIColor.gray
//        field.layer.cornerRadius = 10
//        field.translatesAutoresizingMaskIntoConstraints = false
//
//        return field
//    }()
//
//    let closeTimeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Close time:"
//        label.textColor = UIColor.black
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()
//
//    let closeTimeTextField: UITextField = {
//        let field = UITextField()
//        field.placeholder = "Enter Close Time"
//        field.backgroundColor = UIColor.gray
//        field.layer.cornerRadius = 10
//        field.translatesAutoresizingMaskIntoConstraints = false
//
//        return field
//    }()


//    let openTimeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Hours of Operation"
//        label.textColor = UIColor.black
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        return label
//    }()





//    func setupOpenTimeLabel() {
//        self.addSubview(openTimeLabel)
//
//        openTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        openTimeLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 20).isActive = true
//        openTimeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }


//    func setupCloseTimeLabel() {
//        self.addSubview(closeTimeLabel)
//
//        closeTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        closeTimeLabel.topAnchor.constraint(equalTo: self.openTimeLabel.bottomAnchor, constant: 20).isActive = true
//        closeTimeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }






//    func setupOpenTimeTextField() {
//        self.addSubview(openTimeTextField)
//
//        openTimeTextField.leadingAnchor.constraint(equalTo: self.openTimeLabel.trailingAnchor, constant: 20).isActive = true
//        openTimeTextField.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 30).isActive = true
//        openTimeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        openTimeTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//    }
//
//    func setupCloseTimeTextField() {
//        self.addSubview(closeTimeTextField)
//
//        closeTimeTextField.leadingAnchor.constraint(equalTo: self.closeTimeLabel.trailingAnchor, constant: 20).isActive = true
//        closeTimeTextField.topAnchor.constraint(equalTo: self.openTimeLabel.bottomAnchor, constant: 30).isActive = true
//        closeTimeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        closeTimeTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//    }
