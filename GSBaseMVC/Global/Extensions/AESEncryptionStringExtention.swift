//
//  AESEncryptionStringExtention.swift
//  Kiwe
//
//  Created by Arvind Mac on 28/11/19.
//  Copyright © 2019 Openxcell. All rights reserved.
//

import Foundation
import CryptoSwift

extension String {
    func aesEncrypt() -> String? {
        do {
             let encrypted = try AES(key: Array(AES_KEY.utf8), blockMode:CBC(iv: Array(AES_IV.utf8)), padding: .pkcs5).encrypt([UInt8](self.data(using: .utf8)!))
             return Data(encrypted).base64EncodedString()
        } catch {
           return nil
        }
    }
    func aesDecrypt() -> String? {
        guard let data = Data(base64Encoded: self) else { return "" }
        do {
        let decrypted = try AES(key: Array(AES_KEY.utf8), blockMode:CBC(iv: Array(AES_IV.utf8)), padding: .pkcs5).decrypt([UInt8](data))
            return String(bytes: decrypted, encoding: .utf8) ?? self
        } catch {
            return nil
        }
    }
}
