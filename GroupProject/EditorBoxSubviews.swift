//
//  EditorBoxConstraints.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/2/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Create subview objects
extension EditorBox {
    func createObjects() {
        setupTextFieldview()
        setupDatePickerView()
        setupDayPickerView()
        
        createPlaceholderLabel()
        createCancelButton()
        createNextButton()
        createDoneButton()
    }
    
    func createCancelButton() {
        self.addSubview(cancelButton)
        cancelButton.backgroundColor = UIColor.themeAccent1
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setToTheme()
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.frame.width * 0.25).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * -0.05).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true
    }
    
    func createNextButton() {
        self.addSubview(nextButton)
        nextButton.backgroundColor = UIColor.themeAccent1
        nextButton.setTitle("Next", for: .normal)
        nextButton.setToTheme()
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
        nextButton.isHidden = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: self.frame.width * -0.25).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * -0.05).isActive = true
        nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true
    }
    
    func createDoneButton() {
        self.addSubview(doneButton)
        doneButton.backgroundColor = UIColor.themeAccent1
        doneButton.setTitle("Done", for: .normal)
        doneButton.setToTheme()
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
        doneButton.isHidden = true
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: self.frame.width * -0.25).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * -0.05).isActive = true
        doneButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        doneButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true
    }
    func createPlaceholderLabel() {
        self.addSubview(placeholderLabel)
        placeholderLabel.textAlignment = .center
        placeholderLabel.setToTheme()
        placeholderLabel.isUserInteractionEnabled = false
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height * 0.02).isActive = true
        placeholderLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        placeholderLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
    
}


//MARK: - Create and setup for textfieldView
extension EditorBox {
    func setupTextFieldview() {
        createTextFieldView()
        createTextView()
        
        constrainTextFieldView()
        constrainTextView()
    }
    func createTextFieldView() {
        self.addSubview(textFieldView)
        textFieldView.isHidden = false
    }
    func createTextView() {
        textFieldView.addSubview(textView)
        textView.textAlignment = .center
    }
    
    
    func constrainTextFieldView() {
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textFieldView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textFieldView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        textFieldView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func constrainTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.centerXAnchor.constraint(equalTo: textFieldView.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: textFieldView.topAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: textFieldView.heightAnchor, multiplier: 0.5).isActive = true
        textView.widthAnchor.constraint(equalTo: textFieldView.widthAnchor, multiplier: 0.8).isActive = true
    }
    
}

//MARK: - Create and setup for datepickerview
extension EditorBox {
    func setupDatePickerView() {
        createDatePickerView()
        createDatePicker()
        
        constrainDatePickerView()
        constrainDatePicker()
    }
    
    func createDatePickerView() {
        self.addSubview(datePickerView)
        datePickerView.isHidden = true
    }
    
    func createDatePicker() {
        self.datePickerView.addSubview(datePicker)
        datePicker.datePickerMode = .time
        datePicker.setValue(UIColor.blue, forKeyPath: "textColor")
        
    }
    
    func constrainDatePickerView() {
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        datePickerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        datePickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        datePickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func constrainDatePicker() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: datePickerView.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: datePickerView.centerYAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalTo: datePickerView.heightAnchor).isActive = true
        datePicker.widthAnchor.constraint(equalTo: datePickerView.widthAnchor).isActive = true
        
    }
}




//MARK: - Create and setup for Day picker view
extension EditorBox {
    func setupDayPickerView() {
        createDayPickerView()
        createSunButton()
        createMonButton()
        createTueButton()
        createWedButton()
        createThuButton()
        createFriButton()
        createSatButton()
    }
    func createDayPickerView() {
        self.addSubview(dayPickerView)
        dayPickerView.isHidden = true
        
        dayPickerView.translatesAutoresizingMaskIntoConstraints = false
        dayPickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dayPickerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayPickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dayPickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    func createSunButton() {
        dayPickerView.addSubview(sunButton)
        sunButton.setTitle("Sun", for: .normal)
        sunButton.backgroundColor = UIColor.themeAccent1
        sunButton.setToTheme()
        
        sunButton.translatesAutoresizingMaskIntoConstraints = false
        sunButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * -0.33).isActive = true
        sunButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        sunButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        sunButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createMonButton() {
        dayPickerView.addSubview(monButton)
        monButton.setTitle("Mon", for: .normal)
        monButton.backgroundColor = UIColor.themeAccent1
        monButton.setToTheme()
        
        monButton.translatesAutoresizingMaskIntoConstraints = false
        monButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * -0.11).isActive = true
        monButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        monButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        monButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createTueButton() {
        dayPickerView.addSubview(tueButton)
        tueButton.setTitle("Tue", for: .normal)
        tueButton.backgroundColor = UIColor.themeAccent1
        tueButton.setToTheme()
        
        tueButton.translatesAutoresizingMaskIntoConstraints = false
        tueButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.11).isActive = true
        tueButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        tueButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        tueButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createWedButton() {
        dayPickerView.addSubview(wedButton)
        wedButton.setTitle("Wed", for: .normal)
        wedButton.backgroundColor = UIColor.themeAccent1
        wedButton.setToTheme()
        
        wedButton.translatesAutoresizingMaskIntoConstraints = false
        wedButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.33).isActive = true
        wedButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        wedButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        wedButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createThuButton() {
        dayPickerView.addSubview(thuButton)
        thuButton.setTitle("Thur", for: .normal)
        thuButton.backgroundColor = UIColor.themeAccent1
        thuButton.setToTheme()
        
        thuButton.translatesAutoresizingMaskIntoConstraints = false
        thuButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * -0.22).isActive = true
        thuButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.1).isActive = true
        thuButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        thuButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createFriButton() {
        dayPickerView.addSubview(friButton)
        friButton.setTitle("Fri", for: .normal)
        friButton.backgroundColor = UIColor.themeAccent1
        friButton.setToTheme()
        
        friButton.translatesAutoresizingMaskIntoConstraints = false
        friButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.0).isActive = true
        friButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.1).isActive = true
        friButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        friButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createSatButton() {
        dayPickerView.addSubview(satButton)
        satButton.setTitle("Sat", for: .normal)
        satButton.backgroundColor = UIColor.themeAccent1
        satButton.setToTheme()
        
        satButton.translatesAutoresizingMaskIntoConstraints = false
        satButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.22).isActive = true
        satButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.1).isActive = true
        satButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        satButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
}
