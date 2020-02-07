//
//  Login.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class Login {
	public var message : String?
	public var status : Int?
	public var data : LoginData?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let login_list = Login.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Login Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Login]
    {
        var models:[Login] = []
        for item in array
        {
            models.append(Login(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let login = Login(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Login Instance.
*/
	required public init?(dictionary: NSDictionary) {

        message = dictionary[ApiKeys.message] as? String
		status = dictionary[ApiKeys.status] as? Int
        if (dictionary[ApiKeys.data] != nil) { data = LoginData(dictionary: dictionary[ApiKeys.data] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

        dictionary.setValue(self.message, forKey: ApiKeys.message)
        dictionary.setValue(self.status, forKey: ApiKeys.status)
        dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: ApiKeys.data)

		return dictionary
	}
}
