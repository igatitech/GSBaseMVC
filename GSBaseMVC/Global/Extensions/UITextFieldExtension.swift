//
//  UITextFieldExtension.swift
//  BaseProject_MVC
//
//  Created by Gati Shah on 02/08/19.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import UIKit

@IBDesignable
extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    /// Moves the caret to the correct position by removing the trailing whitespace
    func fixCaretPosition() {
        // Moving the caret to the correct position by removing the trailing whitespace
        // http://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle
        
        let beginning = beginningOfDocument
        selectedTextRange = textRange(from: beginning, to: beginning)
        let end = endOfDocument
        selectedTextRange = textRange(from: end, to: end)
    }
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
    func changeResponder(textFields : [UITextField]) {
        for i in 0..<textFields.count {
            let textfield = textFields[i]
            if textfield == self {
                if i < textFields.count-1 {
                    let textfield = textFields[i+1]
                    textfield.becomeFirstResponder()
                    break
                } else {
                    textfield.resignFirstResponder()
                    break
                }
            }
        }
    }
    
    func setUpTextField(placeholder : String, font : UIFont, textColor : UIColor) {
        self.placeholder = placeholder
        self.font = font
        self.textColor = textColor
        /*self.paddingLeftCustom = 10
        self.paddingRightCustom = 10*/
    }
}

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
