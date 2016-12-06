//
//  ProposedMarket.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/6/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class ProposedMarketView: UIView {
    
    var addedMarketArray = [AddMarket]()
    
    var containerView: UIView!
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var timeLabel: UILabel!
    var dayLabel: UILabel!

    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setConstraints()
        print("view created")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setConstraints()
        print("decoder init")
    }
    
    func commonInit() {
        
        FirebaseAPI.pullAddedMarketFromFirebase { (addedMarket) in
            self.addedMarketArray = addedMarket
        }
        
        Bundle.main.loadNibNamed("AddedMarket", owner: self, options: nil)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        print("Right before we pull those markets")
        
        print("added market array in view is ===>\(self.addedMarketArray)")
        self.addSubview(self.contentView)
        
        self.containerView = UIView()
        self.contentView.addSubview(self.containerView)
        
        self.nameLabel = UILabel()
        self.containerView.addSubview(self.nameLabel)
        
        self.addressLabel = UILabel()
        self.containerView.addSubview(self.addressLabel)
        
        self.timeLabel = UILabel()
        self.containerView.addSubview(self.timeLabel)
        
        self.dayLabel = UILabel()
        self.containerView.addSubview(self.dayLabel)
    
    }
    
    func setConstraints() {
        //Content View
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.backgroundColor = UIColor.white
        
        //Container View
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.9).isActive = true
        containerView.layer.cornerRadius = 10
        
        let background: UIImage! = UIImage(named: "xibBackground.png")
        containerView.backgroundColor = UIColor(patternImage: background)
        
        //Name Label
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: 8)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: contentView.bounds.height * 0.2).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.25).isActive = true
        nameLabel.textAlignment = NSTextAlignment.center
        
        //Address Label
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.5).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        addressLabel.textAlignment = NSTextAlignment.center
        
        //Time Label
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.7).isActive = true
        timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.15).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.25).isActive = true
        
        //Day Label
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: self.bounds.height * 0.7).isActive = true
        dayLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.15).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.bounds.width * 0.6).isActive = true
    }
}













//extension ProposedMarketView {
//    
//    func setupContentViewLabel() {
//        print("Setup content view called")
//        contentView.addSubview(testLabel)
//        
//        testLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        testLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        testLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
//        testLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
//    }
//    
//    
//}











