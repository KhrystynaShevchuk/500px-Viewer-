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
    
    func updatePhotoWithImage (photo: Photo?, completion:() -> () ) {
        guard let photo = photo else {
            return
        }
        
        let name = "image\(photo.id ?? 0)"
        
        if let data = FileSystem().getFile(name) {   
            photo.image = UIImage(data: data)
            completion()

        } else {
            DownloadManager.shared.startDownload(photo) {
                completion()
            }
        }        
    }
}