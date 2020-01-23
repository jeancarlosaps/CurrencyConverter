//
//  DesignableTextField.swift
//  CurrencyConverter
//
//  Created by Jean Carlos on 1/21/20.
//  Copyright © 2020 Jean Carlos. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    
    // MARK: - IBInspectable
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    // MARK: - Methods
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            
            let width = leftPadding - 50
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftView = view
        } else {
            
            leftViewMode = .never
        }
    }
    
}
