//
//  _00pxTests.swift
//  500pxTests
//
//  Created by KhrystynaShevchuk on 5/27/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import XCTest
@testable import p500px

class URLTests: XCTestCase {
    
    let generateUrl = URLFactory()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDownloadPhotos() {
        let rightUrl = "https://api.500px.com/v1/photos?feature=popular&rpp=100&image_size[]=2&image_size[]=5&consumer_key=SvNiDuU76T8cVlJnP7P6QBOrfMsmEHB87XBVBrTO"
        let url = generateUrl.downloadPhotos()
        
        XCTAssertEqual(rightUrl, url, "it generates incorrect URL")
    }
}
