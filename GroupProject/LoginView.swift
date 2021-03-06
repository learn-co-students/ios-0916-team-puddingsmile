//
//  LoginView.swift
//  GroupProject
//
//  Created by Benjamin Su on 11/21/16.
//  Copyright © 2016 Alexander Mason. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewDelegate: class {
    
    func startSegueButton()
    func presentAlert(title: String, msg: String)
    
}


struct LoginViewPosition {
    private static let width = UIScreen.main.bounds.width
    private static let height = UIScreen.main.bounds.height
    static let emailPosition = CGPoint(x: width * 0.5, y: height * 0.30)
    static let passwordPosition = CGPoint(x: width * 0.5, y: height * 0.40)
    static let firstnamePosition = CGPoint(x: width * 0.5, y: height * 0.40)
    static let lastnamePosition = CGPoint(x: width * 0.5, y: height * 0.40)
    
    static let loginPosition = CGPoint(x: width * 0.5, y: height * 0.55)
    static let newuserPosition = CGPoint(x: width * 0.5, y: height * 0.65)
    static let signupPosition = CGPoint(x: width * 0.5, y: height * 0.65)
    static let cancelPosition = CGPoint(x: width * 0.5, y: height * 0.65)
}

struct NewUserViewPosition {
    private static let width = UIScreen.main.bounds.width
    private static let height = UIScreen.main.bounds.height
    
    static let emailPosition = CGPoint(x: width * 0.5, y: height * 0.20)
    static let passwordPosition = CGPoint(x: width * 0.5, y: height * 0.28)
    static let firstnamePosition = CGPoint(x: width * 0.5, y: height * 0.36)
    static let lastnamePosition = CGPoint(x: width * 0.5, y: height * 0.44)
    
    static let loginPosition = CGPoint(x: width * 0.5, y: height * 0.55)
    static let newuserPosition = CGPoint(x: width * 0.5, y: height * 0.55)
    static let signupPosition = CGPoint(x: width * 0.5, y: height * 0.55)
    static let cancelPosition = CGPoint(x: width * 0.5, y: height * 0.65)
}

class LoginView: UIView {

    var appTitleLabel1: UIImageView!
    var appTitleLabel2: UILabel!
    var appTitleLabel3: UILabel!
    
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var firstnameTextField: UITextField!
    var lastnameTextField: UITextField!
    
    var loginButton: UIButton!
    var newuserButton: UIButton!
    var signupButton: UIButton!
    var cancelButton: UIButton!
    
    var signupButtonState = false
    
    weak var delegate: LoginViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.themePrimary
        self.loadViews()
        self.setPositions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocation = touches.first?.location(in: self)
        
        if emailTextField.bounds.contains(touchLocation!) {
            emailTextField.becomeFirstResponder()
        } else {
            self.endEditing(true)
        }
        
    }
    
}

extension LoginView {
    
    func loginButtonAction() {
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if !email.contains(".com") || !email.contains("@") {
            delegate.presentAlert(title: "Invalid Email", msg: "Please use a proper email")
        } else if password.characters.count < 6 {
            delegate.presentAlert(title: "Invalid Password", msg: "Password is too short")
        } else {
            FirebaseAPI.signIn(email: email, password: password) { success in
                if success {
                    self.delegate.startSegueButton()
                } else {
                    self.delegate.presentAlert(title: "Couldn't login", msg: "Please check your entries again")
                }
                
            }
        }

    }
    
    func newuserButtonAction(_ sender: UIButton) {
        animateForSignup()
    }
    
    func signupButtonAction(_ sender: UIButton) {
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let firstname = firstnameTextField.text else { return }
        guard let lastname = lastnameTextField.text else { return }
        
        if !email.contains(".com") || !email.contains("@") {
            delegate.presentAlert(title: "Invalid Email", msg: "Please use a proper email")
        } else if password.characters.count < 6 {
            delegate.presentAlert(title: "Invalid Password", msg: "Password is too short")
        } else if firstname == "" || lastname == "" {
            delegate.presentAlert(title: "Please enter a name", msg: "Both Fields need to be completed. Thank you")
        } else {
            FirebaseAPI.signUp(email: email, password: password, name: "\(firstname) \(lastname)", completion: { success in
                
                if success {
                    self.delegate.startSegueButton()
                } else {
                    self.delegate.presentAlert(title: "Couldn't create account", msg: "An account with your email may already exist")
                }
                
            })
        }
    }
    
