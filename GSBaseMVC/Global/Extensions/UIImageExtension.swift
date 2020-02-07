//
//  UIImageExtension.swift
//  GSBaseMVC
//
//  Created by Gati on 23/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
 func resizedImage(newSize: CGSize) -> UIImage {
   guard self.size != newSize else { return self }

   UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
   self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
   let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
   UIGraphicsEndImageContext()
   return newImage
  }
    
}
