//
//  CALayerExtension.swift
//  BaseProject_MVC
//
//  Created by Gati Shah on 15/09/19.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import UIKit

extension CALayer {
    
    func setUpBorder(borderColor : UIColor? = .clear, borderWidth : CGFloat? = 0.0, cornerRadius : CGFloat? = 0.0) {
        self.borderColor = borderColor?.cgColor
        self.borderWidth = borderWidth ?? 0.0
        self.cornerRadius = cornerRadius ?? 0.0
        self.masksToBounds = true
    }
}
