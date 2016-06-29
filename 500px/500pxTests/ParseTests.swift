//
//  ParseTests.swift
//  p500px
//
//  Created by KhrystynaShevchuk on 6/29/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import p500px

class ParseTests: XCTestCase {
    
    var photos = [Photo]()
    
    override func setUp() {
        super.setUp()
        
        testLoadData()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadData() {
        let photosApi = PhotosAPI()
        photosApi.downloadPhotos { (photos) in
            self.photos = photos
            XCTAssertNotNil(self.photos, "my testing is bad")
        }
    }
    
    func testParseOfPhotoModel() {
        
        
        if let path = NSBundle.mainBundle().pathForResource("mockPhotoJSON", ofType: "") {
            
            if let jsonData = NSData(contentsOfFile: path) {
                let json = JSON(data: jsonData)
                
                let photo = Photo.photoFromResponse(json)
                let id = 160697069
                
                XCTAssertEqual(photo.id, id)
            }
            
        } else {
            XCTFail("Invalid filename/path")
        }
    }
}