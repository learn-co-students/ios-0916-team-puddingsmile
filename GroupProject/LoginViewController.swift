//
//  LoginViewController.swift
//  BreadCrumbs
//
//  Created by Alexander Mason on 11/14/16.
//  Copyright © 2016 ForrestApps. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerUser(_ sender: Any) {
        handleRegister()
    }
    
    
    func handleRegister() {
        print("handle register called")
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else { return }
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print("error registering \(error)")
                return
            }
            guard let uid = user?.uid else {
                print("uid failed")
                return
            }
            
            let ref = FIRDatabase.database().reference(withPath: "locations")
            let teacher = ref.child("teacher").child(uid)
            let values = ["name": name, "email": email]
            teacher.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print("error updating child values \(error)")
                    return
                }
                let crumbsCollectionVC = CrumbsCollectionViewController()
                self.present(crumbsCollectionVC, animated: true, completion: nil)
            })
            
            
        })
    }

    

 
}
