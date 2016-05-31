//
//  BaseAPI.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/31/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

class BaseAPI {
    
    var urlGenerating = URLFactory()
        
    func GETrequest(link: String, completion: (data: NSData?, error: String?, statusCode: Int)) {
        
        let urlString = urlGenerating.urlReceiveImage
//        if let URL = NSURL(string: urlString) {
//            let request = NSMutableURLRequest(URL: URL)
//            request.HTTPMethod = "GET"
//            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
//                if let unwrappedData = data {
//                    if let data = json.dataUsingEncoding(NSUTF8StringEncoding) {
//                        let json = JSON(data: data)
//                        print("response - data : json\n \(json)")
//                    } else {
//                        let string = NSString(data: unwrappedData, encoding: NSUTF8StringEncoding)
//                        print("response - data : string\n \(string)")
//                    }
//                } else {
//                    print("response - data == nil")
//                }
//            }).resume()
//        }
    }
}