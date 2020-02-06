//
//  UINavigationControllerExtension.swift
//  GSBaseMVC
//
//  Created by Gati on 29/01/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

    func backToViewController(vc: Any)  {
        for element in viewControllers as Array {
            if element.isKind(of: vc as! AnyClass) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }

    ///Get previous view controller of the navigation stack
    func previousViewController() -> UIViewController?{
        let lenght = self.viewControllers.count
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
        return previousViewController
    }
}
