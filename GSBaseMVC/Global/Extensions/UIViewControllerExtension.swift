//
//  UIViewControllerExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension  UIViewController {

    static var topMostViewController: UIViewController {
        get {
            if let window = UIApplication.shared.keyWindow {
                return UIViewController.topViewController(rootViewController: window.rootViewController!)
            } else {
                return UIViewController()
            }
        }
    }
    
    static func topViewController(rootViewController: UIViewController) -> UIViewController {
        guard rootViewController.presentedViewController != nil else {
            if rootViewController is UITabBarController {
                let tabbarVC = rootViewController as! UITabBarController
                let selectedViewController = tabbarVC.selectedViewController
                if let selectedVC = selectedViewController {
                    return UIViewController.topViewController(rootViewController: selectedVC)
                } else {
                    if let selectedVCNavController = selectedViewController as? UINavigationController {
                        return UIViewController.topViewController(rootViewController: selectedVCNavController.viewControllers.last!)
                    } else {
                        return rootViewController
                    }
                }
                
            } else if rootViewController is UINavigationController {
                let navVC = rootViewController as! UINavigationController
                return UIViewController.topViewController(rootViewController: navVC.viewControllers.last!)
            }
            
            return rootViewController
        }
        
        return topViewController(rootViewController: rootViewController.presentedViewController!)
    }
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: StringConstant.Common.kOk, style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
