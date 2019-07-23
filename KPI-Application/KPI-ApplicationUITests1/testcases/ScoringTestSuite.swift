//
//  ScoringTestSuite.swift
//  KPI-ApplicationUITests1
//
//  Created by Pattaragun Chimphet on 22/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//
import XCTest

class ScoringTestSuite:KPI_ApplicationUITests1{
    
    private lazy var adminScoring = AdminScoring()
    
    func test_scoring_001_success(){
        XCTContext.runActivity(named: "AddNewScore") { _ in
            adminScoring.addUserScore()
            sleep(3)
        }
    }
    
    func test_scoring_002_cannotsubmit(){
        XCTContext.runActivity(named: "Cannot submit") { _ in
            adminScoring.submitFillnotFull()
            sleep(3)
        }
    }
    
    func test_scoring_003_cannotsubmit2(){
        XCTContext.runActivity(named: "Fill incorrect data") { _ in
            adminScoring.submitFillIncorrect()
            sleep(3)
        }
    }
    
    func test_scoring_004_ratebuttonclickable(){
        XCTContext.runActivity(named: "Rate button is clickable") { _ in
            adminScoring.rateisclickable()
            sleep(3)
        }
    }
    
    func test_scoring_008_networkFailed(){
        XCTContext.runActivity(named: "Network Failed") { _ in
            adminScoring.addUserScoreFailed()
            sleep(3)
        }
    }
    
}
