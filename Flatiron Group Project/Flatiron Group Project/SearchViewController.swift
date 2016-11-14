//
//  SearchViewController.swift
//  Flatiron Group Project
//
//  Created by Benjamin Su on 11/14/16.
//  Copyright © 2016 PuddingSmile. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let searchView = SearchView(frame: self.view.frame)
        self.view = searchView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
