//
//  DummyImages.swift
//  GSBaseMVC
//
//  Created by iGatiTech on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class DummyImages {
	public var id : String?
	public var author : String?
	public var width : Int?
	public var height : Int?
	public var url : String?
	public var download_url : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let dummyImages = DummyImages.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of DummyImages Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [DummyImages]
    {
        var models:[DummyImages] = []
        for item in array
        {
            models.append(DummyImages(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let dummyImages = DummyImages(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: DummyImages Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? String
		author = dictionary["author"] as? String
		width = dictionary["width"] as? Int
		height = dictionary["height"] as? Int
		url = dictionary["url"] as? String
		download_url = dictionary["download_url"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.author, forKey: "author")
		dictionary.setValue(self.width, forKey: "width")
		dictionary.setValue(self.height, forKey: "height")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.download_url, forKey: "download_url")

		return dictionary
	}

}
