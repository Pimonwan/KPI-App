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
        scoringScreen.iClickScoringPageAndTypeScore()
        
    }
    
    func addUserScoreFailed(){
        scoringScreen.iClickScoringPage()
    }
}