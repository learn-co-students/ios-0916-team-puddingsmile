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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveToLoginTapped(with sender: UIButton) {
        print(1)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
