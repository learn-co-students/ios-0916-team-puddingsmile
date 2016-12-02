//
//  ViewController.swift
//  Flatiron Group Project
//
//  Created by Neill Perry on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {

    var containerView = UIView()
    var actingVC : UIViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MarketDatabase.makeMarkets()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.containerView.frame = self.view.bounds
        self.view.addSubview(containerView)
        DataStore.sharedInstance.fetchData()
        
        if FirebaseAPI.userIsLoggedIn() {
            DispatchQueue.main.async {
                self.moveToMapVC()
            }
            
        } else {
            DispatchQueue.main.async {
                self.moveToLoginVC()
            }
            
        }
        
    }
    
    
    func moveToLoginVC() {
        self.actingVC = loadViewController(with: "loginvc")
        self.add(viewController: actingVC)
    }
    
    func moveToMapVC() {
        self.actingVC = loadViewController(with: "mapvc")
        self.add(viewController: actingVC)
    }
    
    func loadViewController(with id: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id)
    }
    
    func add(viewController: UIViewController, animated: Bool = false) {
        self.addChildViewController(viewController)
        containerView.addSubview(viewController.view)
        containerView.alpha = 0.0
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
        
        guard animated else { containerView.alpha = 1.0; return }
        
        UIView.transition(with: containerView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.containerView.alpha = 1.0
        }) { _ in }
    }
}

