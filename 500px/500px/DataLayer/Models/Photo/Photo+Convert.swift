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
        
        if let description = json["description"].string {
            photo.description = description
        }
        
        if let createdAt = json["createdAt"].string {
            photo.createdAt = createdAt
        }
        
        if let imageURL = json["image_url"].array {
            if imageURL.count >= 2 {
                photo.smallImageURL = String(imageURL[0])
                photo.bigImageURL = String(imageURL[1])
            }
        }
        
        return photo
    }
}