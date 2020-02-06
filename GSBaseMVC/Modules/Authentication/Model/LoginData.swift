/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

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