    func cancelButtonAction(_ sender: UIButton) {
        
        animateForLogin()
        
    }
    
    
}


//MARK: -Animations
extension LoginView {
    
    func animateForSignup() {
        self.firstnameTextField.isHidden = false
        self.lastnameTextField.isHidden = false
        self.signupButton.isHidden = false
        self.cancelButton.isHidden = false
        self.newuserButton.isUserInteractionEnabled = false
        self.cancelButton.isUserInteractionEnabled = false
        UIView.animateKeyframes(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction, .calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                self.emailTextField.center = NewUserViewPosition.emailPosition
                self.passwordTextField.center = NewUserViewPosition.passwordPosition
                self.firstnameTextField.center = NewUserViewPosition.firstnamePosition
                self.lastnameTextField.center = NewUserViewPosition.lastnamePosition
                
                self.loginButton.center = NewUserViewPosition.loginPosition
                self.newuserButton.center = NewUserViewPosition.newuserPosition
                self.signupButton.center = NewUserViewPosition.signupPosition
                self.cancelButton.center = NewUserViewPosition.cancelPosition
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33, animations: {
                self.emailTextField.transform = CGAffineTransform.init(scaleX: 1.1, y: 1)
                self.passwordTextField.transform = CGAffineTransform.init(scaleX: 1.1, y: 1)
                self.firstnameTextField.transform = CGAffineTransform.init(scaleX: 1.2, y: 1)
                self.lastnameTextField.transform = CGAffineTransform.init(scaleX: 1.2, y: 1)
                
                self.loginButton.transform = CGAffineTransform.init(scaleX: 1.1, y: 1)
                self.newuserButton.transform = CGAffineTransform.init(scaleX: 1.1, y: 1)
                self.signupButton.transform = CGAffineTransform.init(scaleX: 1.2, y: 1)
                self.cancelButton.transform = CGAffineTransform.init(scaleX: 1.2, y: 1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33, animations: {
                self.emailTextField.transform = CGAffineTransform.init(scaleX: 0.9, y: 1)
                self.passwordTextField.transform = CGAffineTransform.init(scaleX: 0.9, y: 1)
                self.firstnameTextField.transform = CGAffineTransform.init(scaleX: 0.8, y: 1)
                self.lastnameTextField.transform = CGAffineTransform.init(scaleX: 0.8, y: 1)
                
                self.loginButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 1)
                self.newuserButton.transform = CGAffineTransform.init(scaleX: 0.9, y: 1)
                self.signupButton.transform = CGAffineTransform.init(scaleX: 0.8, y: 1)
                self.cancelButton.transform = CGAffineTransform.init(scaleX: 0.8, y: 1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33, animations: {
                self.emailTextField.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.passwordTextField.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.firstnameTextField.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.lastnameTextField.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                
                self.loginButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.newuserButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.signupButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.cancelButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            })
        }) { (success) in
            self.loginButton.isHidden = true
            self.newuserButton.isHidden = true
            self.newuserButton.isUserInteractionEnabled = true
            self.cancelButton.isUserInteractionEnabled = true
        }
        
    }
    
    func animateForLogin() {
        
        self.loginButton.isHidden = false
        self.newuserButton.isHidden = false
        self.newuserButton.isUserInteractionEnabled = false
        self.cancelButton.isUserInteractionEnabled = false
        UIView.animateKeyframes(withDuration: 0.2, delay: 0.0, options: [.allowUserInteraction, .calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                self.emailTextField.center = LoginViewPosition.emailPosition
                self.passwordTextField.center = LoginViewPosition.passwordPosition
                self.firstnameTextField.center = LoginViewPosition.firstnamePosition
                self.lastnameTextField.center = LoginViewPosition.lastnamePosition
                
                self.loginButton.center = LoginViewPosition.loginPosition
                self.newuserButton.center = LoginViewPosition.newuserPosition
                self.signupButton.center = LoginViewPosition.signupPosition
                self.cancelButton.center = LoginViewPosition.cancelPosition
                
            })
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33, animations: {
                self.emailTextField.transform = CGAffineTransform.init(scaleX: 0.9, y: 1)
                self.passwordTextField.transform = CGAffineTransform.init(scaleX: 0.9, y: 1)
                self.firstnameTextField.transform = CGAffineTransform.init(scaleX: 0.8, y: 1)
                self.lastnameTextField.transform = CGAffineTransform.init(scaleX: 0.8, y: 1)
                
                self.loginButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.newuserButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.signupButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.cancelButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33, animations: {
                self.emailTextField.transform = CGAffineTransform.init(scaleX: 1.1, y: 1)
                self.passwordTextField.transform = CGAffineTransform.init(scaleX: 1.1, y: 1)
                self.firstnameTextField.transform = CGAffineTransform.init(scaleX: 1.2, y: 1)
                self.lastnameTextField.transform = CGAffineTransform.init(scaleX: 1.2, y: 1)
                
                self.loginButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.newuserButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.signupButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.cancelButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33, animations: {
                self.emailTextField.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.passwordTextField.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.firstnameTextField.transform = CGAffineTransform.init(scaleX: 0, y: 1)
                self.lastnameTextField.transform = CGAffineTransform.init(scaleX: 0, y: 1)
                
                self.loginButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.newuserButton.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.signupButton.transform = CGAffineTransform.init(scaleX: 0, y: 1)
                self.cancelButton.transform = CGAffineTransform.init(scaleX: 0, y: 1)
            })
        }) { (success) in
            self.firstnameTextField.isHidden = true
            self.lastnameTextField.isHidden = true
            self.signupButton.isHidden = true
            self.cancelButton.isHidden = true
            self.newuserButton.isUserInteractionEnabled = true
            self.cancelButton.isUserInteractionEnabled = true
        }
        
    }
    
}




