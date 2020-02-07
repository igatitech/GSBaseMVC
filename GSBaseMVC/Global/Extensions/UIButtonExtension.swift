//
//  UIButtonExtension.swift
//  BaseProject_MVC
//
//  Created by iGatiTech on 15/09/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setUpButton(title : String, titleColor : UIColor, font : UIFont, backgroundColor : UIColor? = .white, cornerRadius : CGFloat? = 0.0, attributedTitle : NSAttributedString? = nil) {
        if attributedTitle != nil {
            self.setAttributedTitle(attributedTitle, for: .normal)
        } else {
            self.setTitle(title, for: .normal)
        }
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius ?? 0.0
        self.layer.masksToBounds = true
    }
}
