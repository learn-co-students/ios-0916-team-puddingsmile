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
        return UIColor(colorLiteralRed: 63/255, green: 96/255, blue: 131/255, alpha: 1)
    }
    static var themeSecondary: UIColor {
        return UIColor(colorLiteralRed: 2/255, green: 128/255, blue: 144/255, alpha: 1)
    }
    static var themeTertiary: UIColor {
        return UIColor(colorLiteralRed: 244/255, green: 91/255, blue: 105/255, alpha: 1)
    }
    static var themeAccent1: UIColor {
        return UIColor(colorLiteralRed: 228/255, green: 253/255, blue: 225/255, alpha: 1)
    }
    static var themeAccent2: UIColor {
        return UIColor(colorLiteralRed: 17/255, green: 75/255, blue: 95/255, alpha: 1)
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

extension UITextField {
    func setToTheme(string: String) {
        self.attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: UIColor.buttonText, NSFontAttributeName: Constants.themeFont(size: 15)])
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
        
        let halfColor = UIColor.themeAccent1.withAlphaComponent(0.3)
        
        let colorAnimation: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = halfColor.cgColor
        colorAnimation.toValue = halfColor.cgColor
        colorAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        colorAnimation.repeatCount = count ?? 2
        colorAnimation.duration = (duration ?? 0.5)/TimeInterval(colorAnimation.repeatCount)
        colorAnimation.autoreverses = true
        colorAnimation.byValue = translation ?? -5
        
        layer.add(colorAnimation, forKey: "pulse")
    }
    
    
}