//MARK: -Setup buttons
extension LoginView {
    
    func setPositions() {
        emailTextField.center = LoginViewPosition.emailPosition
        passwordTextField.center = LoginViewPosition.passwordPosition
        firstnameTextField.center = LoginViewPosition.firstnamePosition
        lastnameTextField.center = LoginViewPosition.lastnamePosition
        
        firstnameTextField.transform = CGAffineTransform.init(scaleX: 0.0, y: 1)
        lastnameTextField.transform = CGAffineTransform.init(scaleX: 0.0, y: 1)
        firstnameTextField.isHidden = true
        lastnameTextField.isHidden = true
        
        loginButton.center = LoginViewPosition.loginPosition
        newuserButton.center = LoginViewPosition.newuserPosition
        signupButton.center = LoginViewPosition.signupPosition
        cancelButton.center = LoginViewPosition.cancelPosition
        
        signupButton.transform = CGAffineTransform.init(scaleX: 0.0, y: 1)
        cancelButton.transform = CGAffineTransform.init(scaleX: 0.0, y: 1)
        signupButton.isHidden = true
        cancelButton.isHidden = true
    }
    
    func loadViews() {
        
        let borderWidth: CGFloat = 2
        let borderColor = UIColor.themeAccent1.cgColor
        
        appTitleLabel1 = UIImageView()
        self.addSubview(appTitleLabel1)
        appTitleLabel1.translatesAutoresizingMaskIntoConstraints = false
        appTitleLabel1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        appTitleLabel1.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        appTitleLabel1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        appTitleLabel1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        appTitleLabel1.image = UIImage(named: "cityFreshLogo")

//        appTitleLabel2 = UILabel(frame: CGRect(x: self.frame.size.width * 0.25, y: self.frame.size.height * 0.07, width: self.frame.size.width * 0.5, height: self.frame.size.height * 0.04))
//        appTitleLabel2.textColor = UIColor.black
//        appTitleLabel2.text = "Fresh"
//        appTitleLabel2.font = UIFont(name: "AvenirNext-Heavy", size: 12)
//        appTitleLabel2.textAlignment = .center
//        self.addSubview(appTitleLabel2)
        
        firstnameTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.6, height: self.frame.size.height * 0.06))
        firstnameTextField.layer.cornerRadius = 4
        firstnameTextField.layer.borderWidth = borderWidth
        firstnameTextField.layer.borderColor = borderColor
        firstnameTextField.autocorrectionType = .no
        firstnameTextField.backgroundColor = UIColor.themePrimary
        firstnameTextField.setLeftPaddingPoints(5)
        firstnameTextField.attributedPlaceholder = NSAttributedString(string: "Enter First Name")
        self.addSubview(firstnameTextField)
        
        lastnameTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.6, height: self.frame.size.height * 0.06))
        lastnameTextField.layer.cornerRadius = 4
        lastnameTextField.layer.borderWidth = borderWidth
        lastnameTextField.layer.borderColor = borderColor
        lastnameTextField.autocorrectionType = .no
        lastnameTextField.backgroundColor = UIColor.themePrimary
        lastnameTextField.setLeftPaddingPoints(5)
        lastnameTextField.attributedPlaceholder = NSAttributedString(string: "Enter Last Name")
        self.addSubview(lastnameTextField)
        
        emailTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.6, height: self.frame.size.height * 0.06))
        emailTextField.backgroundColor = UIColor.themePrimary
        emailTextField.layer.cornerRadius = 4
        emailTextField.layer.borderWidth = borderWidth
        emailTextField.layer.borderColor = UIColor.themeTertiary.cgColor
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.setLeftPaddingPoints(5)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter email")
        self.addSubview(emailTextField)
        
        passwordTextField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.6, height: self.frame.size.height * 0.06))
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.layer.borderWidth = borderWidth
        passwordTextField.layer.borderColor = UIColor.themeTertiary.cgColor
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = UIColor.themePrimary
        passwordTextField.setLeftPaddingPoints(5)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter password")
        self.addSubview(passwordTextField)
        
        loginButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.4, height: self.frame.size.height * 0.06))
        self.addSubview(loginButton)
        loginButton.layer.cornerRadius = 7
        loginButton.layer.borderWidth = borderWidth
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.backgroundColor = UIColor.themeAccent1
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        
        newuserButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.4, height: self.frame.size.height * 0.06))
        self.addSubview(newuserButton)
        newuserButton.layer.cornerRadius = 7
        newuserButton.layer.borderWidth = borderWidth
        newuserButton.layer.borderColor = UIColor.white.cgColor
        newuserButton.backgroundColor = UIColor.themeAccent1
        newuserButton.setTitle("New User", for: .normal)
        newuserButton.setTitleColor(UIColor.white, for: .normal)
        newuserButton.addTarget(self, action: #selector(newuserButtonAction), for: .touchUpInside)
        
        signupButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.4, height: self.frame.size.height * 0.06))
        self.addSubview(signupButton)
        signupButton.layer.cornerRadius = 7
        signupButton.layer.borderWidth = borderWidth
        signupButton.layer.borderColor = borderColor
        signupButton.backgroundColor = UIColor.themeAccent1
        signupButton.setTitle("Signup", for: .normal)
        signupButton.setTitleColor(UIColor.white, for: .normal)
        signupButton.addTarget(self, action: #selector(signupButtonAction), for: .touchUpInside)
        
        cancelButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width * 0.4, height: self.frame.size.height * 0.06))
        cancelButton.layer.cornerRadius = 7
        cancelButton.layer.borderWidth = borderWidth
        cancelButton.layer.borderColor = borderColor
        self.addSubview(cancelButton)
        cancelButton.backgroundColor = UIColor.themeTertiary
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
    }
}




