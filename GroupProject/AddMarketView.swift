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
    
    var pickerViewTopAnchor: NSLayoutConstraint!
    var pickerViewWidthAnchor: NSLayoutConstraint!
    var pickerViewHeightAnchor: NSLayoutConstraint!
    var pickerViewCenterXAnchor: NSLayoutConstraint!
    
    func bringUpNewButton(_ sender: UITextField) {
        print("pressed")
        let datePicker = UIDatePicker()
        
        self.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.backgroundColor = UIColor.gray
        
        pickerViewTopAnchor = datePicker.topAnchor.constraint(equalTo: self.bottomAnchor)
        pickerViewTopAnchor.isActive = true
        
        pickerViewWidthAnchor = datePicker.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        pickerViewWidthAnchor.isActive = true
        
        pickerViewHeightAnchor = datePicker.heightAnchor.constraint(equalTo: self.widthAnchor, constant: 0.5)
        pickerViewHeightAnchor.isActive = true
        
        pickerViewCenterXAnchor = datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        pickerViewCenterXAnchor.isActive = true
        
        UIView.animate(withDuration: 1) {
            print("animating")
            self.pickerViewTopAnchor.isActive = false
            self.pickerViewWidthAnchor.isActive = false
            self.pickerViewHeightAnchor.isActive = false
            self.pickerViewCenterXAnchor.isActive = false

            self.pickerViewTopAnchor =
            
            datePicker.bottomAnchor.constraint(equalTo: self.submitMarketButton.topAnchor, constant: 10)
            datePicker.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            datePicker.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
            
            self.layoutIfNeeded()
        }
        
        
    
        
        datePicker.datePickerMode = UIDatePickerMode.time
        datePicker.minuteInterval = 15
        datePicker.locale = Locale.current
        datePicker.addTarget(self, action: #selector(dateDidChange), for: .valueChanged)
    }
    
    func dateDidChange(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        self.headerLabel.text = dateFormatter.string(from: sender.date)
        print("changing")
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






// MARK: - add date picker to the Date field

//@IBAction func dateTextfield(_ sender: UITextField) {
//    
//    let datePickerView:UIDatePicker = UIDatePicker()
//    sender.inputView = datePickerView
//    datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
//}
//
//func datePickerValueChanged(sender: UIDatePicker) {
//    
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateStyle = DateFormatter.Style.long
//    dateFormatter.timeStyle = .long
//    self.activityDate.text = dateFormatter.string(from: sender.date)
//    
//}
















