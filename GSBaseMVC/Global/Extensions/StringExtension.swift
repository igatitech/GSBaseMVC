//
//  StringExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func base64EncodedString() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    func base64DecodedString() -> String? {
        
        if let decodedData = Data(base64Encoded: self) {
            return String(data: decodedData, encoding: .ascii)
        } else {
            print("Not Base64")
        }
        return nil
    }
    
    func isBlank() -> Bool {
        if self.trimmingCharacters(in: .whitespaces).count == 0 {
            return true
        } else {
            return false
        }
    }
    
    func convertStringToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func integerValue() -> Int? {
        guard let n = Int(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) else{
            return nil
        }
        return n
    }
    
    func doubleValue() -> Double? {
        guard let n = Double(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) else{
            return nil
        }
        return n
    }
    
    func floatValue() -> Float? {
        guard let n = Float(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)) else{
            return nil
        }
        return n
    }
    
    func localizableString(langCode : String) -> String {
        guard let path = Bundle.main.path(forResource: langCode, ofType: "lproj") else {
            return ""
        }
        let bundle = Bundle(path: path)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }

    public var convertHtmlToNSAttributedString: NSAttributedString? {
            guard let data = data(using: .utf8) else {
                return nil
            }
            do {
                return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            }
            catch {
                print(error.localizedDescription)
                return nil
            }
        }

        public func convertHtmlToAttributedStringWithCSS(font: UIFont? , csscolor: String , lineheight: Int, csstextalign: String) -> NSAttributedString? {
            guard let font = font else {
                return convertHtmlToNSAttributedString
            }
            let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(csscolor); line-height: \(lineheight)px; text-align: \(csstextalign); }</style>\(self)";
            guard let data = modifiedString.data(using: .utf8) else {
                return nil
            }
            do {
                return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            }
            catch {
                print(error)
                return nil
            }
        }
}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, withFont font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
}
