//
//  ImageDownloader.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/6/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader: NSOperation {

    let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    override func main() {
        if cancelled {
            print("operation was cancelled")
            return
        }
        
        var imageData: NSData?
        if let url = NSURL(string: photo.imageURL ?? "") {
            imageData = NSData(contentsOfURL:url)
        }
        
        if cancelled {
            print("operation was cancelled")
            return
        }
        
        // Data is downloaded
        if imageData?.length > 0 {
                        
            if let imageData = imageData {
                FileSystem().saveFile("image\(photo.id ?? 0)", data: imageData)
                photo.image = UIImage(data: imageData)
            }
            print("downloaded")
        }
        else {
            print("failed")
        }
    }
}