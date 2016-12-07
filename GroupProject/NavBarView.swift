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
        let searchImage: UIImage! = UIImage(named: "imgres.png")
        searchButton.setImage(searchImage, for: .normal)
        searchButton.layer.borderColor = UIColor.gray.cgColor
        searchButton.layer.borderWidth = 2
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        searchButton.layer.cornerRadius = CGFloat(7)
        self.addSubview(searchButton)
    }
    
    func loadConstraints() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.2).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * 0.85).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.08).isActive = true
    }
    
    func searchButtonAction() {
        delegate?.triggerSearchSegue()
    }
    
    
}
