//
//  AdminScoring.swift
//  KPI-ApplicationUITests1
//
//  Created by Pattaragun Chimphet on 22/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import XCTest

class AdminScoring{
    private lazy var scoringScreen = ScoringScreen()
    
    
    func addUserScore(){
        scoringScreen.iClickScoringPageAndTypeScore(score1: "35", score2: "7", score3: "8", score4: "8", score5: "80", score6: "80", score7: "5", score8: "8")
        scoringScreen.verifySuccessCase()
        
    }
    
    func addUserScoreFailed(){
        scoringScreen.iClickScoringPage()
        scoringScreen.verifyNetworkError()
    }
    
    func submitFillnotFull(){
        scoringScreen.iClickScoringPageAndTypeScoreNotFull(score1: "35", score2: "7", score3: "8")
        scoringScreen.verifyFillNotComplete()
    }
    
    func submitFillIncorrect(){
        scoringScreen.iClickScoringPageAndTypeScore(score1: "35", score2: "70", score3: "8", score4: "8", score5: "80", score6: "80", score7: "5", score8: "8")
        scoringScreen.verifyAlertIncorrect()
    }
    
    func rateisclickable(){
        scoringScreen.iClickScoringPage()
        scoringScreen.iClickRate()
        scoringScreen.verifyPopup()
    }
}
