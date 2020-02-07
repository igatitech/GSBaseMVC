//
//  UIColorExtension.swift
//  BaseProject_MVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let appGreen = #colorLiteral(red: 0, green: 0.7764705882, blue: 0.5450980392, alpha: 1)
    static let appGray = #colorLiteral(red: 0.7098039216, green: 0.7137254902, blue: 0.7019607843, alpha: 1)
    static let appTextFieldBorderGray = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
    static let appPlaceholderTextGray = #colorLiteral(red: 0.7098039216, green: 0.7137254902, blue: 0.7019607843, alpha: 1)
    static let appStatusBarBlue = #colorLiteral(red: 0.2549019608, green: 0.02745098039, blue: 0.5450980392, alpha: 1)
    static let appBlue = #colorLiteral(red: 0.2941176471, green: 0.03137254902, blue: 0.631372549, alpha: 1)
    static let appOrange = #colorLiteral(red: 1, green: 0.631372549, blue: 0, alpha: 1)
    static let appSkyBlue = #colorLiteral(red: 0.04705882353, green: 0.7764705882, blue: 0.8705882353, alpha: 1)
    static let appSideMenuRawBackground = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
    static let appSideMenuBackground = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    static let appTextPurple = #colorLiteral(red: 0.6705882353, green: 0.5529411765, blue: 0.8196078431, alpha: 1)
    static let appRed = #colorLiteral(red: 0.8156862745, green: 0.01176470588, blue: 0.1058823529, alpha: 1)
    static let appTextBlack = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
    static let appTextBlue = #colorLiteral(red: 0.4039215686, green: 0.2274509804, blue: 0.7176470588, alpha: 1)
    static let appSeparatorGray = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
    static let appTextDarkGray = #colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1)
    static let appTextMediumGray = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
    static let appTextLightGray = #colorLiteral(red: 0.6431372549, green: 0.6431372549, blue: 0.6431372549, alpha: 1)
    static let appRowBackgroundGray = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
    static let appDeleteButtonColor = #colorLiteral(red: 0.9529411765, green: 0.4235294118, blue: 0.3764705882, alpha: 1)
    static let appViewBackgroundGray = #colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)
}

//MARK:- gradient color
typealias GradientType = (x: CGPoint, y: CGPoint)

enum GradientPoint {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight
    
    func draw() -> GradientType {
        switch self {
        case .leftRight:
            return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (x: CGPoint(x: 0.5, y: 0), y: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (x: CGPoint(x: 0, y: 0), y: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (x: CGPoint(x: 0, y: 1), y: CGPoint(x: 1, y: 0))
        }
    }
}
