//
//  KPI_ApplicationUITests1.swift
//  KPI-ApplicationUITests1
//
//  Created by Pattaragun Chimphet on 17/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import XCTest

class KPI_ApplicationUITests1: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Scoring Page"]/*[[".cells.staticTexts[\"Scoring Page\"]",".staticTexts[\"Scoring Page\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Pimonwan Sutmee"]/*[[".cells.staticTexts[\"Pimonwan Sutmee\"]",".staticTexts[\"Pimonwan Sutmee\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Scoring Page").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .textField).element(boundBy: 0).tap()
        element.children(matching: .textField).element(boundBy: 0).typeText("35")
        element.children(matching: .textField).element(boundBy: 1).tap()
        element.children(matching: .textField).element(boundBy: 1).typeText("7")
        element.children(matching: .textField).element(boundBy: 2).tap()
        element.children(matching: .textField).element(boundBy: 2).typeText("8")
        element.children(matching: .textField).element(boundBy: 3).tap()
        element.children(matching: .textField).element(boundBy: 3).typeText("8")
        element.children(matching: .textField).element(boundBy: 4).tap()
        element.children(matching: .textField).element(boundBy: 4).typeText("80")
        element.children(matching: .textField).element(boundBy: 5).tap()
        element.children(matching: .textField).element(boundBy: 5).typeText("80")
        element.children(matching: .textField).element(boundBy: 6).tap()
        element.children(matching: .textField).element(boundBy: 6).typeText("5")
        element.children(matching: .textField).element(boundBy: 7).tap()
        element.children(matching: .textField).element(boundBy: 7).typeText("8")
        app.buttons["Submit"].tap()
        app.buttons["Save"].tap()
        
    }

}
