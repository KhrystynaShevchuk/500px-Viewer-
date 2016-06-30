//
//  _00pxTests.swift
//  500pxTests
//
//  Created by KhrystynaShevchuk on 5/27/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import XCTest
@testable import p500px

class p500pxTests: XCTestCase {
    
    // MARK: - properties
    
    let generateUrl = URLFactory()
    let  fileSystem = FileSystem()
    let welcomeManager = WelcomeManager()
    var photos = [Photo]()
    
    // MARK: - general methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testDownloadPhotos() {
        let rightUrl = "https://api.500px.com/v1/photos?feature=popular&rpp=100&image_size[]=2&image_size[]=5&consumer_key=SvNiDuU76T8cVlJnP7P6QBOrfMsmEHB87XBVBrTO"
        let url = generateUrl.downloadPhotos()
        
        XCTAssertEqual(rightUrl, url, "it generates incorrect URL")
    }
    
    func testPathString() {
        let name = "smallImage160697069"
        let pathStr = fileSystem.pathString(name)
        
        XCTAssertNotNil(pathStr, "PathString is nill")
    }
    
    func testCountOfWelcomeItems() {
        let items = welcomeManager.getWelcomeItems()
        let count = items.count
        
        XCTAssertEqual(count, 3, "There is bad calculating of count")
    }
    
    func testZeroCountOfWelcomeItems() {
        let items = welcomeManager.getWelcomeItems()
        let count = items.count
        
        XCTAssertFalse(count == 0, "Impossible count of welcomeItems")
    }
}
