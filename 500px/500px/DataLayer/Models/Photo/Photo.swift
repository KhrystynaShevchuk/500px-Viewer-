//
//  Photo.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/31/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit
import SwiftyJSON

class Photo {
    
    var id: Int?
    var name: String?
    var description: String?
    var createdAt: String?
    
    var smallImageURL: String?
    var bigImageURL: String?
    
    var smallImage: UIImage?
    var bigImage: UIImage?
}