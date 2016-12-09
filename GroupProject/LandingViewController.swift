//
//  ViewController.swift
//  Flatiron Group Project
//
//  Created by Neill Perry on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import Firebase
final class LandingViewController: UIViewController {

    var containerView = UIView()
    var actingVC : UIViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MarketDatabase.makeMarkets()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.containerView.frame = self.view.bounds
        self.view.addSubview(containerView)
        addNotificationObservers()
        
        if true {
            print("woah")
            DataStore.sharedInstance.fetchData()
        }
        
        if FirebaseAPI.userIsLoggedIn() {
            print("user logged in")
            print(FIRAuth.auth()?.currentUser?.uid)
            DispatchQueue.main.async {
                self.loadNewViewController(with: "mapvc")
            }
        } else {
            print("user not logged in")
            DispatchQueue.main.async {
                self.loadNewViewController(with: "loginvc")
            }
        }
        
    }
    
    //Listening for posts
    func addNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(observerNotification), name: Notification.Name.loginVC, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(observerNotification), name: Notification.Name.mapVC, object: nil)
    }
    
    
    func observerNotification(with notification: Notification) {
        switch notification.name {
        case Notification.Name.loginVC:
            self.switchToViewController(with: "loginvc")
        case Notification.Name.mapVC:
            self.switchToViewController(with: "mapvc")
        default:
            fatalError("Well shitters")
        }
    }
    
    func switchToViewController(with id: String) {
        let currentVC = actingVC
        currentVC?.willMove(toParentViewController: nil)
        actingVC = loadViewController(with: id)
        addChildViewController(actingVC)
        add(viewController: actingVC)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.actingVC.view.alpha = 1.0
            currentVC?.view.alpha = 0.0
        }) { success in
            currentVC?.view.removeFromSuperview()
            currentVC?.removeFromParentViewController()
            self.actingVC.didMove(toParentViewController: self)
        }
    }
    
    func loadNewViewController(with id: String) {
        self.actingVC = loadViewController(with: id)
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

extension Notification.Name {
    static let loginVC = Notification.Name(rawValue: "loginvc")
    static let mapVC = Notification.Name(rawValue: "mapvc")
}


