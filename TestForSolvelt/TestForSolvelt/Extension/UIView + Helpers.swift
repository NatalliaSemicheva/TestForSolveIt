//
//  UIView + Helpers.swift
//  TestForSolvelt
//
//  Created by Наталия Семичева on 7/30/19.
//  Copyright © 2019 Наталия Семичева. All rights reserved.
//

import UIKit

// Borders

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

// Shadow

extension UIView {
    func addShadow() {
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = UIColor(white: 0, alpha: 1).cgColor
        layer.masksToBounds = false
    }
}

