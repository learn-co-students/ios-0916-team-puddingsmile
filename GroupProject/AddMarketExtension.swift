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
    
    func setupBackButton() {
        backButton.setImage(UIImage(named: "backIconPng"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.1).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.height * 0.035).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.035).isActive = true        
        
    }
    
    func setupHeaderLabel() {
        self.addSubview(headerLabel)
        
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
    func setupNameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 5).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupAddressLabel() {
        self.addSubview(addressLabel)
        
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 5).isActive = true
    }
    
    func setupOpenDateLabel() {
        self.addSubview(hoursOfOperationLabel)
        
        hoursOfOperationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        hoursOfOperationLabel.topAnchor.constraint(equalTo: self.websiteTextField.bottomAnchor, constant: 5).isActive = true
    }
    
    func setupBeginningOfSeasonLabel() {
        self.addSubview(beginningOfSeasonLabel)
        
        beginningOfSeasonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        beginningOfSeasonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationButton.bottomAnchor, constant: 5).isActive = true
    }
    
    
    func setupOpenButtonLabel() {
        self.addSubview(openTimeButtonLabel)
        
        openTimeButtonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationLabel.bottomAnchor, constant: 15).isActive = true
        openTimeButtonLabel.leadingAnchor.constraint(equalTo: hoursOfOperationButton.leadingAnchor, constant: 5).isActive = true
        openTimeButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
        openTimeButtonLabel.isHidden = true
    }
    
    func setupCloseButtonLabel() {
        self.addSubview(closeTimeButtonLabel)
        
        closeTimeButtonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationLabel.bottomAnchor, constant: 15).isActive = true
        closeTimeButtonLabel.trailingAnchor.constraint(equalTo: hoursOfOperationButton.trailingAnchor, constant: -5).isActive = true
        closeTimeButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
        closeTimeButtonLabel.isHidden = true
    }
    
    func setupOpenDateButtonLabel() {
        self.addSubview(openDateButtonLabel)
        
        openDateButtonLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 15).isActive = true
        openDateButtonLabel.leadingAnchor.constraint(equalTo: beginningOfSeasonButton.leadingAnchor, constant: 5).isActive = true
        openDateButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
        openDateButtonLabel.isHidden = true
    }
    
    func setupCloseDateButtonLabel() {
        self.addSubview(closeDateButtonLabel)
        
        closeDateButtonLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 15).isActive = true
        closeDateButtonLabel.trailingAnchor.constraint(equalTo: beginningOfSeasonButton.trailingAnchor, constant: -5).isActive = true
        closeDateButtonLabel.heightAnchor.constraint(equalToConstant: 20).isActive = false
        closeDateButtonLabel.isHidden = true
    }
    
    func setupAcceptEBTLabel() {
        self.addSubview(acceptsEBTLabel)
        
        acceptsEBTLabel.topAnchor.constraint(equalTo: self.daysOfWeekButton.bottomAnchor, constant: 5).isActive = true
        acceptsEBTLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        acceptsEBTLabel.leadingAnchor.constraint(equalTo: self.hoursOfOperationButton.leadingAnchor).isActive = true
    }
    
    func setupWebsiteLabel() {
        self.addSubview(websiteLabel)
        
        websiteLabel.topAnchor.constraint(equalTo: self.cityTextField.bottomAnchor, constant: 5).isActive = true
        websiteLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        websiteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        websiteLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupCityLabel() {
        self.addSubview(cityLabel)
        
        cityLabel.topAnchor.constraint(equalTo: self.addressTextField.bottomAnchor, constant: 5).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        cityLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupEBTCheckbox() {
        self.addSubview(ebtCheckbox)
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
    
    func setupDaysOfWeekLabel() {
        self.addSubview(dayOfWeekOpenLabel)
        dayOfWeekOpenLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonButton.bottomAnchor, constant: 5).isActive = true
//        dayOfWeekOpenLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dayOfWeekOpenLabel.leadingAnchor.constraint(equalTo: self.hoursOfOperationButton.leadingAnchor).isActive = true
    }
    
    
    func setupDaysOfWeekButton() {
        self.addSubview(daysOfWeekButton)
        
        daysOfWeekButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        daysOfWeekButton.topAnchor.constraint(equalTo: self.dayOfWeekOpenLabel.bottomAnchor, constant: 5).isActive = true
        daysOfWeekButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        daysOfWeekButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        daysOfWeekButton.addTarget(self, action: #selector(daysOfWeekButtonPressed), for: .touchUpInside)
    }
    
    
    func setupSubmitMarketButton() {
        self.addSubview(submitMarketButton)
        
        submitMarketButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitMarketButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        submitMarketButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitMarketButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        submitMarketButton.addTarget(self, action: #selector(submitNewMarketButtonClicked), for: .touchUpInside)
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
    
    func setupWebsiteTextField() {
        self.addSubview(websiteTextField)
        
        websiteTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        websiteTextField.topAnchor.constraint(equalTo: self.websiteLabel.bottomAnchor, constant: 5).isActive = true
        websiteTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        websiteTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupCityTextField() {
        self.addSubview(cityTextField)
        cityTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        cityTextField.topAnchor.constraint(equalTo: self.cityLabel.bottomAnchor, constant: 5).isActive = true
        cityTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cityTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.endEditing(true)
    }
    
}

extension AddMarketView {
    
    
    func setupAddMarketView() {
        self.setupBackButton()
        self.setupHeaderLabel()
        self.setupNameLabel()
        self.setupNameTextField()
        self.setupAddressLabel()
        self.setupAddressTextField()
        self.setupCityLabel()
        self.setupCityTextField()
        self.setupWebsiteLabel()
        self.setupWebsiteTextField()
        self.setupOpenDateLabel()
        self.setupHoursOfOperationButton()
        self.setupBeginningOfSeasonLabel()
        self.setupBeginningOfSeasonButton()
        self.setupOpenButtonLabel()
        self.setupCloseButtonLabel()
        self.setupGestureRecognizer()
        self.setupOpenDateButtonLabel()
        self.setupCloseDateButtonLabel()
        self.setupDaysOfWeekLabel()
        self.setupDaysOfWeekButton()
        self.setupAcceptEBTLabel()
        self.setupEBTCheckbox()
        self.setupEBTCheckboxImage()
        self.setupSubmitMarketButton()
    }
}


