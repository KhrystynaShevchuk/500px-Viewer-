//
//  URLFactory.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/31/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

class URLFactory {
    
    private let baseURL = "https://api.500px.com"
    private let consumerKey = "consumer_key"
    private let consumerKeyValue = "SvNiDuU76T8cVlJnP7P6QBOrfMsmEHB87XBVBrTO"
    private let baseImageURL = "/v1/photos?feature=popular&rpp=100"

    func downloadPhotos() -> String {
        return "\(baseURL)\(baseImageURL)&\(consumerKey)=\(consumerKeyValue)"
    }
}