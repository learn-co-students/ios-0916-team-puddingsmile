//
//  AddMarketViewController.swift
//  GroupProject
//
//  Created by Alexander Mason on 11/28/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class AddMarketViewController: UIViewController, AddMarketViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let addMarketView = AddMarketView(frame: self.view.frame)
        addMarketView.delegate = self
        self.view = addMarketView
        print("view loaded")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func presentAlertController() {
        print("Delegate called")
        let alertController = UIAlertController(title: "Success", message: "Market Submitted Succesfully", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (alert) in
            print("Dismissing view controller")
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func backButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    

}
