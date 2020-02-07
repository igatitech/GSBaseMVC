//
//  PastData.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class PastData {
	public var order_id : String?
	public var id : String?
	public var order_date : String?
	public var payment_method : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let pastData_list = PastData.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of PastData Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [PastData]
    {
        var models:[PastData] = []
        for item in array
        {
            models.append(PastData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let pastData = PastData(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: PastData Instance.
*/
	required public init?(dictionary: NSDictionary) {

		order_id = dictionary["order_id"] as? String
		id = dictionary["id"] as? String
		order_date = dictionary["order_date"] as? String
		payment_method = dictionary["payment_method"] as? String
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
		dictionary.setValue(self.payment_method, forKey: "payment_method")

		return dictionary
	}

}
