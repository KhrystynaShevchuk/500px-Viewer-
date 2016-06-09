//
//  FileSystem.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/7/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

class FileSystem {
    
    func getFile(name: String) -> NSData? {
        let path = NSFileManager.cachesDir() + "/\(name)"
        print(path)
        
        return NSFileManager.defaultManager().contentsAtPath(path)
    }
    
    func saveFile(name: String, data: NSData) {
        let path = NSFileManager.cachesDir() + "/\(name)"
        print(path)
        
        NSFileManager.defaultManager().createFileAtPath(path, contents: data, attributes: nil)
    }
}