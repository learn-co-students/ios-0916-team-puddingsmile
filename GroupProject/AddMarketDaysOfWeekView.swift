//
//  AddMarketDaysOfWeekView.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/1/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

protocol DayOfWeekDelegate: class {
    
    func passClickedDay(tag: Int) -> String
    func doneButtonPressed(stringForFirebase: String, stringForDisplay: String)
}

class AddMarketDayOfWeek: UIView  {
    
    weak var delegate: DayOfWeekDelegate?
    
    var sundayChecked = false
    var mondayChecked = false
    var tuesdayChecked = false
    var wednesdayChecked = false
    var thursdayChecked = false
    var fridayChecked = false
    var saturdayChecked = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Setup Labels and buttons to be added to view that is animated onto screen when Days Of Week Open is pressed
    
    let sundayLabel: UILabel = {
        let label = UILabel()
        label.text = "Sun:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let sundayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        
        return button
    }()
    
    let sundayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let mondayLabel: UILabel = {
        let label = UILabel()
        label.text = "Mon:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let mondayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 2
        
        return button
    }()
    
    let mondayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tuesdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Tue:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tuesdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 3
        
        return button
    }()
    
    let tuesdayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let wednesdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Wed:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let wednesdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 4
        
        return button
    }()
    
    let wednesdayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let thursdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Th:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let thursdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 5
        
        return button
    }()
    
    let thursdayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let fridayLabel: UILabel = {
        let label = UILabel()
        label.text = "Fri:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let fridayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 6
        
        return button
    }()
    
    let fridayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let saturdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Sat:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let saturdayButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 7
        
        return button
    }()
    
    let saturdayImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uncheckedBox")
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.textColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    func buttonChanged(_ sender: UIButton) {
        print("flip called")
        let tag = sender.tag
        flipDay(tag: tag)
        delegate?.passClickedDay(tag: tag)
    }
    
    func doneButtonPressed() {
        //Create string that will be displayed to user
        //Create string that will be sent to Firebase
        print(sundayChecked, mondayChecked, tuesdayChecked, wednesdayChecked, thursdayChecked, fridayChecked, saturdayChecked)

        var daysCheckedArray = [String]()

        if sundayChecked {
            daysCheckedArray.append("Sunday")
            print("sunday checked")
        }
        if mondayChecked {
            daysCheckedArray.append("Monday")
            print("monday checked")
        }
        if tuesdayChecked {
            daysCheckedArray.append("Tuesday")
        }
        if wednesdayChecked {
            daysCheckedArray.append("Wednesday")
        }
        if thursdayChecked {
            daysCheckedArray.append("Thursday")
        }
        if fridayChecked {
            daysCheckedArray.append("Friday")
        }
        if saturdayChecked {
            daysCheckedArray.append("Saturday")
        }
        
        let firebaseDayArray = daysStringForFirebase(dayArray: daysCheckedArray)
        let displayDayArray = dayStringForUI(dayArray: daysCheckedArray)
        
        delegate?.doneButtonPressed(stringForFirebase: firebaseDayArray, stringForDisplay: displayDayArray)
    }
    
    func daysStringForFirebase(dayArray: [String]) -> String {
        if dayArray.isEmpty {
            print("ARRAY IS EMPTY")
            return ""
        }
        var dayString = ""
        for day in dayArray {
            dayString += "\(day)/"
        }
        dayString.remove(at: dayString.index(before: dayString.endIndex))
        return dayString
    }
    
    func dayStringForUI(dayArray: [String]) -> String {
        var dayString = ""
        if dayArray.isEmpty {
            print("ARRAY IS EMPTY")
            return ""
        }
        for day in dayArray {
            dayString += "\(day), "
        }
        dayString.remove(at: dayString.index(before: dayString.endIndex))
        dayString.remove(at: dayString.index(before: dayString.endIndex))
        
        return dayString
    }
    

    func flipDay(tag: Int) {
        switch tag {
        case 1:
            if sundayChecked {
                sundayImage.image = UIImage(named: "uncheckedBox")
                sundayChecked = false
            } else {
                sundayImage.image = UIImage(named: "checkedBox")
                sundayChecked = true
            }
        case 2:
            if mondayChecked {
                mondayImage.image = UIImage(named: "uncheckedBox")
                mondayChecked = false
            } else {
                mondayImage.image = UIImage(named: "checkedBox")
                mondayChecked = true
            }
        case 3:
            if tuesdayChecked {
                tuesdayImage.image = UIImage(named: "uncheckedBox")
                tuesdayChecked = false
            } else {
                tuesdayImage.image = UIImage(named: "checkedBox")
                tuesdayChecked = true
            }
        case 4:
            if wednesdayChecked {
                wednesdayImage.image = UIImage(named: "uncheckedBox")
                wednesdayChecked = false
            } else {
                wednesdayImage.image = UIImage(named: "checkedBox")
                wednesdayChecked = true
            }
        case 5:
            if thursdayChecked {
                thursdayImage.image = UIImage(named: "uncheckedBox")
                thursdayChecked = false
            } else {
                thursdayImage.image = UIImage(named: "checkedBox")
                thursdayChecked = true
            }
        case 6:
            if fridayChecked {
                fridayImage.image = UIImage(named: "uncheckedBox")
                fridayChecked = false
            } else {
                fridayImage.image = UIImage(named: "checkedBox")
                fridayChecked = true
            }
        case 7:
            if saturdayChecked {
                saturdayImage.image = UIImage(named: "uncheckedBox")
                saturdayChecked = false
            } else {
                saturdayImage.image = UIImage(named: "checkedBox")
                saturdayChecked = true
            }
        default:
            print("default")
        }
    }
    
}

