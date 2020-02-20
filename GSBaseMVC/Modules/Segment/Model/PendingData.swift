//
//  PendingData.swift
//  GSBaseMVC
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class PendingData {
	public var order_id : String?
	public var id : String?
	public var order_date : String?
	public var payment_status : String?
	public var total : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let pendingData_list = PendingData.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of PendingData Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [PendingData]
    {
        var models:[PendingData] = []
        for item in array
        {
            models.append(PendingData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let pendingData = PendingData(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: PendingData Instance.
*/
	required public init?(dictionary: NSDictionary) {

		order_id = dictionary["order_id"] as? String
		id = dictionary["id"] as? String
		order_date = dictionary["order_date"] as? String
		payment_status = dictionary["payment_status"] as? String
		total = dictionary["total"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.order_id, forKey: "order_id")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.order_date, forKey: "order_date")
		dictionary.setValue(self.payment_status, forKey: "payment_status")
		dictionary.setValue(self.total, forKey: "total")

		return dictionary
	}

}
