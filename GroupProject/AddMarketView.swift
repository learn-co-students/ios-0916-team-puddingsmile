//
//  AddMarketView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddMarketView: UIView, TimePickerDelegate {
    
    let addView = AddMarketPicker()

    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Add a market:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let nameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Name"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let addressTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Address"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let hoursOfOperationLabel: UILabel = {
        let label = UILabel()
        label.text = "Hours of Operation:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let hoursOfOperationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter Hours of Operation", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    let beginningOfSeasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Beginning of Season:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let beginningOfSeasonButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter Beginning Of Season", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let openTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hours of Operation"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let openTimeTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Open Time"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let closeTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Close time:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let closeTimeTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Close Time"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let submitMarketButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit New Market", for: .normal)
        button.backgroundColor = UIColor.blue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let openTimeButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Open"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let closeTimeButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Close"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
//    func addMarketToFirebase() {
//        print("Add market pressed")
//        let nameText = nameTextField.text
//        let addressText = addressTextField.text
//        //let openDateText = openDateTextField.text
//        let closeDateText = closeDateTextField.text
//        let openTimeText = openTimeTextField.text
//        let closeTimeText = closeTimeTextField.text
//        
//        if nameText != "" && addressText != "" && openDateText != "" && closeDateText != "" && openTimeText != "" && closeTimeText != "" {
//            print("not nil")
//            FirebaseAPI.addMarketToFirebase(name: nameText!, address: addressText!, openDate: openDateText!, closeDate: closeDateText!, openTime: openTimeText!, closeTime: closeTimeText!)
//            
//        } else {
//            print("nil")
//        }
//        
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setupHeaderLabel()
        self.setupNameLabel()
        self.setupNameTextField()
        self.setupAddressLabel()
        self.setupAddressTextField()
        self.setupOpenDateLabel()
        self.setupHoursOfOperationButton()
        self.setupBeginningOfSeasonLabel()
        self.setupBeginningOfSeasonButton()
        self.setupOpenButtonLabel()
        self.setupCloseButtonLabel()
        self.setupGestureRecognizer()
        //self.setupOpenTimeLabel()
        //self.setupOpenTimeTextField()
        //self.setupCloseTimeLabel()
        //self.setupCloseTimeTextField()
        self.setupSubmitMarketButton()
        print("add market called")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewTopAnchor: NSLayoutConstraint!
    var viewWidthAnchor: NSLayoutConstraint!
    var viewHeightAnchor: NSLayoutConstraint!
    var viewCenterXAnchor: NSLayoutConstraint!
    
    func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPickerView))
        self.addGestureRecognizer(tapGesture)
    }
    
    func dismissPickerView() {
        

//        self.viewTopAnchor = self.addView.bottomAnchor.constraint(equalTo: self.submitMarketButton.topAnchor, constant: -10)
//        
//        viewWidthAnchor = addView.widthAnchor.constraint(equalTo: self.widthAnchor)
//        
//        viewCenterXAnchor = addView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//        
//        viewHeightAnchor = addView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
//        
        self.layoutIfNeeded()

        UIView.animate(withDuration: 1, animations: {
            print("in animate")
            self.viewTopAnchor.isActive = false
            
            self.viewTopAnchor = self.addView.topAnchor.constraint(equalTo: self.bottomAnchor)
            
            self.viewTopAnchor.isActive = true
            
            self.layoutIfNeeded()
            
        }) { (complete) in
            self.hoursOfOperationButton.isEnabled = true
        }
        
        
        
    }
    
    func stringInfoDelegateOpen(time: String) {
        openTimeButtonLabel.text = "Open Time: \(time)"
    }
    
    func stringInfoDelegateClose(time: String) {
        closeTimeButtonLabel.text = "Close Time: \(time)"
    }
    
    func bringUpNewButton(_ sender: UITextField) {
        print("pressed")
        hoursOfOperationButton.setTitle("", for: .disabled)
        hoursOfOperationButton.isEnabled = false
        
        self.addSubview(addView)
        addView.delegate = self
        
        addView.translatesAutoresizingMaskIntoConstraints = false
        
        viewTopAnchor = addView.topAnchor.constraint(equalTo: self.bottomAnchor)
        viewTopAnchor.isActive = true
        
        viewWidthAnchor = addView.widthAnchor.constraint(equalTo: self.widthAnchor)
        viewWidthAnchor.isActive = true
        
        viewCenterXAnchor = addView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        viewCenterXAnchor.isActive = true
        
        viewHeightAnchor = addView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        viewHeightAnchor.isActive = true
        
        
        self.layoutIfNeeded()


        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            
            self.viewTopAnchor.isActive = false
            
            self.viewTopAnchor = self.addView.bottomAnchor.constraint(equalTo: self.submitMarketButton.topAnchor, constant: -10)
            
            self.viewTopAnchor.isActive = true
            
            self.layoutIfNeeded()

            
        }, completion: nil)

    }
    
}

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
        //addressLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupOpenDateLabel() {
        self.addSubview(hoursOfOperationLabel)
        
        hoursOfOperationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        hoursOfOperationLabel.topAnchor.constraint(equalTo: self.addressTextField.bottomAnchor, constant: 10).isActive = true
        //openDateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupBeginningOfSeasonLabel() {
        self.addSubview(beginningOfSeasonLabel)
        
        beginningOfSeasonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        beginningOfSeasonLabel.topAnchor.constraint(equalTo: self.hoursOfOperationButton.bottomAnchor, constant: 10).isActive = true
        //beginningOfSeasonLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupOpenTimeLabel() {
        self.addSubview(openTimeLabel)
        
        openTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        openTimeLabel.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 20).isActive = true
        openTimeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCloseTimeLabel() {
        self.addSubview(closeTimeLabel)
        
        closeTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        closeTimeLabel.topAnchor.constraint(equalTo: self.openTimeLabel.bottomAnchor, constant: 20).isActive = true
        closeTimeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
    
    
    
    func setupSubmitMarketButton() {
        self.addSubview(submitMarketButton)
        
        submitMarketButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitMarketButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        submitMarketButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //submitMarketButton.addTarget(self, action: #selector(addMarketToFirebase), for: .touchUpInside)
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
        hoursOfOperationButton.addTarget(self, action: #selector(bringUpNewButton), for: .touchUpInside)
    }
    
    func setupBeginningOfSeasonButton() {
        self.addSubview(beginningOfSeasonButton)
        
        beginningOfSeasonButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        beginningOfSeasonButton.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 5).isActive = true
        beginningOfSeasonButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        beginningOfSeasonButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupOpenTimeTextField() {
        self.addSubview(openTimeTextField)
        
        openTimeTextField.leadingAnchor.constraint(equalTo: self.openTimeLabel.trailingAnchor, constant: 20).isActive = true
        openTimeTextField.topAnchor.constraint(equalTo: self.beginningOfSeasonLabel.bottomAnchor, constant: 30).isActive = true
        openTimeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        openTimeTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupCloseTimeTextField() {
        self.addSubview(closeTimeTextField)
        
        closeTimeTextField.leadingAnchor.constraint(equalTo: self.closeTimeLabel.trailingAnchor, constant: 20).isActive = true
        closeTimeTextField.topAnchor.constraint(equalTo: self.openTimeLabel.bottomAnchor, constant: 30).isActive = true
        closeTimeTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeTimeTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func createDatePicker() {
        
    }
}























