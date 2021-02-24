//
//  UIButtonExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setUpButton(title : String, titleColor : UIColor, font : UIFont, backgroundColor : UIColor? = .clear, cornerRadius : CGFloat? = 0.0, attributedTitle : NSAttributedString? = nil) {
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
        self.showsTouchWhenHighlighted = true
    }
}
