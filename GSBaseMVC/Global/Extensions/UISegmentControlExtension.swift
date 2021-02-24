//
//  UISegmentControlExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    func defaultConfiguration(font: UIFont = UIFont.systemFont(ofSize: 12), color: UIColor = .gray) {
        let defaultAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(defaultAttributes, for: .normal)
    }
    
    func selectedConfiguration(font: UIFont = UIFont.boldSystemFont(ofSize: 12), color: UIColor = .red) {
        let selectedAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    func removeBorders(backgroundColor : UIColor, tintColor : UIColor) {
        setBackgroundImage(imageWithColor(color: backgroundColor), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: .clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
