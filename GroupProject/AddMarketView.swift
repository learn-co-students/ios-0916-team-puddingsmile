//
//  AddMarketView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddMarketView: UIView {

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
    
    let openDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Open Date:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let openDateTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Open Date"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let closeDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Close Date:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let closeDateTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Close Date"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let openTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Open Time:"
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
    
    func addMarketToFirebase() {
        print("Add market pressed")
        let nameText = nameTextField.text
        let addressText = addressTextField.text
        let openDateText = openDateTextField.text
        let closeDateText = closeDateTextField.text
        let openTimeText = openTimeTextField.text
        let closeTimeText = closeTimeTextField.text
        
        if nameText != "" && addressText != "" && openDateText != "" && closeDateText != "" && openTimeText != "" && closeTimeText != "" {
            print("not nil")
            FirebaseAPI.addMarketToFirebase(name: nameText!, address: addressText!, openDate: openDateText!, closeDate: closeDateText!, openTime: openTimeText!, closeTime: closeTimeText!)
            
        } else {
            print("nil")
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setupHeaderLabel()
        self.setupNameLabel()
        self.setupNameTextField()
        self.setupAddressLabel()
        self.setupAddressTextField()
        self.setupOpenDateLabel()
        self.setupOpenDateTextField()
        self.setupCloseDateLabel()
        self.setupCloseDateTextField()
        self.setupOpenTimeLabel()
        self.setupOpenTimeTextField()
        self.setupCloseTimeLabel()
        self.setupCloseTimeTextField()
        self.setupSubmitMarketButton()
        print("add market called")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

// MARK: Setup Labels and one button

extension AddMarketView {
    
    func setupHeaderLabel() {
        self.addSubview(headerLabel)
        
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupNameLabel() {
        self.addSubview(nameLabel)
        
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 30).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupAddressLabel() {
        self.addSubview(addressLabel)
        
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupOpenDateLabel() {
        self.addSubview(openDateLabel)
        
        openDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        openDateLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 20).isActive = true
        openDateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCloseDateLabel() {
        self.addSubview(closeDateLabel)
        
        closeDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        closeDateLabel.topAnchor.constraint(equalTo: self.openDateLabel.bottomAnchor, constant: 20).isActive = true
        closeDateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupOpenTimeLabel() {
        self.addSubview(openTimeLabel)
        
        openTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        openTimeLabel.topAnchor.constraint(equalTo: self.closeDateLabel.bottomAnchor, constant: 20).isActive = true
        openTimeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCloseTimeLabel() {
        self.addSubview(closeTimeLabel)
        
        closeTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        closeTimeLabel.topAnchor.constraint(equalTo: self.openTimeLabel.bottomAnchor, constant: 20).isActive = true
        closeTimeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSubmitMarketButton() {
        self.addSubview(submitMarketButton)
        
        submitMarketButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        submitMarketButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        submitMarketButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitMarketButton.addTarget(self, action: #selector(addMarketToFirebase), for: .touchUpInside)

    }
    
}

// MARK: Setup textfield

extension AddMarketView {
    
    func setupNameTextField() {
        self.addSubview(nameTextField)
        
        nameTextField.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 30).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupAddressTextField() {
        self.addSubview(addressTextField)
        
        addressTextField.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 20).isActive = true
        addressTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 30).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addressTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }

    func setupOpenDateTextField() {
        self.addSubview(openDateTextField)
        
        openDateTextField.leadingAnchor.constraint(equalTo: self.openDateLabel.trailingAnchor, constant: 20).isActive = true
        openDateTextField.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 30).isActive = true
        openDateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        openDateTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupCloseDateTextField() {
        self.addSubview(closeDateTextField)
        
        closeDateTextField.leadingAnchor.constraint(equalTo: self.closeDateLabel.trailingAnchor, constant: 20).isActive = true
        closeDateTextField.topAnchor.constraint(equalTo: self.openDateLabel.bottomAnchor, constant: 30).isActive = true
        closeDateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeDateTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupOpenTimeTextField() {
        self.addSubview(openTimeTextField)
        
        openTimeTextField.leadingAnchor.constraint(equalTo: self.openTimeLabel.trailingAnchor, constant: 20).isActive = true
        openTimeTextField.topAnchor.constraint(equalTo: self.closeDateLabel.bottomAnchor, constant: 30).isActive = true
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
    
    
}

extension UIView {
    
    func constrainEdges(to view: UIView) {
        
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
    }
    
    func constrainEdgesWithPadding(view: UIView, top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
        
        topAnchor.constraint(equalTo: view.topAnchor, constant: -top).isActive = true
        
        
    }
    
}






