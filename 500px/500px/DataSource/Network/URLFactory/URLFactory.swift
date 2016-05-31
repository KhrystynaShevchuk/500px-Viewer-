//
//  URLFactory.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/31/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

class URLFactory {
    
    let baseURL = "https://api.500px.com"
//    let consumerKey = "SvNiDuU76T8cVlJnP7P6QBOrfMsmEHB87XBVBrTO"

    func generateURL(path: String) -> String {
        return "\(baseURL)\(path)"
    }
    
    func urlReceiveImage(link: String) -> String {
        return link
    }
}