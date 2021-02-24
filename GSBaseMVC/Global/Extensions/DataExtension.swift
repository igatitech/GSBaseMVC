//
//  DataExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import Foundation

extension Data {
    
  var format: String {
    let array = [UInt8](self)
    let ext: String
    switch (array[0]) {
    case 0xFF:
        ext = "jpg"
    case 0x89:
        ext = "png"
    case 0x47:
        ext = "gif"
    case 0x49, 0x4D :
        ext = "tiff"
    default:
        ext = "unknown"
    }
    return ext
   }
    
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
    
}
