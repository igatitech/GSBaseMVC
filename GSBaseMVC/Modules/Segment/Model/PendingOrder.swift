//
//  PendingOrder.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class PendingOrder {
	public var data : Array<PendingData>?
	public var status : Int?
	public var message : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let pendingOrder_list = PendingOrder.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of PendingOrder Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [PendingOrder]
    {
        var models:[PendingOrder] = []
        for item in array
        {
            models.append(PendingOrder(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let pendingOrder = PendingOrder(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: PendingOrder Instance.
*/
	required public init?(dictionary: NSDictionary) {

        if (dictionary["data"] != nil) { data = PendingData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
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
