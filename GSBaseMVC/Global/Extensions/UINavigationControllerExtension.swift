//
//  UINavigationControllerExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
