//
//  CALayerExtension.swift
//  GSBaseMVC
//
//  Created by Gati on 15/09/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
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
