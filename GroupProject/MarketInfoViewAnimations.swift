//
//  MarketInfoViewAnimations.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/2/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Animation functions
extension MarketInfo {
    func showInfoTableView() {
        self.infoTableView.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * 0.7
        }, completion: { (success) in
            
        })
    }
    func showEditorBox() {
        self.editorBox.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = self.editorBox.frame.height * 0.7
        }, completion: { (success) in
            
        })
    }
    func hideInfoTableView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * -1
        }, completion: { (success) in
            self.infoTableView.isHidden = true
        })
    }
    func hideEditorBox() {
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = self.editorBox.frame.height * -1
        }, completion: { (success) in
            self.editorBox.isHidden = true
        })
    }
    func swapToEditorBox() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = self.infoTableView.frame.height * -1
        }, completion: { (success) in
            self.infoTableView.isHidden = true
            self.editorBox.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.editorBox.center.y = self.editorBox.frame.height * 0.7
            })
        })
    }
    func swapToInfoTable() {
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = self.editorBox.frame.height * -1
        }, completion: { (success) in
            self.editorBox.isHidden = true
            self.infoTableView.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.infoTableView.center.y = self.infoTableView.frame.height * 0.7
            })
        })
    }
    
    func toggleEditButton(state: Bool) {
        if state {
            editButton.layer.borderWidth = 3
        } else {
            editButton.layer.borderWidth = 0
        }
    }
}
