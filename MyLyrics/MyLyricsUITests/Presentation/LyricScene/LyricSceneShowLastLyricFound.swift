//
//  LyricSceneShowLastLyricFound.swift
//  MyLyricsUITests
//
//  Created by Jorge Luis Peña López on 16/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import XCTest

class LyricSceneShowLastLyricFound: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShowLastLyricFound() throws {
        
        let app = XCUIApplication()
        let btnShowLastLyricFoundIdentify = "btnShowLastLyricFound"
        let viewLyricDetailIdentify = "viewLyricDetail"
        
        app.buttons[btnShowLastLyricFoundIdentify].tap()
        
        XCTAssertTrue(app.otherElements[viewLyricDetailIdentify].waitForExistence(timeout: 5))
    }

}
