/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

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
