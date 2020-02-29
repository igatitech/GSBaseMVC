//
//  Constant.swift
//  GSBaseMVC
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

let buttonCornerRadius : CGFloat = 7.0
let dateFormatter = DateFormatter()
var deviceTokenString = ""

var user: LoginData?

//MARK:- FontSize
enum FontSize : Float {
    case ExtraSmall = 10.0
    case Small = 12.0
    case Regular = 14.0
    case Medium = 16.0
    case Large = 18.0
    case ExtraLarge = 20.0
    case belowBig = 22.0
    case Big = 24.0
    case ExtraBig = 26.0
}

//MARK:- AppFont
enum AppFont : String {
    case Gilmer_Heavy = "Gilmer-Heavy"
    case Gilmer_Medium = "Gilmer-Medium"
    case Gilmer_Regular = "Gilmer-Regular"
    case Gilmer_Light = "Gilmer-Light"
    case Gilmer_Bold = "Gilmer-Bold"
    case Montserrat_Regular = "Montserrat-Regular"
    case Montserrat_Medium = "Montserrat-Medium"
    case Montserrat_Bold = "Montserrat-Bold"
    case Montserrat_Light = "Montserrat-Light"
    case Montserrat_SemiBold = "Montserrat-SemiBold"
}

//MARK:- Date Formats
struct DateFormat {
    static let yyyyMMddTHHmmss = "yyyy-MM-dd'T'HH:mm:ss"
    static let ddMMyy = "dd/MM/yy"
    static let ddMMyyyy = "dd/MM/yyyy"
    static let MMMyyyy = "MMM, yyyy"
    static let yyyyMMdd = "yyyy-MM-dd"
}

//MARK:- Images
struct CommonImg {
    static let placeholder = "placeholder"
}

//MARK:- Storyboards
enum Storyboards : String {
    case Authentication = "Authentication"
    case TableCollection = "TableCollection"
    case Segment = "Segment"
    case Localize = "Localize"
}

//MARK:- NavigationControllerIdentifier
enum NavigationControllerIdentifier : String {
    case NavigationController = "NavigationController"
}

//MARK:- Main Screen Title Enum
enum Titles : String {
    case normalTableView = "Normal TableView"
    case normalCollectionView = "Normal CollectionView"
    case segmentController = "SJSegment Controller"
    case segmentControllerHeader = "SJSegment Controller with Header"
    case languageLocalization = "Language Localization"
}
