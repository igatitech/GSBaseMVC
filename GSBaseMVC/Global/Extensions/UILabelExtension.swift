//
//  UILabelExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setUpLabel(title : String, titleColor : UIColor, titleFont : UIFont? = nil, attributeTitle : NSAttributedString? = nil, backgroundColor : UIColor? = .clear, cornerRadius : CGFloat? = 0.0) {
        self.textColor = titleColor
        if titleFont != nil {
            self.font = titleFont
        }
        if attributeTitle != nil {
            self.attributedText = attributeTitle
        } else {
            self.text = title
        }
        if cornerRadius != nil {
            self.layer.cornerRadius = cornerRadius ?? 0.0
            self.layer.masksToBounds = true
        }
        self.backgroundColor = backgroundColor
    }
    
    func setHTMLString(html: String) {
        if let htmlData = html.data(using: .unicode) {
          do {
            self.attributedText = try NSAttributedString(data: htmlData,
                                                         options: [.documentType: NSAttributedString.DocumentType.html],
                                                         documentAttributes: nil)
          } catch let e as NSError {
            print("Couldn't parse \(html): \(e.localizedDescription)")
          }
        }
      }
}
