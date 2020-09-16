//
//  LyricSceneNotFoundLyric.swift
//  MyLyricsUITests
//
//  Created by Jorge Luis Peña López on 15/09/20.
//  Copyright © 2020 Jorge Dev. All rights reserved.
//

import XCTest

class LyricSceneNotFoundLyricUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLyricSearchNotFound() throws {
        let app = XCUIApplication()
        let txtArtistIdentify = "txtArtist"
        let txtSongTitleIdentify = "txtSongTitle"
        let btnSearchLyricIdentify = "btnSearchLyric"
        let viewLyricDetailIdentify = "viewLyricDetail"
        let lblDetailTitleSongLyricIdentify = "lblDetailTitleSongLyric"
        
        let artist = "Queen12"
        let songTitle = "Bohemian Rhapsody"
        
        app.textFields[txtArtistIdentify].tap()
        if !app.keys["a"].waitForExistence(timeout: 5) {
            XCTFail("The keyboard could not be found. Use keyboard shortcut COMMAND + SHIFT + K while simulator has focus on text input")
        }
        _ = app.textFields[txtArtistIdentify].waitForExistence(timeout: 10)
        app.textFields[txtArtistIdentify].typeText(artist)
        
        app.textFields[txtSongTitleIdentify].tap()
        if !app.keys["a"].waitForExistence(timeout: 5) {
            XCTFail("The keyboard could not be found. Use keyboard shortcut COMMAND + SHIFT + K while simulator has focus on text input")
        }
        _ = app.textFields[txtSongTitleIdentify].waitForExistence(timeout: 10)
        app.textFields[txtSongTitleIdentify].typeText(songTitle)
        
        app.buttons[btnSearchLyricIdentify].tap()
        
        XCTAssertFalse(app.otherElements[viewLyricDetailIdentify].waitForExistence(timeout: 5))
        XCTAssertFalse(app.otherElements[lblDetailTitleSongLyricIdentify].waitForExistence(timeout: 5))
    }

}
