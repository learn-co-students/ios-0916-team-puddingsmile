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
    var titleLabel: UILabel!
    weak var delegate: NavBarViewDelegate!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        createLayout()
        loadConstraints()
    }

    func createLayout() {
        self.backgroundColor = UIColor.themePrimary
        
        searchButton = UIButton()
        searchButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        let searchImage: UIImage! = UIImage(named: "searchImage")
        searchButton.setImage(searchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        self.addSubview(searchButton)
        
        titleLabel = UILabel()
        titleLabel.text = "City Fresh"
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = UIColor.black
        self.addSubview(titleLabel)
    }
    
    func loadConstraints() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.5).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: self.bounds.width * -0.03).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: self.bounds.height * 0.5).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.5).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: self.bounds.height * 0.18).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.60).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.75).isActive = true
    }
    
    func searchButtonAction() {
        delegate?.triggerSearchSegue()
    }
    
    
}
