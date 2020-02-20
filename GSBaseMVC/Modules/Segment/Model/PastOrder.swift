//
//  PastOrder.swift
//  GSBaseMVC
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class PastOrder {
	public var data : Array<PastData>?
	public var status : Int?
	public var message : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let pastOrder_list = PastOrder.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of PastOrder Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [PastOrder]
    {
        var models:[PastOrder] = []
        for item in array
        {
            models.append(PastOrder(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let pastOrder = PastOrder(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: PastOrder Instance.
*/
	required public init?(dictionary: NSDictionary) {

        if (dictionary["data"] != nil) { data = PastData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
		status = dictionary["status"] as? Int
		message = dictionary["message"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.message, forKey: "message")

		return dictionary
	}

}
