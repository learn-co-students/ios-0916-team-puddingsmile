//
//  EditorBox.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/29/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

enum EditorState {
    case neutral, nameEdit, addressEdit, cityEdit, seasonEdit, daysEdit, timesEdit, ebtEdit
}

protocol EditorBoxDelegate: class {
    func editorBoxCancel()
}

class EditorBox: UIView {
    weak var delegate: EditorBoxDelegate!
    
    var editorState: EditorState = .neutral
    var marketChanges = EditorStore()
    var placeholderLabel: UILabel!
    
    //MARK: - TextField View
    var textFieldView: UIView!
    var textView: UITextView!
    
    //MARK: - DatePicker View
    var datePickerView: UIView!
    var datePicker: UIDatePicker!
    
    //MARK: - Day picker checkbox view
    var dayPickerView: UIView!
    var sunButton: UIButton!
    var monButton: UIButton!
    var tueButton: UIButton!
    var wedButton: UIButton!
    var thuButton: UIButton!
    var friButton: UIButton!
    var satButton: UIButton!
    
    //MARK: - ebt checkbox view
    
    var cancelButton: UIButton!
    var nextButton: UIButton!
    var doneButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeTertiary
        alpha = 0.9
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cancelButtonAction() {
        delegate.editorBoxCancel()
    }
    
    func nextButtonAction() {
        
    }
    
    func doneButtonAction() {
        
    }
}

//MARK: - State management
extension EditorBox {
    func setNeutralState() {
        manageHiddenViews(with: .neutral)
        placeholderLabel.text = "Press On A Field Below To Start Changing Them"
        textView.isUserInteractionEnabled = false
        textView.text = ""
    }
    func setNameEditState() {
        if editorState != .nameEdit {
            manageHiddenViews(with: .nameEdit)
            placeholderLabel.text = "Enter a new name for the market."
            textView.isUserInteractionEnabled = true
            textView.text = ""
        }
    }
    func setAddressEditState() {
        if editorState != .addressEdit {
            manageHiddenViews(with: .addressEdit)
            placeholderLabel.text = "Enter a new address for the market."
            textView.isUserInteractionEnabled = true
            textView.text = ""
        }
    }
    func setCityEditState() {
        if editorState != .cityEdit {
            manageHiddenViews(with: .cityEdit)
            placeholderLabel.text = "Enter a new city for the market."
            textView.isUserInteractionEnabled = true
            textView.text = ""
        }
    }
    
    func setSeasonEditState() {
        if editorState != .seasonEdit {
            manageHiddenViews(with: .seasonEdit)
            placeholderLabel.text = "Enter the season for the market."
            datePicker.datePickerMode = .date
        }
    }
    
    func setDaysEditState() {
        if editorState != .daysEdit {
            manageHiddenViews(with: .daysEdit)
            placeholderLabel.text = "Enter the days for the market."
        }
    }
    
    func setTimesEditState() {
        if editorState != .timesEdit {
            manageHiddenViews(with: .timesEdit)
            placeholderLabel.text = "Enter the times for the market."
            datePicker.datePickerMode = .time
        }
    }
    
    func setEBTEditState() {
        
    }
    
