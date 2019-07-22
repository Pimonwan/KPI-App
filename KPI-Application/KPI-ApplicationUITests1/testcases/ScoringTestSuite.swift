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
    
    func test_scoring_002_networkFailed(){
        XCTContext.runActivity(named: "Network Failed") { _ in
            adminScoring.addUserScoreFailed()
            sleep(3)
        }
    }
    
}
