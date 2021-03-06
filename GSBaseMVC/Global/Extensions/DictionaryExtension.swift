//
//  DictionaryExtension.swift
//  Unbox
//
//  Created by Gati on 24/08/20.
//  Copyright © 2020 Gati Shah. All rights reserved.
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
