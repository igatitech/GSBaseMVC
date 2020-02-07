//
//  Result.swift
//  BaseProject_MVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//


import Foundation

public class Result {
	public var status : Int?
	public var message : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let result_list = Result.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Result Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Result]
    {
        var models:[Result] = []
        for item in array
        {
            models.append(Result(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let result = Result(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Result Instance.
*/
	required public init?(dictionary: NSDictionary) {

        status = dictionary[ApiKeys.status] as? Int
        message = dictionary[ApiKeys.message] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.status, forKey: ApiKeys.status)
		dictionary.setValue(self.message, forKey: ApiKeys.message)

		return dictionary
	}

}
