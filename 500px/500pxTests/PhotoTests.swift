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

class PhotoTests: XCTestCase {
    
    // MARK: - general methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testParseOfPhotoModel() {
        guard let path = NSBundle.mainBundle().pathForResource("mockPhotoJSON", ofType: "") else {
            return XCTFail("Invalid filename/path")
        }
            
        guard let jsonData = NSData(contentsOfFile: path) else {
                return XCTFail("Problem with getting Json data")
        }
        
        let json = JSON(data: jsonData)
        let photo = Photo.photoFromResponse(json)

        let expectedId = 160697069
        let expectedName = "Mt. Robson"
        let expectedDescription = "Scene of Mt. Robson from a great backpacking trip through the Canadian Rockies. The highest mountain in the range."
        let expectedCreatedAt = "2016-06-28T13:11:50-04:00"
        let expectedSmallImageURL = "https://drscdn.500px.org/photo/160697069/q%3D50_w%3D140_h%3D140/d259e1ad00d910badaf5d65acf4e65e4?v=3"
        let expectedBigImageURL = "https://drscdn.500px.org/photo/160697069/m%3D1170_k%3D1_a%3D1/9e49101cde61a96e1fccb47080102a52"
        
        XCTAssertEqual(photo.id, expectedId)
        XCTAssertEqual(photo.name, expectedName)
        XCTAssertEqual(photo.description, expectedDescription)
        XCTAssertEqual(photo.createdAt, expectedCreatedAt)
        XCTAssertEqual(photo.smallImageURL, expectedSmallImageURL)
        XCTAssertEqual(photo.bigImageURL, expectedBigImageURL)
    }
    
    func testFileNameWithId() {
        let photo = Photo()
        photo.id = 160697069
        let expectedName = "smallImage\(photo.id ?? 0)"

        XCTAssertEqual(photo.fileName(.Small), expectedName)
    }
    
    func testFileNameWithouId() {
        let photo = Photo()
        let expectedName = "smallImage0"
        
        XCTAssertEqual(photo.fileName(.Small), expectedName)
    }
    
    func testBigFileNameWithouId() {
        let photo = Photo()
        photo.id = 160697069
        let expectedName = "bigImage\(photo.id ?? 0)"
        
        XCTAssertEqual(photo.fileName(.Big), expectedName)
    }
    
    func testBigFileNameWithId() {
        let photo = Photo()
        let expectedName = "bigImage0"
        
        XCTAssertEqual(photo.fileName(.Big), expectedName)
    }
}
