//
//  DownloadManager.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/6/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

class DownloadManager {
    
    static let shared = DownloadManager()
    
    var downloadsInProgress = [String : NSOperation]()
    var queue = NSOperationQueue()
    
    init() {
        queue.name = "Image Downloader Queue"
        queue.maxConcurrentOperationCount = 3
    }
    
    func startDownload(photo: Photo, completion:() -> ()) {
        guard let url = photo.imageURL else {
            return
        }
        
        if let _ = downloadsInProgress[url] {
            return
        }
        
        let imageDownload = ImageDownloader(photo: photo)
        imageDownload.completionBlock = {
            completion()
            print("Completed downloading url \(url)")
        }
        
        downloadsInProgress[url] = imageDownload
        queue.addOperation(imageDownload)
    }
    
    func cancelDownloadIfPossible(key: String) {
        guard let task = downloadsInProgress[key] else {
            return
        }
        
        task.cancel()
        downloadsInProgress.removeValueForKey(key)
    }
}