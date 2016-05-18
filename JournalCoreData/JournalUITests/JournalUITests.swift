//
//  JournalUITests.swift
//  JournalUITests
//
//  Created by Caleb Hicks on 9/29/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import XCTest

class JournalUITests: XCTestCase {
    
    private let testTitle = "Test Title"
    private let testBodyText = "Lorem ipsum doler init."
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Part 2
    
    func testAddingAndEditingEntry() {

        let testAddBodyString = "Sample text to add before lorem ipsum. "
        
        let app = XCUIApplication()
        app.navigationBars["Journal.EntryListTableView"].buttons["Add"].tap()
        app.buttons["Clear"].tap()
        
        let element = app.otherElements.containingType(.NavigationBar, identifier:"Title").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        let textField = element.childrenMatchingType(.TextField).element
        textField.tap()
        textField.typeText(testTitle)
        
        let textView = element.childrenMatchingType(.TextView).element
        textView.tap()
        textView.typeText(testBodyText)
        
        let saveButton = app.navigationBars["Title"].buttons["Save"]
        saveButton.tap()
        
        app.tables.staticTexts[testTitle].tap()
        
        textView.tap()
        textView.typeText(testAddBodyString)
        
        saveButton.tap()
        
        app.tables.staticTexts[testTitle]
        
        let testEntry = EntryController.sharedController.entries.first
        
        if let entry = testEntry {
            XCTAssert(entry.title == testTitle && entry.text == testBodyText, "Added entry does not match what was entered.")
        }
        
    }
    
        
}
