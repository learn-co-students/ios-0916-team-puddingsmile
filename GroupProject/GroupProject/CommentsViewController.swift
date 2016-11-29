//
//  RequestChangeViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, CommentsViewDelegate {

    var market: Market!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let commentsView = CommentsView(frame: self.view.frame)
        commentsView.market = self.market
        commentsView.delegate = self
        self.view = commentsView
        commentsView.setupRequestChangeView(market: market)
    }
    
    func triggerBackSegue() {
        dismiss(animated: true, completion: nil)
    }
   
    func triggerSaveChanges() {
        
    }

}
