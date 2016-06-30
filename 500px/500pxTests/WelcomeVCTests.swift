//
//  WelcomeVCTests.swift
//  p500px
//
//  Created by KhrystynaShevchuk on 6/30/16.
//  Copyright © 2016 KhrystynaShevchuk. All rights reserved.
//

import UIKit
import XCTest
@testable import p500px

class WelcomeVCTests: XCTestCase {
    
    // MARK: - properties
    
    let welcomeVC = WelcomeVC()
    
    // MARK: - general methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testLoadView() {
        let welcomeItemView = welcomeVC.getItemView(WelcomeItem(), index: 1, width: 100, height: 100)
        XCTAssertNotNil(welcomeItemView, "bad command to get welcomeItemView")
    }
    
    // MARK: - test frames of itemView
    
    func testExpectedFrame() {
        let viewFrame = welcomeVC.viewFrame(index: 1, width: 600, height: 200)
        XCTAssertEqual(viewFrame.origin.x, 600)
    }
    
    func testFrameLargeIndex() {
        let viewFrame = welcomeVC.viewFrame(index: 999, width: 600, height: 200)
        XCTAssertEqual(viewFrame.origin.x, (999 * 600))
    }
    
    func testFrameZeroIndex() {
        let viewFrame = welcomeVC.viewFrame(index: 0, width: 600, height: 200)
        XCTAssertEqual(viewFrame.origin.x, 0)
    }
    
    func testFrameNegativeIndex() {
        let viewFrame = welcomeVC.viewFrame(index: -10, width: 600, height: 200)
        XCTAssertEqual(viewFrame.origin.x, (-10 * 600))
    }
    
    func testFrameNegativeWidth() {
        let viewFrame = welcomeVC.viewFrame(index: 2, width: -600, height: 200)
        XCTAssertEqual(viewFrame.origin.x, -1200)
    }
    
    func testFrameZeroWidth() {
        let viewFrame = welcomeVC.viewFrame(index: 2, width: 0, height: 200)
        XCTAssertEqual(viewFrame.origin.x, 0)
    }
    
    func testFrameBigWidth() {
        let viewFrame = welcomeVC.viewFrame(index: 2, width: 9000, height: 200)
        XCTAssertEqual(viewFrame.origin.x, 18000)
    }
    
    func testFrameNegativeWidthNegativeIndex() {
        let viewFrame = welcomeVC.viewFrame(index: -2, width: -600, height: 200)
        XCTAssertEqual(viewFrame.origin.x, 1200)
    }
    
    func testFrameZeroWidthZeroIndex() {
        let viewFrame = welcomeVC.viewFrame(index: 0, width: 0, height: 200)
        XCTAssertEqual(viewFrame.origin.x, 0)
    }
    
    
    // MARK: - Button visible
    
    func testIsButtonVisible() {
        let expectedCurrentPage = 1
        let buttonIsVisible = welcomeVC.isButtonVisible(expectedCurrentPage, totalCount: 4)
        
        XCTAssertTrue(buttonIsVisible, "Button isn't visible")
    }
    
    func testIsNotButtonVisible() {
        let expectedCurrentPage = 5
        let buttonIsNotVisible = welcomeVC.isButtonVisible(expectedCurrentPage, totalCount: 4)
        
        XCTAssertTrue(buttonIsNotVisible, "Impossible, button is visible on non-existent page")
    }
    
    func testIsButtonInvisible() {
        let expectedCurrentPage = -1
        let buttonIsNotVisible = welcomeVC.isButtonVisible(expectedCurrentPage, totalCount: 1)
        
        XCTAssertTrue(buttonIsNotVisible, "Impossible, button is visible on non-existent page")
    }
    
    func testIsButtonInvisibleWithZeroCount() {
        let expectedCurrentPage = -2
        let buttonIsNotVisible = welcomeVC.isButtonVisible(expectedCurrentPage, totalCount: 0)
        
        XCTAssertTrue(buttonIsNotVisible, "Impossible, button is visible on non-existent page")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
