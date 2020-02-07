//
//  NSLayoutConstraintExtension.swift
//  GSBaseMVC
//
//  Created by Gati on 25/09/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    func changeMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        newConstraint.priority = priority
        
        NSLayoutConstraint.deactivate([self])
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}
