//
//  LoginData.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class LoginData: Codable {
	public var phone : String?
	public var device_type : Int?
	public var last_name : String?
	public var image : String?
	public var first_name : String?
	public var email : String?
	public var device_token : String?
	public var user_id : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let loginData_list = LoginData.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of LoginData Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [LoginData]
    {
        var models:[LoginData] = []
        for item in array
        {
            models.append(LoginData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let loginData = LoginData(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: LoginData Instance.
*/
	required public init?(dictionary: NSDictionary) {

        phone = dictionary[ApiKeys.phone] as? String
        device_type = dictionary[ApiKeys.device_type] as? Int
        last_name = dictionary[ApiKeys.last_name] as? String
        image = dictionary[ApiKeys.image] as? String
        first_name = dictionary[ApiKeys.first_name] as? String
        email = dictionary[ApiKeys.email] as? String
        device_token = dictionary[ApiKeys.device_token] as? String
        user_id = dictionary[ApiKeys.user_id] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

        dictionary.setValue(self.phone, forKey: ApiKeys.phone)
		dictionary.setValue(self.device_type, forKey: ApiKeys.device_type)
		dictionary.setValue(self.last_name, forKey: ApiKeys.last_name)
		dictionary.setValue(self.image, forKey: ApiKeys.image)
		dictionary.setValue(self.first_name, forKey: ApiKeys.first_name)
		dictionary.setValue(self.email, forKey: ApiKeys.email)
		dictionary.setValue(self.device_token, forKey: ApiKeys.device_token)
		dictionary.setValue(self.user_id, forKey: ApiKeys.user_id)
		return dictionary
	}

    required init?(coder aDecoder: NSCoder)
        {
        //Returns an object initialized from data in a provided unarchiver.
        self.phone = aDecoder.decodeObject(forKey:ApiKeys.phone) as? String
        self.device_type = aDecoder.decodeObject(forKey:ApiKeys.device_type) as? Int
        self.last_name = aDecoder.decodeObject(forKey:ApiKeys.last_name) as? String
        self.image = aDecoder.decodeObject(forKey:ApiKeys.image) as? String
        self.first_name = aDecoder.decodeObject(forKey:ApiKeys.first_name) as? String
        self.email = aDecoder.decodeObject(forKey:ApiKeys.email) as? String
        self.device_token = aDecoder.decodeObject(forKey:ApiKeys.device_token) as? String
        self.user_id = aDecoder.decodeObject(forKey:ApiKeys.user_id) as? Int
    }
    
    func encode(with aCoder: NSCoder)
        {
          //Encodes the given object using provided archiver.
            aCoder.encode(self.phone, forKey: ApiKeys.phone)
            aCoder.encode(self.device_type, forKey: ApiKeys.device_type)
            aCoder.encode(self.last_name, forKey: ApiKeys.last_name)
            aCoder.encode(self.image, forKey: ApiKeys.image)
            aCoder.encode(self.first_name, forKey: ApiKeys.first_name)
            aCoder.encode(self.email, forKey: ApiKeys.email)
            aCoder.encode(self.device_token, forKey: ApiKeys.device_token)
            aCoder.encode(self.user_id, forKey: ApiKeys.user_id)
        }
}
