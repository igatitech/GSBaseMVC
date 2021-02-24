//
//  UserDefaultExtension.swift
//  GatiShah_iOS
//
//  Created by Gati on 07/08/19.
//  Copyright © 2019 Tamgy. All rights reserved.
//

import Foundation

extension UserDefaults {
    func decode<T : Codable>(for type : T.Type, using key : CacheKeys) -> T? {
        let defaults = UserDefaults.standard
        guard let data = defaults.object(forKey: key.rawValue) as? Data else {return nil}
        let decodedObject = try? PropertyListDecoder().decode(type, from: data)
        return decodedObject
    }
    
    func encode<T : Codable>(for type : T, using key : CacheKeys) {
        let defaults = UserDefaults.standard
        let encodedData = try? PropertyListEncoder().encode(type)
        defaults.set(encodedData, forKey: key.rawValue)
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
