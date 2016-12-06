//
//  AddComment.swift
//  GroupProject
//
//  Created by Neill Perry on 12/2/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddCommentViewController: UIViewController, AddCommentDelegate {

    var market: Market!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .crossDissolve
        let addCommentView = AddCommentView(frame: self.view.frame)
        addCommentView.market = self.market
        self.view = addCommentView
        addCommentView.delegate = self
        //modalTransitionStyle = .crossDissolve
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func triggerBackSegue() {
        print("Trigger Back Segue is called")
        dismiss(animated: true, completion: nil)
    }
    
   
    
}
