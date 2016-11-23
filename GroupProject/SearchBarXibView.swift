//
//  SearchBarViewCell.swift
//  mapKitTest
//
//  Created by Neill Perry on 11/22/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

protocol SearchDelegate: class {
    
    func search(address: String?, time: String?)
    
}

class SearchBarXibView: UIView {
    
    weak var searchDelegate: SearchDelegate!

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBAction func searchButton(_ sender: Any) {
        
        searchDelegate?.search(address: addressTextField.text, time: timeTextField.text)
    }
    
    @IBOutlet weak var advancedSearchLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        Bundle.main.loadNibNamed("SearchBar", owner: self, options: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(contentView)
    
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    
    }
    
    
    
}




























