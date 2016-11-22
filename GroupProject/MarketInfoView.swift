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

protocol MarketInfoDelegate {
    
}



class MarketInfo: UIView {
    
    var mapView: MKMapView!
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var boroughLabel: UILabel!
    var seasonLabel: UILabel!
    var daysLabel: UILabel!
    var timeLabel: UILabel!
    var ebtLabel: UILabel!
    var websiteButton: UIButton!
    var extrasLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.brown
        createLabels()
        loadContraints()
        loadLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLabels() {
        mapView = MKMapView()
        self.addSubview(mapView)
        
        scrollView = UIScrollView()
        self.addSubview(scrollView)
        stackView = UIStackView()
        scrollView.addSubview(stackView)
        scrollView.isPagingEnabled = false
     
        
        nameLabel = UILabel()
        stackView.addSubview(nameLabel)
        addressLabel = UILabel()
        stackView.addSubview(addressLabel)
        boroughLabel = UILabel()
        stackView.addSubview(boroughLabel)
        seasonLabel = UILabel()
        stackView.addSubview(seasonLabel)
        daysLabel = UILabel()
        stackView.addSubview(daysLabel)
        timeLabel = UILabel()
        stackView.addSubview(timeLabel)
        ebtLabel = UILabel()
        stackView.addSubview(ebtLabel)
        websiteButton = UIButton()
        stackView.addSubview(websiteButton)
        extrasLabel = UILabel()
        stackView.addSubview(extrasLabel)
    }
    

    
    func loadLabels() {
        print("colors")
        nameLabel.backgroundColor = UIColor.themeSand
        addressLabel.backgroundColor = UIColor.themeBrightBlue
        boroughLabel.backgroundColor = UIColor.themeMedBlue
        seasonLabel.backgroundColor = UIColor.themeDarkBlue
        daysLabel.backgroundColor = UIColor.themeTealBlue
        timeLabel.backgroundColor = UIColor.themeMedBlue
        ebtLabel.backgroundColor = UIColor.themeDarkBlue
        websiteButton.backgroundColor = UIColor.themeSand
        extrasLabel.backgroundColor = UIColor.themeDarkBlue
    }
    
}


//MARK: - Create Contraints
extension MarketInfo {
    func loadContraints() {
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.05).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.1).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.1).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.35).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: self.bounds.height * 0.05).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.1).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.1).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * 0.02).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 58 * 9).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: stackView.bounds.height * 0.02).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        boroughLabel.translatesAutoresizingMaskIntoConstraints = false
        boroughLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        boroughLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        boroughLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        boroughLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        seasonLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        seasonLabel.topAnchor.constraint(equalTo: boroughLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        seasonLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        seasonLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        daysLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        daysLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        daysLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        ebtLabel.translatesAutoresizingMaskIntoConstraints = false
        ebtLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        ebtLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        ebtLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        ebtLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        websiteButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: ebtLabel.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        websiteButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        extrasLabel.translatesAutoresizingMaskIntoConstraints = false
        extrasLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        extrasLabel.topAnchor.constraint(equalTo: websiteButton.bottomAnchor, constant: stackView.bounds.height * 0.04).isActive = true
        extrasLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.9).isActive = true
        extrasLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

    }
}
