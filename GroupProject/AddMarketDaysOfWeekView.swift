//
//  AddMarketDaysOfWeekView.swift
//  GroupProject
//
//  Created by Alexander Mason on 12/1/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

class AddMarketDayOfWeek: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        //setupSundayLabel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sundayLabel: UILabel = {
        let label = UILabel()
        label.text = "Sun:"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
}

extension AddMarketDayOfWeek {
    
    func setupSundayLabel() {
        self.addSubview(sundayLabel)
        print("setting up")
        //self.width * 0.125
        print(self.bounds.width)
        print(self.widthAnchor)
        sundayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        sundayLabel.centerXAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.125).isActive = true
        sundayLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sundayLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        print(self.bounds.width)

    }

}





