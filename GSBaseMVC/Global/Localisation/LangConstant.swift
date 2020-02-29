//
//  LangConstant.swift
//  GSBaseMVC
//
//  Created by Gati Shah on 29/02/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import Foundation

enum Language {
    case English, Spanish    
    var rawValue: String {
        get {
            switch self {
            case .English:
                return "en"
                
            case .Spanish:
                return "es"
            }
        }
    }
}

struct LangConstant {
    static let quote1 = "QuoteFirstKey"
    static let quote2 = "QuoteSecondKey"
}
