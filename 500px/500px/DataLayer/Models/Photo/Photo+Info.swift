//
//  Photo+Info.swift
//  500px
//
//  Created by KhrystynaShevchuk on 6/13/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

extension Photo {
    
    func fileName(imageSize: ImageSize) -> String? {
        var name: String?
        switch imageSize {
        case .Small:
            name = "smallImage\(id ?? 0)"
        case .Big:
            name = "bigImage\(id ?? 0)"
        }
        
        return name
    }
    
    func getDescription() -> String {
        let photoDescription = "Image name:\n\t\(name ?? "")\n\nDescription:\n\t\(description ?? "-")\n\nCreating date:\n\t\(createdAt ?? "-")"
        return photoDescription
    }
}