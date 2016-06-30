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
        return NSFileManager.defaultManager().contentsAtPath(pathString(name))
    }
    
    func saveFile(name: String, data: NSData) {
        NSFileManager.defaultManager().createFileAtPath(pathString(name), contents: data, attributes: nil)
    }
    
    func pathString(name: String) -> String {
        let path = NSFileManager.cachesDir() + "/\(name)"
        print(path)

        return path
    }
}