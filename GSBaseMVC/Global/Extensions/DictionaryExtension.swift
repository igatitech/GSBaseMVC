//
//  DictionaryExtension.swift
//  GreenNet_User
//
//  Created by Gati on 22/01/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func convertToJson() -> String{
           
           var Json : String!
           let dictionary = self
           if let theJSONData = try? JSONSerialization.data(
               withJSONObject: dictionary,
               options: []) {
               let theJSONText = String(data: theJSONData,encoding: .utf8)
               Json = theJSONText
           }
           return Json
           
       }
}
