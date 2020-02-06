//
//  Functions.swift
//  BaseProject_MVC
//
//  Created by Gati Shah on 02/08/19.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

func print(_ items: Any...)  {
    #if DEBUG
    Swift.print(items[0])
    #endif
}

//MARK:- Print Fonts
func printFonts() {
    let fontFamilyNames = UIFont.familyNames
    for familyName in fontFamilyNames {
        print("------------------------------")
        print("Font Family Name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("Font Names = [\(names)]")
    }
}

//MARK:- Get App Font
func GetAppFont(FontType : AppFont,FontSize : FontSize) -> UIFont{
    
    guard let font = UIFont(name: FontType.rawValue, size: CGFloat(FontSize.rawValue)) else {
        print("Font with provided font name not found!")
        return UIFont.systemFont(ofSize: CGFloat(FontSize.rawValue))
    }
    return font
}

//MARK:- Get View Controller
func GetViewController(StoryBoard : Storyboards,Identifier : ControllerIdentifier) ->UIViewController?{
    
    return UIStoryboard(name: StoryBoard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifier.rawValue)
}

//MARK:- Get Navigation Controller
func GetNavigationController(StoryBoard : Storyboards,Identifier : NavigationControllerIdentifier) ->UINavigationController?{
    
    guard let NavigationVC = UIStoryboard(name: StoryBoard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifier.rawValue) as? UINavigationController else{
        print("Navigation Controller with provided identifier not found!")
        return nil
    }
    return NavigationVC
}

//MARK:- Get Current Navigation Controller
func GetCurrentNavigationController() -> UINavigationController?{
    
    return UIApplication.shared.windows.first?.rootViewController?.navigationController
}

//MARK:- Get Top Most View Controller
func topMostViewController() -> UIViewController {
    var topViewController: UIViewController? = UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController
    while ((topViewController?.presentedViewController) != nil) {
        topViewController = topViewController?.presentedViewController
    }
    return topViewController!
}

//MARK: Method for validating email
func isValidEmail(_ testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

//MARK:- Method for validating password
//Password should contain \n- At least 1 uppercase letter \n- At least 1 lowercase letter \n- A number \n- A symbol: !£$%^&amp;*()_+=[]{}/?'@:; \n- Have more than 7 characters
func isValidPassword(_ testStr:String) -> Bool {
    let passwordRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$"
    let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
    return passwordTest.evaluate(with: testStr)
}

//MARK:- Method to Ierate through Enum
func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

//MARK:- SetUp TextFields in the Screen
func setUpTextFields(textFields : [UITextField], placeholders : [String]) {
    for (index, textField) in textFields.enumerated() {
        textField.placeholder = placeholders[index]
        textField.font = GetAppFont(FontType: .Gilmer_Regular, FontSize: .Medium)
        textField.textColor = .black
    }
}

//MARK:- Resize Image
func image(with image: UIImage, scaledToFill size: CGSize) -> UIImage {
    let scale: CGFloat = max(size.width / image.size.width, size.height / image.size.height)
    let width: CGFloat = image.size.width * scale
    let height: CGFloat = image.size.height * scale
    let imageRect = CGRect(x: (size.width - width) / 2.0, y: (size.height - height) / 2.0, width: width, height: height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    image.draw(in: imageRect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage ?? UIImage()
}

//MARK:- Method to Get Formatted Date String
func getFormattedDateString(dateString : String, currentDateForamt : String, convertToFormat : String) -> String {
    
    dateFormatter.dateFormat = currentDateForamt
    
    if let date = dateFormatter.date(from: dateString){
        dateFormatter.dateFormat = convertToFormat
        print(dateFormatter.string(from: date))
        return dateFormatter.string(from: date)
    }
    return dateString
}
