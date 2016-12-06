//
//  RequestChangeViewController.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, CommentsViewDelegate {

    var market: Market!
    var comments = [MarketComment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let commentsView = CommentsView(frame: self.view.frame)
        commentsView.market = self.market
        commentsView.commonInit()
        commentsView.delegate = self
        self.view = commentsView
    }
    
    func triggerBackSegue() {
        dismiss(animated: true, completion: nil)
    }
    
    func triggerCommentsSegue() {
        performSegue(withIdentifier: "addCommentSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tableView = self.view as! CommentsView
        tableView.readForComments()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "addCommentSegue" { return }
        let dest = segue.destination as! AddCommentViewController
        dest.market = market
    }
   
}


