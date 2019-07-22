//
//  ScoringScreen.swift
//  KPI-ApplicationUITests1
//
//  Created by Pattaragun Chimphet on 22/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import XCTest
class ScoringScreen{
    private lazy var app = XCUIApplication()
    private lazy var celllistTodo:XCUIElementQuery = app.tables.cells
    private lazy var scoringTab = app/*@START_MENU_TOKEN@*/.staticTexts["Scoring Page"]/*[[".cells.staticTexts[\"Scoring Page\"]",".staticTexts[\"Scoring Page\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private lazy var chooseFisrtUser = app.cells.containing(.staticText, identifier:"Pimonwan Sutmee").staticTexts["89503"]
    private lazy var Presentation = app.tables.cells.containing(.staticText, identifier:"Presentation").children(matching: .textField).element
    private lazy var Tech = app.tables.cells.containing(.staticText, identifier:"Tech Testing").children(matching: .textField).element
    private lazy var Innovation = app.tables.cells.containing(.staticText, identifier:"Innovation").children(matching: .textField).element
    private lazy var Teamwork = app.tables.cells.containing(.staticText, identifier:"Practice and Teamwork").children(matching: .textField).element
    private lazy var UnitTest = app.tables.cells.containing(.staticText, identifier:"Unit Test Coverage").children(matching: .textField).element
    private lazy var Automate = app.tables.cells.containing(.staticText, identifier:"Automate Testign").children(matching: .textField).element
    private lazy var onTime = app.tables.cells.containing(.staticText, identifier:"On time delivery (Story point deviation)").children(matching: .textField).element
    private lazy var PDdemo = app.tables.cells.containing(.staticText, identifier:"Product Demo").children(matching: .textField).element
    private lazy var submit = app.tables.buttons["Submit"]
    //private lazy var error = app.alerts.staticTexts as! String
//    private lazy var score1 = app.tables.cells.containing(.staticText, identifier:"Tech Testing").firstMatch.value as! String


    
    func iClickScoringPageAndTypeScore(){
        scoringTab.tap()
        chooseFisrtUser.tap()
        Tech.tap()
        Tech.typeText("35")
        Innovation.tap()
        Innovation.typeText("7")
        Presentation.tap()
        Presentation.typeText("8")
        Teamwork.tap()
        Teamwork.typeText("8")
        UnitTest.tap()
        UnitTest.typeText("80")
        Automate.tap()
        Automate.typeText("80")
        onTime.tap()
        onTime.typeText("5")
        PDdemo.tap()
        PDdemo.typeText("8")
        Tech.tap()
        submit.tap()
        //XCTAssertEqual("Tech Testing", score1)
        
    }
    
    func iClickScoringPage(){
        
        scoringTab.tap()
        chooseFisrtUser.tap()
        //print(error)
        //XCTAssertEqual(error, "network error: Could not connect to the server.")
    }
}

