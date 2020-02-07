//
//  StringConstant.swift
//  BaseProject_MVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation

struct StringConstant {
    //MARK:- COMMON Strings
    struct Common {
        static let kNoInternet = "Can't connect to the internet. Please try again"
        static let kSomethingWrong = "Something went wrong, please try again after some time"
        static let kOk = "OK"
        static let kBack = "Back"
        static let kCancel = "Cancel"
    }
    
    struct Login {
        static let login = "Login"
        static let email = "Username or Email"
        static let password = "Password"
    }
    
    struct MainTVC {
        static let list = "List"
    }
    
    struct MyOrder {
        static let myOrders = "My Orders"
        static let pending = "Pending"
        static let completed = "Completed"
        static let past = "Past"
        static let orderId = "Order ID:"
        static let orderOn = "Ordered On:"
        static let paymentStatus = "Payment Status:"
        static let total = "Total:"
        static let paymentMethod = "Payment Method:"
    }
    
    struct Profile {
        static let myProfile = "My Profile"
        static let following = "Following"
        static let followers = "Followers"
    }
    
    struct APIResponse {
        static let login = "Login API Response:"
        static let dummyImages = "Dummy Images API Response:"
    }
}

extension StringConstant {
    struct Validations {
        static let enterEmail = "Please enter your Email."
        static let enterPwd = "Please enter your Password."
        static let validPwd = "Password must contain at least 8 password characters."
        static let notValidEmail = "Please enter valid Email."
    }
}
