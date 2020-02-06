//
//  UILabelExtension.swift
//  BaseProject_MVC
//
//  Created by Gati Shah on 02/08/19.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setUpLabel(title : String, titleColor : UIColor, titleFont : UIFont? = nil, attributeTitle : NSAttributedString? = nil, backgroundColor : UIColor? = .clear) {
        self.textColor = titleColor
        if titleFont != nil {
            self.font = titleFont
        }
        if attributeTitle != nil {
            self.attributedText = attributeTitle
        } else {
            self.text = title
        }
        self.backgroundColor = backgroundColor
    }
}
