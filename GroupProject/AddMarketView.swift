//
//  AddMarketView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddMarketView: UIView, TimePickerDelegate, MarketDateDelegate, DayOfWeekDelegate {
        
    let addView = AddMarketPicker()
    let addDateView = AddMarketDatePicker()
    var addMarketDayView: AddMarketDayOfWeek!
    var addViewUp = false
    var addDateUp = false
    var acceptsEBT = false

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
    
    let openDateButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Open"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let closeDateButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Close"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let acceptsEBTLabel: UILabel = {
        let label = UILabel()
        label.text = "Accepts EBT:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let ebtCheckbox: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let checkboxImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "uncheckedBox")
        
        return image
    }()
    
    let dayOfWeekOpenLabel: UILabel = {
        let label = UILabel()
        label.text = "Days of Week Open: "
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let daysOfWeekButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter Days of Week", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
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
        self.setupOpenButtonLabel()
        self.setupCloseButtonLabel()
        self.setupGestureRecognizer()
        self.setupOpenDateButtonLabel()
        self.setupCloseDateButtonLabel()
        self.setupDaysOfWeekLabel()
        self.setupDaysOfWeekButton()
        //self.setupAcceptEBTLabel()
        //self.setupEBTCheckbox()
        //self.setupEBTCheckboxImage()
        
        
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
        
        if addViewUp == true {
            UIView.animate(withDuration: 1, animations: {
                print("in animate")
                
                self.viewTopAnchor.isActive = false
                
                self.viewTopAnchor = self.addView.topAnchor.constraint(equalTo: self.bottomAnchor)
                
                self.viewTopAnchor.isActive = true
                
                self.layoutIfNeeded()
                
            }) { (complete) in
                self.hoursOfOperationButton.setTitle("", for: .normal)
                self.hoursOfOperationButton.isEnabled = true
                self.addViewUp = false
            }
        }
        print(addViewUp)
        print("beforeAnimation")
        
        if addDateUp == true {
            UIView.animate(withDuration: 1, animations: {
                print("in animate")
                
                self.dateViewTopAnchor.isActive = false
                
                self.dateViewTopAnchor = self.addDateView.topAnchor.constraint(equalTo: self.bottomAnchor)
                
                self.dateViewTopAnchor.isActive = true
                
                self.layoutIfNeeded()
                
            }) { (complete) in
                self.beginningOfSeasonButton.setTitle("", for: .normal)
                self.beginningOfSeasonButton.isEnabled = true
                self.addDateUp = false
                self.addDateView.resetView()
                self.addDateView.closeDate = false
            }
        }
    }

    func stringInfoDelegateOpen(time: String) {
        openTimeButtonLabel.text = "Open Time: \(time)"
    }
    
    func stringInfoDelegateClose(time: String) {
        closeTimeButtonLabel.text = "Close Time: \(time)"
    }
    
    func bringUpTimePicker(_ sender: UITextField) {
        print("pressed")
        addViewUp = true
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
    
    var dateViewTopAnchor: NSLayoutConstraint!
    var dateViewWidthAnchor: NSLayoutConstraint!
    var dateViewHeightAnchor: NSLayoutConstraint!
    var dateViewCenterXAnchor: NSLayoutConstraint!
    
    func openDateDelegate(date: String) {
        print("open delegate")
        print("date is \(date)")
        openDateButtonLabel.text = "Open: \(date)"
    }
    
    func closeDateDelegate(date: String) {
        print("close delegate")
        print("date is \(date)")
        closeDateButtonLabel.text = "Close: \(date)"
    }
    
    func enterSeason() {
        self.addSubview(addDateView)
        addDateUp = true
        beginningOfSeasonButton.setTitle("", for: .disabled)
        beginningOfSeasonButton.isEnabled = false
        addDateView.delegate = self
        
        addDateView.translatesAutoresizingMaskIntoConstraints = false
        
        dateViewTopAnchor = addDateView.topAnchor.constraint(equalTo: self.bottomAnchor)
        dateViewTopAnchor.isActive = true
        
        dateViewWidthAnchor = addDateView.widthAnchor.constraint(equalTo: self.widthAnchor)
        dateViewWidthAnchor.isActive = true
        
        dateViewCenterXAnchor = addDateView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        dateViewCenterXAnchor.isActive = true
        
        dateViewHeightAnchor = addDateView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3)
        dateViewHeightAnchor.isActive = true
        
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            print("date animating")
            self.dateViewTopAnchor.isActive = false
            
            self.dateViewTopAnchor = self.addDateView.bottomAnchor.constraint(equalTo: self.submitMarketButton.topAnchor, constant: -10)
            
            self.dateViewTopAnchor.isActive = true
            
            self.layoutIfNeeded()
            
            
        }, completion: nil)
        
    }
    
    func ebtCheckboxClicked() {
        print("clicked")
        
        if !acceptsEBT {
            checkboxImage.image = UIImage(named: "checkedBox")
            acceptsEBT = true
        } else {
            checkboxImage.image = UIImage(named: "uncheckedBox")
            acceptsEBT = false
        }
    }
    
    var dayOfWeekViewTopAnchor: NSLayoutConstraint!
    var dayOfWeekViewWidthAnchor: NSLayoutConstraint!
    var dayOfWeekViewHeightAnchor: NSLayoutConstraint!
    var dayOfWeekViewCenterXAnchor: NSLayoutConstraint!
    

    
    func daysOfWeekButtonPressed() {
        print("days of week button pressed")
        daysOfWeekButton.isEnabled = false
        daysOfWeekButton.setTitle("", for: .disabled)
        addMarketDayView = AddMarketDayOfWeek(frame: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: self.bounds.height * 0.3))
        
        self.addSubview(addMarketDayView)
        addMarketDayView.delegate = self
        addMarketDayView.setupSundayLabel()
        addMarketDayView.setupMondayLabel()
        addMarketDayView.setupTuesdayLabel()
        addMarketDayView.setupWednesdayLabel()
        addMarketDayView.setupThursdayLabel()
        addMarketDayView.setupFridayLabel()
        addMarketDayView.setupSaturdayLabel()

        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            print("date animating")

            
            self.addMarketDayView.center.y = self.bounds.height - self.addMarketDayView.bounds.height * 0.75
            
            
        }, completion: nil)
    }
    
    func passClickedDay(tag: Int) -> String {
        print("DELEGATE clicked")
        return "Hey"
    }
    
    
}