    func manageHiddenViews(with state: EditorState) {
        switch state {
        case .neutral:
            editorState = .neutral
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
        case .nameEdit:
            editorState = .nameEdit
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
        case .addressEdit:
            editorState = .addressEdit
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
        case .cityEdit:
            editorState = .cityEdit
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
        case .seasonEdit:
            editorState = .seasonEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = false
            dayPickerView.isHidden = true
        case .daysEdit:
            editorState = .daysEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = true
            dayPickerView.isHidden = false
        case .timesEdit:
            editorState = .timesEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = false
            dayPickerView.isHidden = true
        case .ebtEdit:
            editorState = .ebtEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = true
            dayPickerView.isHidden = false
        }
    }
    
}


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
        cancelButton = UIButton()
        self.addSubview(cancelButton)
        cancelButton.backgroundColor = UIColor.themeAccent1
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: self.frame.width * 0.2).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * -0.05).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func createNextButton() {
        nextButton = UIButton()
        self.addSubview(nextButton)
        nextButton.backgroundColor = UIColor.themeAccent1
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        
        nextButton.isHidden = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: self.frame.width * -0.2).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * -0.05).isActive = true
        nextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        nextButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }

    func createDoneButton() {
        doneButton = UIButton()
        self.addSubview(doneButton)
        doneButton.backgroundColor = UIColor.themeAccent1
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
        doneButton.isHidden = true
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: self.frame.width * -0.2).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: self.frame.height * 0.05).isActive = true
        doneButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        doneButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    func createPlaceholderLabel() {
        placeholderLabel = UILabel()
        self.addSubview(placeholderLabel)
        placeholderLabel.textAlignment = .center
        placeholderLabel.isUserInteractionEnabled = false
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
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
        textFieldView = UIView()
        self.addSubview(textFieldView)
        textFieldView.isHidden = false
    }
    func createTextView() {
        textView = UITextView()
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
        textView.heightAnchor.constraint(equalTo: textFieldView.heightAnchor, multiplier: 0.8).isActive = true
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
        datePickerView = UIView()
        self.addSubview(datePickerView)
        datePickerView.isHidden = true
    }
    
    func createDatePicker() {
        datePicker = UIDatePicker()
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
        dayPickerView = UIView()
        self.addSubview(dayPickerView)
        dayPickerView.isHidden = true
        
        dayPickerView.translatesAutoresizingMaskIntoConstraints = false
        dayPickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dayPickerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayPickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dayPickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
    }
    func createSunButton() {
        sunButton = UIButton()
        dayPickerView.addSubview(sunButton)
        sunButton.setTitle("Sun", for: .normal)
        sunButton.backgroundColor = UIColor.themeAccent2
        
        sunButton.translatesAutoresizingMaskIntoConstraints = false
        sunButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * -0.33).isActive = true
        sunButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        sunButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        sunButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createMonButton() {
        monButton = UIButton()
        dayPickerView.addSubview(monButton)
        monButton.setTitle("Mon", for: .normal)
        monButton.backgroundColor = UIColor.themeAccent2
        
        monButton.translatesAutoresizingMaskIntoConstraints = false
        monButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * -0.11).isActive = true
        monButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        monButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        monButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createTueButton() {
        tueButton = UIButton()
        dayPickerView.addSubview(tueButton)
        tueButton.setTitle("Tue", for: .normal)
        tueButton.backgroundColor = UIColor.themeAccent2
        
        tueButton.translatesAutoresizingMaskIntoConstraints = false
        tueButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.11).isActive = true
        tueButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        tueButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        tueButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createWedButton() {
        wedButton = UIButton()
        dayPickerView.addSubview(wedButton)
        wedButton.setTitle("Wed", for: .normal)
        wedButton.backgroundColor = UIColor.themeAccent2
        
        wedButton.translatesAutoresizingMaskIntoConstraints = false
        wedButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.33).isActive = true
        wedButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.28).isActive = true
        wedButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        wedButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createThuButton() {
        thuButton = UIButton()
        dayPickerView.addSubview(thuButton)
        thuButton.setTitle("Thur", for: .normal)
        thuButton.backgroundColor = UIColor.themeAccent2
        
        thuButton.translatesAutoresizingMaskIntoConstraints = false
        thuButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * -0.19).isActive = true
        thuButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.1).isActive = true
        thuButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        thuButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createFriButton() {
        friButton = UIButton()
        dayPickerView.addSubview(friButton)
        friButton.setTitle("Fri", for: .normal)
        friButton.backgroundColor = UIColor.themeAccent2
        
        friButton.translatesAutoresizingMaskIntoConstraints = false
        friButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.0).isActive = true
        friButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.1).isActive = true
        friButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        friButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
    func createSatButton() {
        satButton = UIButton()
        dayPickerView.addSubview(satButton)
        satButton.setTitle("Sat", for: .normal)
        satButton.backgroundColor = UIColor.themeAccent2
        
        satButton.translatesAutoresizingMaskIntoConstraints = false
        satButton.centerXAnchor.constraint(equalTo: dayPickerView.centerXAnchor, constant: bounds.width * 0.19).isActive = true
        satButton.centerYAnchor.constraint(equalTo: dayPickerView.centerYAnchor, constant: bounds.height * -0.1).isActive = true
        satButton.widthAnchor.constraint(equalTo: dayPickerView.widthAnchor, multiplier: 0.16).isActive = true
        satButton.heightAnchor.constraint(equalTo: dayPickerView.heightAnchor, multiplier: 0.2).isActive = true
    }
}









