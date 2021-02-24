//
//  UIColorExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let AppYellow = #colorLiteral(red: 1, green: 0.8117647059, blue: 0, alpha: 1)
    static let AppBtnYellow = #colorLiteral(red: 0.9960784314, green: 0.7137254902, blue: 0.1843137255, alpha: 1)
    static let AppBtnBGYellow = #colorLiteral(red: 0.9960784314, green: 0.8117647059, blue: 0.1843137255, alpha: 1)
    static let AppLightYellow = #colorLiteral(red: 0.9960784314, green: 0.9607843137, blue: 0.8, alpha: 1)
    static let AppPurple = #colorLiteral(red: 0.4862745098, green: 0.4078431373, blue: 0.968627451, alpha: 1)
    static let AppDarkSkyBlue = #colorLiteral(red: 0.4980392157, green: 0.4980392157, blue: 0.8, alpha: 1)
    static let AppLightPurple = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9725490196, alpha: 1)
    static let AppPeach = #colorLiteral(red: 0.9647058824, green: 0.3803921569, blue: 0.3843137255, alpha: 1)
    static let AppRed = #colorLiteral(red: 0.9176470588, green: 0.262745098, blue: 0.2078431373, alpha: 1)
    static let AppBGRed = #colorLiteral(red: 0.9921568627, green: 0.2549019608, blue: 0.2352941176, alpha: 1)
    static let AppRedDot = #colorLiteral(red: 0.8823529412, green: 0.07450980392, blue: 0.02745098039, alpha: 1)
    static let AppBlue = #colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.7176470588, alpha: 1)
    static let AppGray67 = #colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1)
    static let AppGray102 = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
    static let AppGray153 = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    static let AppGray187 = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
    static let AppGray204 = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    static let AppBorderGray = #colorLiteral(red: 0.7803921569, green: 0.7843137255, blue: 0.9098039216, alpha: 1)
    static let AppTextBlue = #colorLiteral(red: 0, green: 0.3843137255, blue: 1, alpha: 1)
    static let AppSkyBlue = #colorLiteral(red: 0.1019607843, green: 0.6117647059, blue: 0.9882352941, alpha: 1)
    static let AppBlueDot = #colorLiteral(red: 0.02352941176, green: 0.4078431373, blue: 0.9019607843, alpha: 1)
    static let AppGreen = #colorLiteral(red: 0.2039215686, green: 0.6588235294, blue: 0.3254901961, alpha: 1)
    static let AppOrange = #colorLiteral(red: 1, green: 0.4901960784, blue: 0, alpha: 1)
    static let AppBackButton = #colorLiteral(red: 0.1294117647, green: 0.1450980392, blue: 0.1607843137, alpha: 1)
    static let AppLightPink = #colorLiteral(red: 1, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    static let AppProgressGreen = #colorLiteral(red: 0.1882352941, green: 0.6509803922, blue: 0.337254902, alpha: 1)
    static let AppProgressBlue = #colorLiteral(red: 0.2588235294, green: 0.5215686275, blue: 0.9568627451, alpha: 1)
    static let AppProgressPink = #colorLiteral(red: 0.9294117647, green: 0.3411764706, blue: 0.4745098039, alpha: 1)
    static let AppProgressYellow = #colorLiteral(red: 0.9725490196, green: 0.7450980392, blue: 0.2274509804, alpha: 1)
    
    var hexString: String {
            let components = cgColor.components
            let r: CGFloat = components?[0] ?? 0.0
            let g: CGFloat = components?[1] ?? 0.0
            let b = ((components?.count ?? 0) > 2 ? components?[2] : g) ?? 0

            let hexString = String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)),
                                   lroundf(Float(b * 255)))

            return hexString
        }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
}
