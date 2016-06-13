//
//  ImageManager.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/7/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation
import UIKit

class ImageManager {
    
    func updatePhoto (photo: Photo?, withImageSize imageSize: ImageSize, completion:() -> () ) {
        guard let photo = photo else {
            return
        }
        
        let name = photo.fileName(imageSize) ?? ""
        
        if let data = FileSystem().getFile(name) {
            let image = UIImage(data: data)
            if imageSize == .Small {
                photo.smallImage = image
            } else if imageSize == .Big {
                photo.bigImage = image
            }
            completion()

        } else {
            let url = (imageSize == .Small) ? photo.smallImageURL : photo.bigImageURL
            DownloadManager.shared.startDownload(photo, url: url ?? "", imageSize: imageSize, completion: {
                completion()
            })
        }
    }
}