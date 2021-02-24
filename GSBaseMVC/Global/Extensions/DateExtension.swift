//
//  DateExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
//

import Foundation

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    func getDateStringFromDate(_ format: String) -> String {
        let dateformatter = DateFormatter()
        //dateformatter.locale = Locale.init(identifier: "en_GB")
        // dateformatter.timeZone = TimeZone(abbreviation: "UTC")
        //TimeZone.current
        dateformatter.timeZone = TimeZone.current //TimeZone(identifier: "UTC")
        dateformatter.dateFormat = format
        return dateformatter.string(from: self)
    }
}
