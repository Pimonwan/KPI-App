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
    
    func iClickScoringPage(){
        scoringTab.tap()
        chooseFisrtUser.tap()
    }
}

