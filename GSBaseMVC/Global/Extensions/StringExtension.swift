//
//  StringExtension.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
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

}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    func getAttributedSignUpString(strPartOne : String, strPartTwo : String) -> NSMutableAttributedString{
        
        let attributeColor : [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.appRed, NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue):GetAppFont(FontType:.Gilmer_Regular, FontSize: .ExtraLarge)]
        let partOne = (NSMutableAttributedString(string: strPartOne, attributes: attributeColor))
        let partTwo = (NSMutableAttributedString(string: strPartTwo, attributes: attributeColor))
        let combination = NSMutableAttributedString()
        combination.append(partOne)
        combination.append(NSAttributedString(string: " "))
        combination.append(partTwo)
        return combination
    }
}
