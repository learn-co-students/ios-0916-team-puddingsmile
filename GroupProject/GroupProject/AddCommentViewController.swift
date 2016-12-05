//
//  AddComment.swift
//  GroupProject
//
//  Created by Neill Perry on 12/2/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddCommentViewController: UIViewController, AddCommentDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let addCommentView = AddCommentView(frame: self.view.frame)
        self.view = addCommentView
        print("view loaded")
        //modalTransitionStyle = .crossDissolve
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //create Add Comment button
    //create Cancel button
    //create large text field
    
    func triggerBackSegue() {
        dismiss(animated: true, completion: nil)
    }
    
}
