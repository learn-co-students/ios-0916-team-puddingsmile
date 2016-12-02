//
//  AddMarketView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddMarketView: UIView, TimePickerDelegate, MarketDateDelegate, DayOfWeekDelegate {
        
    var addView: AddMarketPicker!
    var addDateView: AddMarketDatePicker!
    var addMarketDayView: AddMarketDayOfWeek!
    var addViewUp = false
    var addDateUp = false
    
    var marketName: String?
    var marketAddress: String?
    var openTime: String?
    var closeTime: String?
    var openDate: String?
    var closeDate: String?
    var firebaseDayString: String?
    var acceptsEBT = false
    var ebtString = ""
    var lat: Double?
    var long: Double?

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
    
    
    func addMarketToFirebase() {
        
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
        self.setupAcceptEBTLabel()
        self.setupEBTCheckbox()
        self.setupEBTCheckboxImage()
        
        
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
                
                self.addView.center.y = self.bounds.height + self.addView.bounds.height * 0.5
                
            }) { (complete) in
                self.hoursOfOperationButton.setTitle("", for: .normal)
                self.hoursOfOperationButton.isEnabled = true
                self.addViewUp = false
            }
        }
        print(addViewUp)
        print("beforeAnimation")
        
        if addDateUp == true {
            UIView.animate(withDuration: 0.25, animations: {
                print("in animate")
                self.addDateView.center.y = self.bounds.height + self.addDateView.bounds.height * 0.5
               
                
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
        openTime = time
        openTimeButtonLabel.text = "Open Time: \(time)"
    }
    
    func stringInfoDelegateClose(time: String) {
        closeTime = time
        closeTimeButtonLabel.text = "Close Time: \(time)"
    }
    
    func bringUpTimePicker(_ sender: UITextField) {
        print("pressed")
        addViewUp = true
        
        hoursOfOperationButton.setTitle("", for: .disabled)
        hoursOfOperationButton.isEnabled = false
        
        addView = AddMarketPicker(frame: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: self.bounds.height * 0.3))
        self.addSubview(addView)
        addView.delegate = self
        
        addView.setupOpenTimeLabel()
        addView.setupCloseTimeLabel()
        addView.setupLeftPicker()
        addView.setupRightPicker()


        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            
            self.addView.center.y = self.bounds.height - self.addView.bounds.height * 0.5
            
        }, completion: nil)
    }
    
    func openDateDelegate(date: String) {
        print("open delegate")
        print("date is \(date)")
        openDate = date
        openDateButtonLabel.text = "Open: \(date)"
    }
    
    func closeDateDelegate(date: String) {
        print("close delegate")
        print("date is \(date)")
        closeDate = date
        closeDateButtonLabel.text = "Close: \(date)"
    }
    
    func enterSeason() {
        addDateUp = true
        beginningOfSeasonButton.setTitle("", for: .disabled)
        beginningOfSeasonButton.isEnabled = false
        addDateView = AddMarketDatePicker(frame: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: self.bounds.height * 0.3))
        
        self.addSubview(addDateView)
        addDateView.delegate = self
        addDateView.setupOpenTimeLabel()
        addDateView.setupPicker()
        addDateView.setupNextDateButon()
        
        UIView.animate(withDuration: 0.5) {
            print("animating")
            self.addDateView.center.y = self.bounds.height - self.addDateView.bounds.height * 0.5
        }
        
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
        addMarketDayView.setupDoneButton()

        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            print("date animating")

            
            self.addMarketDayView.center.y = self.bounds.height - self.addMarketDayView.bounds.height * 0.5
            
            
        }, completion: nil)
    }
    
    func passClickedDay(tag: Int) -> String {
        print("DELEGATE clicked, tag is \(tag)")
//        flipDay(tag: tag)
        return "Hey"
    }
    
    func doneButtonPressed(stringForFirebase: String, stringForDisplay: String) {
        firebaseDayString = stringForFirebase
        daysOfWeekButton.isEnabled = true
        daysOfWeekButton.setTitle(stringForDisplay, for: .normal)
        
        UIView.animate(withDuration: 0.5) {
            print("animating down")
            self.addMarketDayView.center.y = self.bounds.height + self.addMarketDayView.bounds.height * 0.5
        }
    }
    
//    func submitNewMarketButtonClicked() {
//        print("Add market pressed")
//        let nameText = nameTextField.text
//        guard let addressText = addressTextField.text else { return }
//        var stringLat: String!
//        var stringLong: String!
//        
//        LocationFinder.sharedInstance.getLatLong(with: addressText) { (success, coordinateTuple) in
//            if success {
//                self.lat = coordinateTuple!.0
//                self.long = coordinateTuple!.1
//                print(self.lat)
//                print(self.long)
//            } else {
//                print("unacceptable address")
//            }
//        }
//        
//        
//        if acceptsEBT {
//            ebtString = "EBT"
//        } else {
//            ebtString = "_"
//        }
//        print(marketName)
//        print(marketAddress)
//        print(latString)
//        print(longString)
//        print(openTime)
//        print(closeTime)
//        print(openDate)
//        print(closeDate)
//        
//        if marketName != nil && marketAddress != nil && lat != nil && long != nil && openTime != nil && closeTime != nil && openDate != nil && closeDate != nil && firebaseDayString != nil {
//            FirebaseAPI.addMarketToFirebase(name: marketName!, address: marketAddress!, lat: latString, long: longString, openDate: openDate!, closeDate: closeDate!, openTime: openTime!, closeTime: closeTime!, acceptEBT: ebtString)
//            print("You sent data up succesfully, you're the fuckin man")
//            
//        } else {
//            print("NOT ACCEPTABLE!")
//        }
//
//    }
    
    
}























