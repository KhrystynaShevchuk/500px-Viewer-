//
//  Photo+Convert.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/1/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Photo {
    
    class func photoFromResponse(json: JSON) -> Photo {
        let photo = Photo()
        
        if let id = json["id"].int {
            photo.id = id
        }
        if let name = json["name"].string {
            photo.name = name
        }
        if let imageURL = json["image_url"].string {
            photo.imageURL = imageURL
        }
        return photo
    }
}