//
//  MarketInfoViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit
import Firebase
import SafariServices
import MessageUI

class MarketInfoViewController: UIViewController, MarketInfoDelegate {
    
    var market: Market!
    var safari: SFSafariViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let marketInfoView = MarketInfo(frame: self.view.frame)
        marketInfoView.market = self.market
        marketInfoView.delegate = self
        self.view = marketInfoView
        marketInfoView.setupMarketInfoView(market: market)
        marketInfoView.editorBox.vcDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
        //testing email functionality
        //sendEmailButtonTapped()
        
    }
    
    func triggerBackSegue() {
        dismiss(animated: true, completion: nil)
    }

    func triggerCommentsSegue() {
        performSegue(withIdentifier: "requestChangeSegue", sender: self)
    }
    
    func showSafariVC(url: URL) {
        safari = SFSafariViewController(url: url)
        present(safari, animated: true, completion: nil)
    }
    
    func openAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            
        }))
        present(alert, animated: true, completion: {})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CommentsViewController {
            dest.market = self.market
        }
    }
}

extension MarketInfoViewController: MFMailComposeViewControllerDelegate {
    
    func sendEmailButtonTapped() {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
       
        mailComposerVC.setToRecipients(["puddingsmileinc@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}


















