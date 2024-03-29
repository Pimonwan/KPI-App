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
    private lazy var chooseFisrtUser = app.cells.firstMatch
    private lazy var Presentation = app.tables.cells.containing(.staticText, identifier:"Presentation").children(matching: .textField).element
    private lazy var Tech = app.tables.cells.containing(.staticText, identifier:"Tech Testing").children(matching: .textField).element
    private lazy var Innovation = app.tables.cells.containing(.staticText, identifier:"Innovation").children(matching: .textField).element
    private lazy var Teamwork = app.tables.cells.containing(.staticText, identifier:"Practice and Teamwork").children(matching: .textField).element
    private lazy var UnitTest = app.tables.cells.containing(.staticText, identifier:"Unit Test Coverage").children(matching: .textField).element
    private lazy var Automate = app.tables.cells.containing(.staticText, identifier:"Automate Testign").children(matching: .textField).element
    private lazy var onTime = app.tables.cells.containing(.staticText, identifier:"On time delivery (Story point deviation)").children(matching: .textField).element
    private lazy var PDdemo = app.tables.cells.containing(.staticText, identifier:"Product Demo").children(matching: .textField).element
    private lazy var submit = app.tables.buttons["Submit"]

    private lazy var TechScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 0)
    private lazy var InnovationScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 1)
    private lazy var PresentationScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 2)
    private lazy var TeamworkScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 3)
    private lazy var UnitTestScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 4)
    private lazy var AutomateTestScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 5)
    private lazy var OntimeScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 6)
    private lazy var ProductDemoScore = app.tables.cells.staticTexts.matching(identifier: "score").element(boundBy: 7)
    private lazy var KPIRate = app.tables.staticTexts.element(boundBy: 5)
    private lazy var TotalScore = app.tables.staticTexts.element(boundBy: 6)
    private lazy var save = app.tables.buttons["Save"]
    //private lazy var popupVC = UIViewController(nibName: "PopUpView", bundle: nil)
    private lazy var rate = app.tables.buttons["Rate"]
    private lazy var close = app.buttons["Close"]

    
    func iClickScoringPageAndTypeScore(score1:String,score2:String,score3:String,score4:String,score5:String,score6:String,score7:String,score8:String){
        scoringTab.tap()
        chooseFisrtUser.tap()
        Tech.tap()
        Tech.typeText(score1)
        Innovation.tap()
        Innovation.typeText(score2)
        Presentation.tap()
        Presentation.typeText(score3)
        Teamwork.tap()
        Teamwork.typeText(score4)
        UnitTest.tap()
        UnitTest.typeText(score5)
        Automate.tap()
        Automate.typeText(score6)
        onTime.tap()
        onTime.typeText(score7)
        PDdemo.tap()
        PDdemo.typeText(score8)
        Tech.tap()
        submit.tap()
       

    }
    
    
    func iClickScoringPage(){
        
        scoringTab.tap()
        chooseFisrtUser.tap()
        sleep(3)
    }
    
    func iClickScoringPageAndTypeScoreNotFull(score1:String,score2:String,score3:String){
        scoringTab.tap()
        chooseFisrtUser.tap()
        Tech.tap()
        Tech.typeText(score1)
        Innovation.tap()
        Innovation.typeText(score2)
        Presentation.tap()
        Presentation.typeText(score3)
        submit.tap()
        sleep(3)
    }
    
    func verifySuccessCase(){
        XCTAssertEqual(TechScore.label, "2")
        XCTAssertEqual(InnovationScore.label, "4")
        XCTAssertEqual(PresentationScore.label, "4")
        XCTAssertEqual(TeamworkScore.label, "4")
        XCTAssertEqual(UnitTestScore.label, "4")
        XCTAssertEqual(AutomateTestScore.label, "4")
        XCTAssertEqual(OntimeScore.label, "3")
        XCTAssertEqual(ProductDemoScore.label, "4")
        XCTAssertEqual(KPIRate.label, "3.5")
        XCTAssertEqual(TotalScore.label, "70.0")
        save.tap()
        sleep(3)
    }
    
    func verifyNetworkError(){
        XCTAssertEqual(app.alerts.element.label, "Network error.")
        XCTAssert(app.alerts.element.staticTexts["Could not connect to the server."].exists)
    }
    
    func verifyFillNotComplete(){
        
        XCTAssertEqual(app.alerts.element.label, "Can not submit.")
        XCTAssert(app.alerts.element.staticTexts["Please fill all scores."].exists)
    }
    
    func verifyAlertIncorrect(){
        XCTAssertEqual(app.alerts.element.label, "Can not submit.")
        XCTAssert(app.alerts.element.staticTexts["Some scores not correct."].exists)
    }
    
    func iClickRate(){
        rate.tap()
    }
    func verifyPopup(){
        XCTAssertTrue(close.isHittable, "")
    }
}

