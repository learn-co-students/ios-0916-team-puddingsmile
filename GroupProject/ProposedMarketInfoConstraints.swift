//
//  ProposedMarketInfoConstraints.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/7/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation


extension ProposedMarketInfo {
    
    func loadContraints() {
        setMapViewConstraints()
        setNavigationViewConstraints()
        setBackConstraints()
        setFavoriteConstraints()
        setDetailViewConstraints()
        setNameConstraints()
        setAddressConstraints()
        setBoroughConstraints()
        setSeasonConstraints()
        setDaysConstraints()
        setTimeConstraints()
        setEBTConstraints()
        setWebsiteConstraints()
    }
    
    func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.08).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.05).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.05).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.35).isActive = true
    }
    
    func setNavigationViewConstraints() {
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.07).isActive = true
    }
    
    func setBackConstraints() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        backButton.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: self.bounds.width * 0.03).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
    
    func setFavoriteConstraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: self.bounds.height * 0.03).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: self.bounds.width * -0.03).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
    
    func setDetailViewConstraints() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        detailView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: self.bounds.height * 0.02).isActive = true
        detailView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * -0.02).isActive = true
    }
    
    func setNameConstraints() {
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        nameButton.topAnchor.constraint(equalTo: detailView.topAnchor, constant: detailView.bounds.height * 0.02).isActive = true
        nameButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        nameButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: detailView.bounds.height * 0.02).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        nameLabel.createBottomBorder(forView: nameLabel)
    }
    
    func setAddressConstraints() {
        addressButton.translatesAutoresizingMaskIntoConstraints = false
        addressButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        addressButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor).isActive = true
        addressButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        addressButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        addressLabel.createBottomBorder(forView: addressLabel)
    }
    
    func setBoroughConstraints() {
        cityButton.translatesAutoresizingMaskIntoConstraints = false
        cityButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        cityButton.topAnchor.constraint(equalTo: addressButton.bottomAnchor).isActive = true
        cityButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        cityButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        cityLabel.createBottomBorder(forView: cityLabel)
    }
    
    func setSeasonConstraints() {
        seasonButton.translatesAutoresizingMaskIntoConstraints = false
        seasonButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        seasonButton.topAnchor.constraint(equalTo: cityButton.bottomAnchor).isActive = true
        seasonButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        seasonButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        seasonLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        seasonLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        seasonLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        seasonLabel.createBottomBorder(forView: seasonLabel)
    }
    
    func setDaysConstraints() {
        daysButton.translatesAutoresizingMaskIntoConstraints = false
        daysButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        daysButton.topAnchor.constraint(equalTo: seasonButton.bottomAnchor).isActive = true
        daysButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        daysButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        daysLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor).isActive = true
        daysLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        daysLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        daysLabel.createBottomBorder(forView: daysLabel)
    }
    
    func setTimeConstraints() {
        timeButton.translatesAutoresizingMaskIntoConstraints = false
        timeButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        timeButton.topAnchor.constraint(equalTo: daysButton.bottomAnchor).isActive = true
        timeButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        timeButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        timeLabel.createBottomBorder(forView: timeLabel)
    }
    
    func setEBTConstraints() {
        ebtButton.translatesAutoresizingMaskIntoConstraints = false
        ebtButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        ebtButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        ebtButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        ebtButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        ebtLabel.translatesAutoresizingMaskIntoConstraints = false
        ebtLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        ebtLabel.topAnchor.constraint(equalTo: timeButton.bottomAnchor).isActive = true
        ebtLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        ebtLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        ebtLabel.createBottomBorder(forView: ebtLabel)
    }
    
    func setWebsiteConstraints() {
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        websiteButton.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
        
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        websiteLabel.centerXAnchor.constraint(equalTo: detailView.centerXAnchor).isActive = true
        websiteLabel.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor).isActive = true
        websiteLabel.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.9).isActive = true
        websiteLabel.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.12).isActive = true
    }
}

    
    
    
    
