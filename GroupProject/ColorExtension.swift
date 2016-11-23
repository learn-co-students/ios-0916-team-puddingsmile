//
//  ColorExtension.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    static var themePrimary: UIColor {
        return UIColor(colorLiteralRed: 149/255, green: 171/255, blue: 99/255, alpha: 1)
    }
    static var themeSecondary: UIColor {
        return UIColor(colorLiteralRed: 189/255, green: 214/255, blue: 132/255, alpha: 1)
    }
    static var themeTertiary: UIColor {
        return UIColor(colorLiteralRed: 226/255, green: 240/255, blue: 214/255, alpha: 1)
    }
    static var themeAccent1: UIColor {
        return UIColor(colorLiteralRed: 246/255, green: 255/255, blue: 224/255, alpha: 1)
    }
    static var themeAccent2: UIColor {
        return UIColor(colorLiteralRed: 16/255, green: 34/255, blue: 43/255, alpha: 1)
    }
    
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
