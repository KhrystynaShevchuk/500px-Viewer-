//
//  PhotosAPI.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/31/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotosAPI: BaseAPI {
    
    let urlFactory = URLFactory()
    
    func downloadPhotos(completion: (photos: [Photo]) -> ()) {
        let url = urlFactory.downloadPhotos()
        GETrequest(url) { (data, error, statusCode) in
            guard let data = data else {
                 completion(photos: [])
                return
            }
            
            let json = JSON(data: data)
            var photos = [Photo]()
            for (_, subJson):(String, JSON) in json["photos"] {
                let photo = Photo.photoFromResponse(subJson)
                photos.append(photo)
            }
            
            completion(photos: photos)
        }
    }
}