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
    case textField, datePicker, dayPicker
}



class EditorBox: UIView {
    var editorState: EditorState = .datePicker
    
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Create subview objects
extension EditorBox {
    func createObjects() {
        setupTextFieldview()
        setupDatePickerView()
        
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
        textFieldView.isHidden = true
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
        textFieldView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func constrainTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        textView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
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
        datePickerView.backgroundColor = UIColor.cyan
        datePickerView.alpha = 0.6
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
        datePickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func constrainDatePicker() {
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.centerXAnchor.constraint(equalTo: datePickerView.centerXAnchor).isActive = true
        datePicker.centerYAnchor.constraint(equalTo: datePickerView.centerYAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalTo: datePickerView.heightAnchor, multiplier: 0.7).isActive = true
        datePicker.widthAnchor.constraint(equalTo: datePickerView.widthAnchor, multiplier: 0.7).isActive = true
        
    }
}









