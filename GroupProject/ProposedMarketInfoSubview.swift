//
//  ProposedMarketInfoSubview.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/7/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import MapKit

//MARK: - Create Subviews
extension ProposedMarketInfo {
    func createObjects() {
        createMapView()
        createNavigationView()
        createBackButton()
        createEditButton()
        createFavoriteButton()
        createDetailView()
        createNameButtonView()
        createAddressButtonView()
        createcityButtonView()
        createSeasonButtonView()
        createDaysButtonView()
        createTimeButtonView()
        createEBTButtonView()
        createWebsiteButtonView()
    }
    
        func createMapView() {
            mapView = MKMapView()
            self.addSubview(mapView)
            mapView.isUserInteractionEnabled = false
            mapView.layer.cornerRadius = 10
        }
        
        func createNavigationView() {
            navigationView = UIView()
            self.addSubview(navigationView)
            navigationView.backgroundColor = UIColor.themeTertiary
        }
        
        func createBackButton() {
            backButton = UIButton()
            navigationView.addSubview(backButton)
            backButton.setTitle("⬅", for: .normal)
            backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        }
        
        func createEditButton() {
            editButton = UIButton()
            navigationView.addSubview(editButton)
            editButton.setTitle("📝", for: .normal)
            //editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
            editButton.layer.borderColor = UIColor.red.cgColor
        }
        
        func createFavoriteButton() {
            favoriteButton = UIButton()
            navigationView.addSubview(favoriteButton)
            favoriteButton.setTitle("♥️", for: .normal)
            favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
            FirebaseAPI.hasFavorited(marketName: market.marketName!, isTrue: { isTrue in
                if isTrue {
                    
                    self.favoriteButton.isUserInteractionEnabled = false
                    self.favoriteButton.alpha = 0.5
                    
                } else {
                    
                    self.favoriteButton.isUserInteractionEnabled = true
                    
                }
            })
        }
        
        func createDetailView() {
            detailView = UIView()
            self.addSubview(detailView)
            detailView.backgroundColor = UIColor.themeSecondary
            detailView.layer.cornerRadius = 10
        }
        
        func createNameButtonView() {
            nameButton = UIButton()
            self.detailView.addSubview(nameButton)
            nameButton.isEnabled = false
            //        nameButton.addTarget(self, action: #selector(editNameAction), for: .touchUpInside)
            
            nameLabel = UILabel()
            self.detailView.addSubview(nameLabel)
            nameLabel.backgroundColor = UIColor.themeSecondary
            nameLabel.text = "Name: \(market.marketName!)"
            nameLabel.font = Constants.themeFont()
        }
        
        func createAddressButtonView() {
            addressButton = UIButton()
            self.detailView.addSubview(addressButton)
            addressButton.isEnabled = false
            //addressButton.addTarget(self, action: #selector(editAddressAction), for: .touchUpInside)
            
            addressLabel = UILabel()
            self.detailView.addSubview(addressLabel)
            addressLabel.backgroundColor = UIColor.themeSecondary
            addressLabel.text = "Address: \(market.address!)"
            addressLabel.font = Constants.themeFont()
        }
        
        func createcityButtonView() {
            cityButton = UIButton()
            self.detailView.addSubview(cityButton)
            cityButton.isEnabled = false
            //cityButton.addTarget(self, action: #selector(editCityAction), for: .touchUpInside)
            
            cityLabel = UILabel()
            self.detailView.addSubview(cityLabel)
            cityLabel.backgroundColor = UIColor.themeSecondary
            //cityLabel.text = "City: \(market.borough!)"
            cityLabel.font = Constants.themeFont()
        }
        
        func createSeasonButtonView() {
            seasonButton = UIButton()
            self.detailView.addSubview(seasonButton)
            seasonButton.isEnabled = false
            //seasonButton.addTarget(self, action: #selector(editSeasonAction), for: .touchUpInside)
            
            seasonLabel = UILabel()
            self.detailView.addSubview(seasonLabel)
            seasonLabel.backgroundColor = UIColor.themeSecondary
            seasonLabel.text = "Season: \(market.openDate!) - \(market.closeDate!)"
            seasonLabel.font = Constants.themeFont()
        }
        
        func createDaysButtonView() {
            daysButton = UIButton()
            self.detailView.addSubview(daysButton)
            daysButton.isEnabled = false
            //daysButton.addTarget(self, action: #selector(editDaysAction), for: .touchUpInside)
            
            daysLabel = UILabel()
            self.detailView.addSubview(daysLabel)
            daysLabel.backgroundColor = UIColor.themeSecondary
            daysLabel.text = "Days Open: \(market.days!)"
            daysLabel.font = Constants.themeFont()
        }
        
        func createTimeButtonView() {
            timeButton = UIButton()
            self.detailView.addSubview(timeButton)
            timeButton.isEnabled = false
            //timeButton.addTarget(self, action: #selector(editTimeAction), for: .touchUpInside)
            
            timeLabel = UILabel()
            self.detailView.addSubview(timeLabel)
            timeLabel.backgroundColor = UIColor.themeSecondary
            timeLabel.text = "Times Open: \(market.startTime!) - \(market.endTime!)"
            timeLabel.font = Constants.themeFont()
        }
        
        func createEBTButtonView() {
            ebtButton = UIButton()
            self.detailView.addSubview(ebtButton)
            ebtButton.isEnabled = false
            //ebtButton.addTarget(self, action: #selector(editEBTAction), for: .touchUpInside)
            
            ebtLabel = UILabel()
            self.detailView.addSubview(ebtLabel)
            ebtLabel.backgroundColor = UIColor.themeSecondary
            ebtLabel.text = "Accept EBT - \(market.ebt == "EBT" ? "True" : "False")"
            ebtLabel.font = Constants.themeFont()
        }
        
        func createWebsiteButtonView() {
            websiteButton = UIButton()
            self.detailView.addSubview(websiteButton)
            websiteButton.addTarget(self, action: #selector(startSafari), for: .touchUpInside)
            
            websiteLabel = UILabel()
            self.detailView.addSubview(websiteLabel)
            websiteLabel.backgroundColor = UIColor.themeSecondary
            websiteLabel.text = "Check out website"
            websiteLabel.textColor = UIColor.themePrimary
            websiteLabel.font = Constants.themeFont()
            websiteLabel.textAlignment = .center
        }
    
}

