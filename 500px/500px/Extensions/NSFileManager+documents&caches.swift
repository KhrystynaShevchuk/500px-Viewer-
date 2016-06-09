//
//  NSFileManager+documents&caches.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/7/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

extension NSFileManager {
    
    class func documentsDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as [String]
        return paths[0]
    }
    
    class func cachesDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true) as [String]
        return paths[0]
    }
}