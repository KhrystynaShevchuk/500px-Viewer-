
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

    let url: String
    let photo: Photo?
    let imageSize: ImageSize
    
    init(url: String, imageSize: ImageSize, photo: Photo) {
        self.url = url
        self.imageSize = imageSize
        self.photo = photo
    }
    
    override func main() {
        if cancelled {
            print("operation was cancelled")
            return
        }
        
        var imageData: NSData?
        if let url = NSURL(string: url ?? "") {
            imageData = NSData(contentsOfURL:url)
        }
        
        if cancelled {
            print("operation was cancelled")
            return
        }
        
        // Data is downloaded
        if imageData?.length > 0 {
            let name = photo?.fileName(imageSize)
            saveReceivedImage(imageData, name: name)

            print("downloaded")
        }
        else {
            print("failed")
        }
    }
    
    private func saveReceivedImage(imageData: NSData?, name: String?) {
        guard let imageData = imageData else {
            return
        }
        
        guard let name = name else {
            return
        }
        
        let image = UIImage(data: imageData)
        FileSystem().saveFile(name, data: imageData)
        
        if imageSize == .Small {
            photo?.smallImage = image
        } else if imageSize == .Big {
            photo?.bigImage = image
        }
    }
}