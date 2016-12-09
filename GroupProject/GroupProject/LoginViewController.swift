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
    
    func presentAlert(title: String, msg: String) {
        
        let alert = createAlertWith(title: title, message: msg)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func createAlertWith(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel, handler: nil))
        
        return alert
    }
    
}
