//
//  LoginViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginView = LoginView(frame: self.view.frame)
        loginView.delegate = self
        self.view = loginView
    }
    
    func startSegueButton() {
       
        NotificationCenter.default.post(name: Notification.Name.mapVC, object: nil)
        
    }
        
}
