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
    var editorStore = EditorStore()
    var placeholderLabel = UILabel()
    
    //MARK: - TextField View
    var textFieldView = UIView()
    var textView = UITextView()
    
    //MARK: - DatePicker View
    var datePickerView = UIView()
    var datePicker = UIDatePicker()
    
    //MARK: - Day picker checkbox view
    var dayPickerView = UIView()
    var sunButton = UIButton()
    var monButton = UIButton()
    var tueButton = UIButton()
    var wedButton = UIButton()
    var thuButton = UIButton()
    var friButton = UIButton()
    var satButton = UIButton()
    
    //MARK: - ebt checkbox view
    
    var cancelButton = UIButton()
    var nextButton = UIButton()
    var doneButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.themeTertiary
        alpha = 0.9
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cancelButtonAction() {
        if editorState != .neutral {
            setNeutralState()
        } else {
            print("leave")
            editorStore.resetProperties()
            delegate.editorBoxCancel()
        }
        
    }
    
    func nextButtonAction() {
        switch editorState {
        case .seasonEdit:
            nextButton.isHidden = true
            doneButton.isHidden = false
            editorStore.startSeason = "\(datePicker.date)"
        case .timesEdit:
            nextButton.isHidden = true
            doneButton.isHidden = false
            editorStore.startTimes = "\(datePicker.date)"
        default:
            return
        }
    }
    
    func doneButtonAction() {
        switch editorState {
        case .neutral:
            //call firebase function to push up, must check for geolocation
            delegate.editorBoxCancel()
        case .nameEdit:
            editorStore.name = textView.text
            setNeutralState()
        case .addressEdit:
            editorStore.address = textView.text
            setNeutralState()
        case .cityEdit:
            editorStore.city = textView.text
            setNeutralState()
        case .seasonEdit:
            editorStore.endSeason = "\(datePicker.date)"
            setNeutralState()
        case .daysEdit:
            
            setNeutralState()
        case .timesEdit:
            editorStore.endSeason = "\(datePicker.date)"
            setNeutralState()
        case .ebtEdit:
            return
        }
    }
    
    
    
    
    
    
    func textHasInput() -> Bool {
        if textView.text != "" {
            return true
        } else {
            return false
        }
    }
}

//MARK: - State management
extension EditorBox {
    func setNeutralState() {
        manageHiddenViews(with: .neutral)
        placeholderLabel.text = "Press On A Field Below To Start Changing Them"
        textView.isHidden = true
        textView.text = ""
        if editorStore.hasValue() {
            doneButton.isHidden = false
        }
    }
    func setNameEditState() {
        if editorState != .nameEdit {
            manageHiddenViews(with: .nameEdit)
            placeholderLabel.text = "Enter a new name for the market."
            textView.isHidden = false
            textView.text = ""
        }
    }
    func setAddressEditState() {
        if editorState != .addressEdit {
            manageHiddenViews(with: .addressEdit)
            placeholderLabel.text = "Enter a new address for the market."
            textView.isHidden = false
            textView.text = ""
        }
    }
    func setCityEditState() {
        if editorState != .cityEdit {
            manageHiddenViews(with: .cityEdit)
            placeholderLabel.text = "Enter a new city for the market."
            textView.isHidden = false
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
            nextButton.isHidden = true
            doneButton.isHidden = true
        case .nameEdit:
            editorState = .nameEdit
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
            nextButton.isHidden = true
            doneButton.isHidden = false
        case .addressEdit:
            editorState = .addressEdit
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
            nextButton.isHidden = true
            doneButton.isHidden = false
        case .cityEdit:
            editorState = .cityEdit
            textFieldView.isHidden = false
            datePickerView.isHidden = true
            dayPickerView.isHidden = true
            nextButton.isHidden = true
            doneButton.isHidden = false
        case .seasonEdit:
            editorState = .seasonEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = false
            dayPickerView.isHidden = true
            nextButton.isHidden = false
            doneButton.isHidden = true
        case .daysEdit:
            editorState = .daysEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = true
            dayPickerView.isHidden = false
            nextButton.isHidden = true
            doneButton.isHidden = false
        case .timesEdit:
            editorState = .timesEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = false
            dayPickerView.isHidden = true
            nextButton.isHidden = false
            doneButton.isHidden = true
        case .ebtEdit:
            editorState = .ebtEdit
            textFieldView.isHidden = true
            datePickerView.isHidden = true
            dayPickerView.isHidden = false
            nextButton.isHidden = true
            doneButton.isHidden = true
        }
    }
    
}












