//
//  AddMarketView.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

protocol AddMarketViewDelegate: class {
    
    func presentAlertController()
    func backButtonAction()
    
}

class AddMarketView: UIView, TimePickerDelegate, MarketDateDelegate, DayOfWeekDelegate, UITextFieldDelegate {
    
    weak var delegate: AddMarketViewDelegate?
    
    var addView: AddMarketPicker!
    var addDateView: AddMarketDatePicker!
    var addMarketDayView: AddMarketDayOfWeek!
    var addViewUp = false
    var addDateUp = false
    
    var marketName: String?
    var marketAddress: String?
    var marketStreetAddress: String?
    var marketCity: String?
    var websiteAddress: String?
    var openTime: String?
    var closeTime: String?
    var openDate: String?
    var closeDate: String?
    var firebaseDayString: String?
    var acceptsEBT = false
    var ebtString = ""
    var latString: String!
    var longString: String!
    var addressIsAcceptable = false
  
    let backButton = UIButton()
    
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
        label.setToTheme()
        return label
    }()
    
    let nameTextField: UITextField = {
        let field = UITextField()
        //field.placeholder = "Enter Name"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        field.setToTheme(string: "Enter Name")
        field.textAlignment = .center
        
        return field
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Street Address and City:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let addressTextField: UITextField = {
        let field = UITextField()
        //field.placeholder = "Enter Street Address"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        field.setToTheme(string: "Enter Street Address")
        field.textAlignment = .center
        
        return field
    }()
    
    let hoursOfOperationLabel: UILabel = {
        let label = UILabel()
        label.text = "Hours of Operation:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let hoursOfOperationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter Hours of Operation", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setToTheme()
        
        return button
    }()

    let beginningOfSeasonLabel: UILabel = {
        let label = UILabel()
        label.text = "Beginning of Season:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let beginningOfSeasonButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter Beginning Of Season", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setToTheme()
        
        return button
    }()
    
    let submitMarketButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit New Market", for: .normal)
        button.backgroundColor = UIColor.themeAccent2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.themeAccent1.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    let openTimeButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Open"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let closeTimeButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Close"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let openDateButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Open"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let closeDateButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Close"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let acceptsEBTLabel: UILabel = {
        let label = UILabel()
        label.text = "Accepts EBT:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let ebtCheckbox: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setToTheme()
        
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
        label.setToTheme()
        return label
    }()
    
    let daysOfWeekButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter Days of Week", for: .normal)
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setToTheme()
        
        return button
    }()
    
    let websiteLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Website:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
        return label
    }()
    
    let websiteTextField: UITextField = {
        let field = UITextField()
        //field.placeholder = "Enter Website"
        field.backgroundColor = UIColor.gray
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textAlignment = .center
        field.setToTheme(string: "Enter Website")
        
        return field
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Zip Code:"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme()
    
        return label
    }()
    
    let cityTextField: UITextField = {
        let label = UITextField()
        //label.placeholder = "Enter City"
        label.backgroundColor = UIColor.gray
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setToTheme(string: "Enter Zip Code")
        label.textAlignment = .center
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupAddMarketView()
        self.backgroundColor = UIColor.themeTertiary
        nameTextField.delegate = self
        addressTextField.delegate = self
        websiteTextField.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -When user taps on screen when time picker or date picker are up, will dismiss
    
    func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPickerView))
        self.addGestureRecognizer(tapGesture)
    }
    
    func dismissPickerView() {
        
        if addViewUp == true {
            UIView.animate(withDuration: 0.25, animations: {
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
    
    //MARK: -Set time of open and close date

    func stringInfoDelegateOpen(time: String) {
        openTime = time
        openTimeButtonLabel.text = "Open Time: \(time)"
    }
    
    func stringInfoDelegateClose(time: String) {
        closeTime = time
        closeTimeButtonLabel.text = "Close Time: \(time)"
    }
    
    //MARK: -Bring up time picker when clicked
    
    func bringUpTimePicker(_ sender: UITextField) {
        print("pressed")
        addViewUp = true
        openTimeButtonLabel.isHidden = false
        closeTimeButtonLabel.isHidden = false
        
        hoursOfOperationButton.setTitle("", for: .disabled)
        hoursOfOperationButton.isEnabled = false
        
        addView = AddMarketPicker(frame: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: self.bounds.height * 0.3))
        self.addSubview(addView)
        addView.delegate = self
        
        addView.setupOpenTimeLabel()
        addView.setupCloseTimeLabel()
        addView.setupLeftPicker()
        addView.setupRightPicker()


        UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
            
            self.addView.center.y = self.bounds.height - self.addView.bounds.height * 0.5
            
        }, completion: nil)
    }
    
    //MARK: -Adjust open and close dates
    
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
    
    //MARK: -Bring up add date
    
    func enterSeason() {
        addDateUp = true
        openDateButtonLabel.isHidden = false
        closeDateButtonLabel.isHidden = false
        
        beginningOfSeasonButton.setTitle("", for: .disabled)
        beginningOfSeasonButton.isEnabled = false
        addDateView = AddMarketDatePicker(frame: CGRect(x: 0, y: self.bounds.height, width: self.bounds.width, height: self.bounds.height * 0.3))
        
        self.addSubview(addDateView)
        addDateView.delegate = self
        addDateView.setupOpenTimeLabel()
        addDateView.setupPicker()
        addDateView.setupNextDateButon()
        
        UIView.animate(withDuration: 0.25) {
            print("animating")
            self.addDateView.center.y = self.bounds.height - self.addDateView.bounds.height * 0.5
        }
        
    }
    
    //MARK: -Check or uncheck EBT Box
    
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
    
    //MARK: -Bring up days of week view
    
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

        
        UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
            print("date animating")
            
            self.addMarketDayView.center.y = self.bounds.height - self.addMarketDayView.bounds.height * 0.5
            
        }, completion: nil)
    }
    
    func doneButtonPressed(stringForFirebase: String, stringForDisplay: String) {
        firebaseDayString = stringForFirebase
        daysOfWeekButton.isEnabled = true
        daysOfWeekButton.setTitle(stringForDisplay, for: .normal)
        
        UIView.animate(withDuration: 0.25) {
            print("animating down")
            self.addMarketDayView.center.y = self.bounds.height + self.addMarketDayView.bounds.height * 0.5
        }
    }
    
    func submitNewMarketButtonClicked() {
        print("Add market pressed")
     
        guard let addressText = addressTextField.text else { return }
        
        if self.acceptsEBT {
            self.ebtString = "EBT"
        } else {
            self.ebtString = "_"
        }
        
        print("before location finder")
        self.marketName = self.nameTextField.text
        self.marketStreetAddress = self.addressTextField.text
        self.websiteAddress = self.websiteTextField.text
        self.marketCity = self.cityTextField.text
        
        self.checkForErrors()

        guard let unwrappedMarketStreetAddress = marketStreetAddress else { return }
        guard let unwrappedMarketCity = marketCity else { return }
        marketAddress = "\(unwrappedMarketStreetAddress) \(unwrappedMarketCity)"
        
        LocationFinder.sharedInstance.getLatLong(with: addressText) { (success, coordinateTuple) in
            
            if success {
                guard let unwrappedTuple = coordinateTuple else { return }
               
                self.latString = "\(unwrappedTuple.0)"
                self.longString = "\(unwrappedTuple.1)"
                
                if (self.marketName != nil || self.marketName != "") && (self.marketAddress != nil || self.marketAddress != "") && (self.websiteAddress != nil || self.websiteAddress != "") && self.openTime != nil && self.closeTime != nil && self.openDate != nil && self.closeDate != nil && self.firebaseDayString != nil && (self.firebaseDayString != nil || self.firebaseDayString != "") {
                    
                    FirebaseAPI.addMarketToFirebase(name: self.marketName!, address: self.marketAddress!, lat: self.latString, long: self.longString, openDate: self.openDate!, closeDate: self.closeDate!, openTime: self.openTime!, closeTime: self.closeTime!, acceptEBT: self.ebtString, days: self.firebaseDayString!, website: self.websiteAddress!)
                    
                    self.delegate?.presentAlertController()
                    
                } else {
                    
                }
                
            } else {
                
                self.checkForErrors()
                self.addressTextField.shake(count: 3, for: 0.15, withTranslation: 7)
                self.addressTextField.pulse(count: 1, for: 0.15, withTranslation: 5)
                
            }
        }
    }
    
    func backButtonAction() {
        delegate?.backButtonAction()
    }
    
    func checkForErrors() {
        if (self.marketName == nil || self.marketName == "") {
            print("shake called")
            self.nameTextField.shake(count: 3, for: 0.15, withTranslation: 7)
            self.nameTextField.pulse(count: 1, for: 0.15, withTranslation: 5)
        }
        
        if (self.websiteAddress == nil || self.websiteAddress == "") {
            print(websiteAddress)
            self.websiteTextField.shake(count: 3, for: 0.15, withTranslation: 7)
            self.websiteTextField.pulse(count: 1, for: 0.15, withTranslation: 5)
        }
        
        if openTime == nil || closeTime == nil {
            self.hoursOfOperationButton.shake(count: 3, for: 0.15, withTranslation: 7)
            self.hoursOfOperationButton.pulse(count: 1, for: 0.15, withTranslation: 5)
        }
        
        if openDate == nil || closeDate == nil {
            self.beginningOfSeasonButton.shake(count: 3, for: 0.15, withTranslation: 7)
            self.beginningOfSeasonButton.pulse(count: 1, for: 0.15, withTranslation: 5)
        }
        
        if firebaseDayString == nil {
            self.daysOfWeekButton.shake(count: 3, for: 0.15, withTranslation: 7)
            self.daysOfWeekButton.pulse(count: 1, for: 0.15, withTranslation: 5)
        }
        
        if (self.marketCity == nil || self.marketCity == "") {
            
            self.cityTextField.shake(count: 3, for: 0.15, withTranslation: 7)
            self.cityTextField.pulse(count: 3, for: 0.15, withTranslation: 7)
        }
        
    }

    
}


























