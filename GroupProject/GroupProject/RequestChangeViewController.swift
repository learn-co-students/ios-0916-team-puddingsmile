//
//  RequestChangeViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class RequestChangeViewController: UIViewController, RequestChangeDelegate {

    var market: Market!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestView = RequestChangeView(frame: self.view.frame)
        requestView.market = self.market
        requestView.delegate = self
        self.view = requestView
        requestView.setupRequestChangeView(market: market)
    }
    
    func triggerBackSegue() {
        dismiss(animated: true, completion: nil)
    }
   
    func triggerSaveChanges() {
        
    }

}
