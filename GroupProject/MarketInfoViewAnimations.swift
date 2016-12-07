//
//  MarketInfoViewAnimations.swift
//  GroupProject
//
//  Created by Benjamin Su on 12/2/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Positions for center animation of editor and tableview
struct EditorPosition {
    
    private static let height = UIScreen.main.bounds.height
    
    static var centerShow: CGFloat = (height * 0.19) + (height * 0.07)
    
    static var centerHide: CGFloat = height * -0.19
    
}

//MARK: - Animation functions
extension MarketInfo {
    func showInfoTableView() {
        self.infoTableView.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = EditorPosition.centerShow
        }, completion: { (success) in
            
        })
    }
    func showEditorBox() {
        self.editorBox.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = EditorPosition.centerShow
        }, completion: { (success) in
            
        })
    }
    func hideInfoTableView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = EditorPosition.centerHide
        }, completion: { (success) in
            self.infoTableView.isHidden = true
        })
    }
    func hideEditorBox() {
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = EditorPosition.centerHide
        }, completion: { (success) in
            self.editorBox.isHidden = true
        })
    }
    func swapToEditorBox() {
        UIView.animate(withDuration: 0.2, animations: {
            self.infoTableView.center.y = EditorPosition.centerHide
        }, completion: { (success) in
            self.infoTableView.isHidden = true
            self.editorBox.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.editorBox.center.y = EditorPosition.centerShow
            })
        })
    }
    func swapToInfoTable() {
        UIView.animate(withDuration: 0.2, animations: {
            self.editorBox.center.y = EditorPosition.centerHide
        }, completion: { (success) in
            self.editorBox.isHidden = true
            self.infoTableView.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                self.infoTableView.center.y = EditorPosition.centerShow
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
    
    func animateBlurView(isTrue: Bool) {
        
        UIView.animate(withDuration: 0.2, animations: {
            
            if isTrue {
                
                self.blurView.alpha = 0.4
                
            } else {
                
                self.blurView.alpha = 0
                
            }
            
        })
        
    }
}
