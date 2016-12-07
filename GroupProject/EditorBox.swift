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
    case neutral, addressEdit, cityEdit, seasonEdit, daysEdit, timesEdit, ebtEdit
}

protocol EditorBoxDelegate: class {
    func editorBoxCancel()
    func editorBoxDone()
}

class EditorBox: UIView {
    weak var delegate: EditorBoxDelegate!
    weak var vcDelegate: MarketInfoDelegate!
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
        alpha = 0.95
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
            editorStore.startSeason = datePicker.date.getMonthDay
            print(datePicker.date.getMonthDay)
        case .timesEdit:
            nextButton.isHidden = true
            doneButton.isHidden = false
            editorStore.startTimes = datePicker.date.getHourMinute
            print(datePicker.date.getHourMinute)
        default:
            return
        }
    }
    
    func doneButtonAction() {
        switch editorState {
        case .neutral:
            
            //Need to test to make sure data isnt being reset too early, might need a completion
            delegate.editorBoxDone()
            editorStore.resetProperties()
            
//        case .nameEdit:
//            doneButton.isUserInteractionEnabled = false
//            if let name = textView.text {
//                if name != "" {
//                    editorStore.name = name
//                    delegate.editorBoxDone()
//                    setNeutralState()
//                } else {
//                    vcDelegate.openAlert(title: "Woops", message: "We need a name for this market.")
//                    doneButton.isUserInteractionEnabled = true
//                }
//            }
        case .addressEdit:
            doneButton.isUserInteractionEnabled = false
            if let address = textView.text {
                if address != "" {
                    LocationFinder.sharedInstance.getLatLong(with: address, completion: { (success, coord) in
                        if success {
                            self.editorStore.address = self.textView.text
                            self.editorStore.lat = "\(coord!.0)"
                            self.editorStore.long = "\(coord!.1)"
                            if self.editorState == .addressEdit {
                                self.delegate.editorBoxDone()
                                self.setNeutralState()
                            }
                        } else {
                            self.vcDelegate.openAlert(title: "Woops", message: "Address couldn't be read! \n Please try with another one.")
                            self.doneButton.isUserInteractionEnabled = true
                        }
                    })
                } else {
                    self.vcDelegate.openAlert(title: "Woops", message: "We need an address to function.")
                    self.doneButton.isUserInteractionEnabled = true
                }
            }

        case .cityEdit:
            doneButton.isUserInteractionEnabled = false
            if let city = textView.text {
                if city != "" {
                    editorStore.city = city
                    delegate.editorBoxDone()
                    setNeutralState()
                } else {
                    vcDelegate.openAlert(title: "Woops", message: "We need a name for this city.")
                    doneButton.isUserInteractionEnabled = true
                }
            }
        case .seasonEdit:
            doneButton.isUserInteractionEnabled = false
            editorStore.endSeason = datePicker.date.getMonthDay
            print(datePicker.date.getMonthDay)
            delegate.editorBoxDone()
            setNeutralState()
        case .daysEdit:
            doneButton.isUserInteractionEnabled = false
            let days = daysSelected()
            if days != "" {
                editorStore.days = days
                delegate.editorBoxDone()
                print(days)
                setNeutralState()
            } else {
                self.vcDelegate.openAlert(title: "Woops", message: "You need to select at least one day!")
                doneButton.isUserInteractionEnabled = true
            }
            
        case .timesEdit:
            doneButton.isUserInteractionEnabled = false
            editorStore.endTimes = datePicker.date.getHourMinute
            print(datePicker.date.getHourMinute)
            delegate.editorBoxDone()
            setNeutralState()
        case .ebtEdit:
            return
        }
    }
    
    func sunButtonAction() { sunButton.isSelected = sunButton.isSelected ? false : true }
    func monButtonAction() { monButton.isSelected = monButton.isSelected ? false : true }
    func tueButtonAction() { tueButton.isSelected = tueButton.isSelected ? false : true }
    func wedButtonAction() { wedButton.isSelected = wedButton.isSelected ? false : true }
    func thuButtonAction() { thuButton.isSelected = thuButton.isSelected ? false : true }
    func friButtonAction() { friButton.isSelected = friButton.isSelected ? false : true }
    func satButtonAction() { satButton.isSelected = satButton.isSelected ? false : true }
    
    func daysSelected() -> String {
        var tempString = ""
        if sunButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Sunday"
        }
        if monButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Monday"
        }
        if tueButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Tuesday"
        }
        if wedButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Wednesday"
        }
        if thuButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Thursday"
        }
        if friButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Friday"
        }
        if satButton.isSelected {
            if tempString != "" {
                tempString += "/"
            }
            tempString += "Saturday"
        }
        return tempString
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
        doneButton.isUserInteractionEnabled = true
        manageHiddenViews(with: .neutral)
        placeholderLabel.text = "Press On A Field Below To Start Changing Them"
        textView.isHidden = true
        textView.text = ""
        if editorStore.hasValue() {
            doneButton.isHidden = false
        }
    }
//    func setNameEditState() {
//        if editorState != .nameEdit {
//            manageHiddenViews(with: .nameEdit)
//            placeholderLabel.text = "Enter a new name for the market."
//            textView.isHidden = false
//            textView.text = ""
//        }
//    }
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
            sunButton.isSelected = false
            monButton.isSelected = false
            tueButton.isSelected = false
            wedButton.isSelected = false
            thuButton.isSelected = false
            friButton.isSelected = false
            satButton.isSelected = false
        }
    }
    
    func setTimesEditState() {
        if editorState != .timesEdit {
            manageHiddenViews(with: .timesEdit)
            placeholderLabel.text = "Enter the times for the market."
            datePicker.datePickerMode = .time
            datePicker.minuteInterval = 15
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
//        case .nameEdit:
//            editorState = .nameEdit
//            textFieldView.isHidden = false
//            datePickerView.isHidden = true
//            dayPickerView.isHidden = true
//            nextButton.isHidden = true
//            doneButton.isHidden = false
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












