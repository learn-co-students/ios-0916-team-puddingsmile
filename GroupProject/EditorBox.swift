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
    
    var textFieldView: UIView!
    var datePickerView: UIView!
    var dayPickerView: UIView!
    
    var textView: UITextView!
    var datePicker: UIDatePicker!
    
    var cancelButton: UIButton!
    var nextButton: UIButton!
    var doneButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeTertiary
        alpha = 0.8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cancelButtonAction() {
        delegate.editorBoxCancel()
    }
    
    func nextButtonAction() {
        print(1)
    }
    
    func doneButtonAction() {
        print(1)
    }
}

//MARK: - Create subview objects
extension EditorBox {
    func createObjects() {
        setupTextFieldview()
        setupDatePickerView()
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
    }
    func constrainTextFieldView() {
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textFieldView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textFieldView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textFieldView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func constrainTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        textView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
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
        datePickerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        datePickerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        datePickerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
    }
    
    func constrainDatePicker() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: datePickerView.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: datePickerView.centerYAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalTo: datePickerView.heightAnchor, multiplier: 0.7).isActive = true
        datePicker.widthAnchor.constraint(equalTo: datePickerView.widthAnchor, multiplier: 0.7).isActive = true
        
    }
}









