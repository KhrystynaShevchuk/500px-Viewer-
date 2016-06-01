//
//  BaseAPI.swift
//  500px
//
//  Created by KhrystynaShevchuk on 5/31/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import Foundation

class BaseAPI {
    
    func GETrequest(link: String, completion: (data: NSData?, error: String?, statusCode: Int) -> ()) {
        guard let URL = NSURL(string: link) else {
            completion(data:nil, error:nil, statusCode: 0)
            return
        }
  
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) in
            completion(data:data, error:error?.localizedDescription, statusCode: 0)
            
        }).resume()
    }

}