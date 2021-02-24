//
//  CALayerExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
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