extension AddMarketDayOfWeek {
    
    func setupSundayLabel() {
        self.addSubview(sundayLabel)
        self.addSubview(sundayImage)
        self.addSubview(sundayButton)
       
        sundayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        sundayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        sundayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sundayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        sundayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        sundayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        sundayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sundayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sundayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        sundayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        sundayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        sundayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sundayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupMondayLabel() {
        self.addSubview(mondayLabel)
        self.addSubview(mondayImage)
        self.addSubview(mondayButton)
        
        mondayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mondayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.375).isActive = true
        mondayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mondayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        mondayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mondayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.375).isActive = true
        mondayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mondayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mondayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        mondayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        mondayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.375).isActive = true
        mondayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mondayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupTuesdayLabel() {
        self.addSubview(tuesdayLabel)
        self.addSubview(tuesdayImage)
        self.addSubview(tuesdayButton)
        
        tuesdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        tuesdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.625).isActive = true
        tuesdayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tuesdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        tuesdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        tuesdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.625).isActive = true
        tuesdayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tuesdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        tuesdayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        tuesdayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        tuesdayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.625).isActive = true
        tuesdayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tuesdayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupWednesdayLabel() {
        self.addSubview(wednesdayLabel)
        self.addSubview(wednesdayImage)
        self.addSubview(wednesdayButton)
        
        wednesdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        wednesdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.875).isActive = true
        wednesdayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        wednesdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        wednesdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        wednesdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.875).isActive = true
        wednesdayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        wednesdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        wednesdayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        wednesdayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        wednesdayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.875).isActive = true
        wednesdayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        wednesdayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupThursdayLabel() {
        self.addSubview(thursdayLabel)
        self.addSubview(thursdayImage)
        self.addSubview(thursdayButton)
        
        thursdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        thursdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.25).isActive = true
        thursdayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thursdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        thursdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        thursdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.25).isActive = true
        thursdayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thursdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        thursdayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        thursdayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        thursdayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.25).isActive = true
        thursdayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thursdayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupFridayLabel() {
        self.addSubview(fridayLabel)
        self.addSubview(fridayImage)
        self.addSubview(fridayButton)
        
        fridayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        fridayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.5).isActive = true
        fridayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fridayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        fridayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        fridayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.5).isActive = true
        fridayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fridayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        fridayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        fridayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        fridayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.5).isActive = true
        fridayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fridayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupSaturdayLabel() {
        self.addSubview(saturdayLabel)
        self.addSubview(saturdayImage)
        self.addSubview(saturdayButton)
        
        saturdayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        saturdayLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.75).isActive = true
        saturdayLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saturdayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        saturdayButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        saturdayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.75).isActive = true
        saturdayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saturdayButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        saturdayButton.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        saturdayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 110).isActive = true
        saturdayImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.75).isActive = true
        saturdayImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saturdayImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupDoneButton() {
        self.addSubview(doneButton)
        
        doneButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        
    }
    
    
}























