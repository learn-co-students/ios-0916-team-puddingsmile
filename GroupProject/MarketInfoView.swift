//
//  MarketInfoView.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SafariServices

protocol MarketInfoDelegate: class {
    //InfoView Functions
    func triggerBackSegue()
    func triggerCommentsSegue()
    func showSafariVC(url: URL)
    
    //EditorBox Functions
    func openAlert(title: String, message: String)
}

class MarketInfo: UIView {
    
    weak var delegate: MarketInfoDelegate!
    
    var market: Market!
    
    //MARK: - Map objects
    var mapView:    MKMapView!
    var marketPin:  MKMapItem!
    var locationManager: CLLocationManager!
    
    //MARK: - Navigation Objects
    var navigationView : UIView!
    
    var backButton:     UIButton!
    var editButton:     UIButton!
    var favoriteButton: UIButton!
    var commentsButton: UIButton!
    
    //MARK: - DetailView Objects
    var detailView:     UIView!
    
    var nameButton:     UIButton!
    var nameLabel:      UILabel!
    var addressButton:  UIButton!
    var addressLabel:   UILabel!
    var cityButton:     UIButton!
    var cityLabel:      UILabel!
    var seasonButton:   UIButton!
    var seasonLabel:    UILabel!
    var daysButton:     UIButton!
    var daysLabel:      UILabel!
    var timeButton:     UIButton!
    var timeLabel:      UILabel!
    var ebtButton:      UIButton!
    var ebtLabel:       UILabel!
    var websiteButton:  UIButton!
    var websiteLabel:   UILabel!
    
    //MARK: - Editor Objects
    var editorBox: EditorBox!
    var infoTableView: InfoTableView!
    var isEditingFields: Bool = false
    var isShowingTable: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themePrimary
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        if touch.y > bounds.height * 0.43 {
            //TODO: - Add proper logic after fixing bools
            if isEditingFields {
                endEditState()
                startTableState()
            } else if isShowingTable {
                endTableState()
                toggleEditButton(state: false)
            }
        }
    }
    
    func setupMarketInfoView(market: Market) {
        self.market = market
        createObjects()
        loadContraints()
        setupLocationManager()
        centerMapOnCurrentLocation()
        convertToMapItem()
        addAnnotationToMap()
        
    }
    
    func toggleButtons(state: Bool) {
        nameButton.isEnabled = state
        addressButton.isEnabled = state
        cityButton.isEnabled = state
        seasonButton.isEnabled = state
        daysButton.isEnabled = state
        timeButton.isEnabled = state
        ebtButton.isEnabled = state
    }
}

//MARK: - ButtonActions
extension MarketInfo {
    func backButtonAction() {
        self.infoTableView.isHidden = true
        self.editorBox.isHidden = true
        delegate.triggerBackSegue()
    }
    
    func editButtonAction() {
        if isShowingTable || isEditingFields {
            endTableState()
            endEditState()
            toggleEditButton(state: false)
        } else {
            startTableState()
            toggleEditButton(state: true)
        }
    }
    

    
    func labelSwitch() {
        if !editorBox.editorStore.hasValue() {
            resetOriginalLabels()
        }
        
        
    }
    
    func resetOriginalLabels() {
        nameLabel.text = "Name: \(market.name!)"
        nameLabel.backgroundColor = UIColor.themeSecondary
        addressLabel.text = "Address: \(market.address!)"
        addressLabel.backgroundColor = UIColor.themeSecondary
        cityLabel.text = "City: \(market.borough!)"
        cityLabel.backgroundColor = UIColor.themeSecondary
        seasonLabel.text = "Season: \(market.openDate!) - \(market.closeDate!)"
        seasonLabel.backgroundColor = UIColor.themeSecondary
        daysLabel.text = "Days Open: \(market.weekDayOpen!)"
        daysLabel.backgroundColor = UIColor.themeSecondary
        timeLabel.text = "Times Open: \(market.startTime!) - \(market.endTime!)"
        timeLabel.backgroundColor = UIColor.themeSecondary
        ebtLabel.text = "Accept EBT - \(market.acceptEBT == "EBT" ? "True" : "False")"
        ebtLabel.backgroundColor = UIColor.themeSecondary
    }
    
    func favoriteButtonAction() {
        endTableState()
        endEditState()
    }
    
    func commentsButtonAction() {
        endTableState()
        endEditState()
        delegate.triggerCommentsSegue()
    }
    
    func startSafari() {
        if !isEditingFields && !isShowingTable {
            let url = URL(string: market.marketWebsite!)
            guard let uUrl = url else { return }
            delegate.showSafariVC(url: uUrl)
        }
    }
    
