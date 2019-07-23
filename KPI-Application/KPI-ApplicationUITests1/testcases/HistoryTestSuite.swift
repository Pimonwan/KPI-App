//
//  ScoringTestSuite.swift
//  KPI-ApplicationUITests1
//
//  Created by Pattaragun Chimphet on 22/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//
import XCTest

class HistoryTestSuite:KPI_ApplicationUITests1{
    
    private lazy var history = History()
    
    func test_history_001_userScreen(){
        XCTContext.runActivity(named: "View User's history screen") { _ in
            
            
        }
    }
    
    func test_history_002_YearUserScreen(){
        XCTContext.runActivity(named: "View user's history each year") { _ in
            
            
        }
    }
    
    func test_history_003_AdminView(){
        XCTContext.runActivity(named: "Admin view user history") { _ in
            
            
        }
    }
    
    func test_history_004_SearchUser(){
        XCTContext.runActivity(named: "Search user by Name") { _ in
            
            
        }
    }
    
    func test_history_005_SearchUser2(){
        XCTContext.runActivity(named: "Search user by id") { _ in
            
            
        }
    }
    
    func test_history_006_SearchUser3(){
        XCTContext.runActivity(named: "Search user by year") { _ in
            
            
        }
    }
  
    
}
