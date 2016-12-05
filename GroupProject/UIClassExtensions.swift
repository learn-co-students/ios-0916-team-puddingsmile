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
    
    static var buttonText: UIColor {
        return UIColor(colorLiteralRed: 50/255, green: 50/255, blue: 70/255, alpha: 1)
    }
    
}

extension UIButton {
    func setToTheme() {
        self.setTitleColor(UIColor.buttonText, for: .normal)
        self.titleLabel?.font = Constants.themeFont(size: 15)
        self.layer.cornerRadius = 7
    }
   
}

extension UILabel {
    func setToTheme() {
        self.textColor = UIColor.buttonText
        self.font = Constants.themeFont(size: 15)
    }
    
}


extension UIView {
    func createBottomBorder(forView: UIView) {
        let bottomBorder = UIView()
        forView.addSubview(bottomBorder)
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.leadingAnchor.constraint(equalTo: forView.leadingAnchor).isActive = true
        bottomBorder.trailingAnchor.constraint(equalTo: forView.trailingAnchor).isActive = true
        bottomBorder.bottomAnchor.constraint(equalTo: forView.bottomAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomBorder.backgroundColor = UIColor.themeAccent1
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

public extension UIView {
    
    func shake(count : Float? = nil,for duration : TimeInterval? = nil,withTranslation translation : Float? = nil) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count ?? 2
        animation.duration = (duration ?? 0.5)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? -5
        
        layer.add(animation, forKey: "shake")
        
    }
    
    func pulse(count : Float? = nil,for duration : TimeInterval? = nil,withTranslation translation : Float? = nil) {
        let colorAnimation: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.gray.cgColor
        colorAnimation.toValue = UIColor.red.cgColor
        colorAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        colorAnimation.repeatCount = count ?? 2
        colorAnimation.duration = (duration ?? 0.5)/TimeInterval(colorAnimation.repeatCount)
        colorAnimation.autoreverses = true
        colorAnimation.byValue = translation ?? -5
        
        layer.add(colorAnimation, forKey: "pulse")
    }
    
    
}