    func editNameAction() {
        if editorBox.editorState != .nameEdit {
            editorBox.setNameEditState()
        }
    }
    func editAddressAction(){
        if editorBox.editorState != .addressEdit {
            editorBox.setAddressEditState()
        }
    }
    func editCityAction(){
        if editorBox.editorState != .cityEdit {
            editorBox.setCityEditState()
        }
    }
    func editSeasonAction(){
        if editorBox.editorState != .seasonEdit {
            editorBox.setSeasonEditState()
        }
    }
    func editDaysAction(){
        if editorBox.editorState != .daysEdit {
            editorBox.setDaysEditState()
        }
    }
    func editTimeAction(){
        if editorBox.editorState != .timesEdit {
            editorBox.setTimesEditState()
        }
    }
    func editEBTAction(){
        if editorBox.editorState != .ebtEdit {
            editorBox.setEBTEditState()
        }
    }
    
    func editWebsiteAction(){}
}

//MARK: - Switching View States Methods
extension MarketInfo {
    func startTableState() {
        isShowingTable = true
        infoTableView.readForUpdates()
        showInfoTableView()
    }
    
    func endTableState() {
        isShowingTable = false
        resetOriginalLabels()
        hideInfoTableView()
    }
    
    func startEditState() {
        isEditingFields = true
        toggleButtons(state: true)
        editorBox.setNeutralState()
        showEditorBox()
    }
    
    func endEditState() {
        isEditingFields = false
        toggleButtons(state: false)
        labelSwitch()
        hideEditorBox()
    }
}



//MARK: - EditorBoxDelegate methods
extension MarketInfo {
    func editorBoxCancel() {
        endEditState()
        startTableState()
    }
    
    func editorBoxDone() {
        switch editorBox.editorState {
        case .neutral:
            //send to firebase
            return
        case .nameEdit:
            nameLabel.text = "Name: \(editorBox.editorStore.name!)"
            nameLabel.backgroundColor = UIColor.themePrimary
            return
        case .addressEdit:
            addressLabel.text = "Address: \(editorBox.editorStore.address!)"
            addressLabel.backgroundColor = UIColor.themePrimary
            return
        case .cityEdit:
            cityLabel.text = "City: \(editorBox.editorStore.city!)"
            cityLabel.backgroundColor = UIColor.themePrimary
            return
        case .seasonEdit:
            seasonLabel.text = "Season: \(editorBox.editorStore.startSeason!) - \(editorBox.editorStore.endSeason!)"
            seasonLabel.backgroundColor = UIColor.themePrimary
            return
        case .daysEdit:
            daysLabel.text = "Days Open: \(editorBox.editorStore.days!)"
            daysLabel.backgroundColor = UIColor.themePrimary
            return
        case .timesEdit:
            timeLabel.text = "Times Open: \(editorBox.editorStore.startTimes!) - \(editorBox.editorStore.endTimes!)"
            timeLabel.backgroundColor = UIColor.themePrimary
            return
        case .ebtEdit:
            return
        }
    }
    
}


//MARK: - InfoTableViewDelegate methods
extension MarketInfo {
    func sendMarketChanges(marketChanges: MarketChanges) {
        resetOriginalLabels()
        if let name = marketChanges.name {
            nameLabel.text = "Name: \(name)"
            nameLabel.backgroundColor = UIColor.themePrimary
        }
        if let address = marketChanges.address {
            addressLabel.text = "Address: \(address)"
            addressLabel.backgroundColor = UIColor.themePrimary
        }
        if let city = marketChanges.city {
            cityLabel.text = "City: \(city)"
            cityLabel.backgroundColor = UIColor.themePrimary
        }
        if let season = marketChanges.season {
            seasonLabel.text = "Season: \(season)"
            seasonLabel.backgroundColor = UIColor.themePrimary
        }
        if let days = marketChanges.days {
            daysLabel.text = "Days Open: \(days)"
            daysLabel.backgroundColor = UIColor.themePrimary
        }
        if let time = marketChanges.times {
            timeLabel.text = "Times Open: \(time)"
            timeLabel.backgroundColor = UIColor.themePrimary
        }
        if let ebt = marketChanges.ebt {
            ebtLabel.text = "Accept EBT - \(ebt)"
            ebtLabel.backgroundColor = UIColor.themePrimary
        }
    }
    
    func addNewMarketChange() {
        endTableState()
        startEditState()
        editorBox.setNeutralState()
    }
}











