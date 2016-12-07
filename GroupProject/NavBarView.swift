//
//  NavBarView.swift
//  GroupProject
//
//  Created by Neill Perry on 12/7/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit


protocol NavBarViewDelegate: class {
    func triggerSearchSegue()
}

class NavBarView: UIView {

    //MARK: - Properties
    var searchButton: UIButton!
    weak var delegate: NavBarViewDelegate!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit() {
        createLayout()
        loadConstraints()
    }

    func createLayout() {
        searchButton = UIButton()
        let searchImage: UIImage! = UIImage(named: "searchImage.png")
        searchButton.backgroundColor = UIColor(patternImage: searchImage)
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        self.addSubview(searchButton)
    }
    
    func loadConstraints() {
        
    }
    
    func searchButtonAction() {
        delegate?.triggerSearchSegue()
    }
    
    
}
