//
//  UserDefaultExtension.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation

extension UserDefaults {
    func decode<T : Codable>(for type : T.Type, using key : String) -> T? {
        let defaults = UserDefaults.standard
        guard let data = defaults.object(forKey: key) as? Data else {return nil}
        let decodedObject = try? PropertyListDecoder().decode(type, from: data)
        return decodedObject
    }
    
    func encode<T : Codable>(for type : T, using key : String) {
        let defaults = UserDefaults.standard
        let encodedData = try? PropertyListEncoder().encode(type)
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
    
    func save<T: Codable>(_ object: T, forKey key: CacheKeys) {
        let encoder = JSONEncoder()
        if let encodedObject = try? encoder.encode(object) {
            UserDefaults.standard.set(encodedObject, forKey: key.rawValue)
            UserDefaults.standard.synchronize()
        }
    }

    func getObject<T: Codable>(forKey key: CacheKeys) -> T? {
        if let object = UserDefaults.standard.object(forKey: key.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let decodedObject = try? decoder.decode(T.self, from: object) {
                return decodedObject
            }
        }
        return nil
    }
}
