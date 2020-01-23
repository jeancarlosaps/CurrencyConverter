//
//  LoginViewController.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 1/20/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var loginButton: CustomButton!
    @IBOutlet weak var loginWithFacebookButton: CustomButton!
    @IBOutlet weak var loginWithTwitterButton: CustomButton!
    @IBOutlet weak var loginWithGoogleButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
    }
    
    // MARK: - Properties
    private func configureTextField() {
        userNameTextField.tintColor = UIColor.lightGray
        passwordTextField.tintColor = UIColor.lightGray
        
        userNameTextField.setIcon(#imageLiteral(resourceName: "icon_userOrEmail"))
        passwordTextField.setIcon(#imageLiteral(resourceName: "icon_password"))
        
        userNameTextField.placeholder = StringsHelper.placeHolderUserOrEmail
        passwordTextField.placeholder = StringsHelper.placeHolderPassword
        
        userNameTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
        
        passwordTextField.isSecureTextEntry = true
        
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame: 
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
}
