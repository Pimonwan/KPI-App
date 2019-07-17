//
//  SummaryScoreViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/16/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit
import Alamofire

class SummaryScoreViewController: UIViewController {
    
    var actualScore: [[String]] = []
    var scores: [[String]] = []
    var totalScore: Double = 0
    var kpiRate: Double = 0
    var mTopicArray: [String] = []
    var mSubTopicArray: [[String]] = []
    
    var weight: [[Int]] = []
    var rate1: [[Int]] = []
    var rate2: [[Int]] = []
    var rate3: [[Int]] = []
    var rate4: [[Int]] = []
    var isLower: [[Int]] = []
    
    var indexOfTopic: Int = 0
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("actual : \(self.actualScore)")
        feedData()
        
    }
    
    func feedData(){
        AF.request("http://192.168.43.225:8081/api/kpi/5", method: .get).responseJSON { (response) in
            switch response.result{
            case .success :
                do{
                    let result = try JSONDecoder().decode(KpiFormResponse.self, from: response.data!)
                    let kpi = result.data.data.topicList
                    
                    for (index, _) in kpi.enumerated(){
                        // การเพิ่มข้อมูลครั้งแรกจำเป็นต้องเพิ่มอาเรย์เปล่าก่อนที่จะเพิ่มข้อมูล
                        self.mSubTopicArray.append([])
                        self.weight.append([])
                        self.rate1.append([])
                        self.rate2.append([])
                        self.rate3.append([])
                        self.rate4.append([])
                        self.isLower.append([])
                        for(index2, _) in kpi[index].subTopicList.enumerated(){
                            // เพิ่มหัวข้อย่อยลงในอาเรย์
                            let subTopic = kpi[index].subTopicList[index2].name
                            self.mSubTopicArray[index].append(subTopic)
                            
                            let weight = Int(kpi[index].subTopicList[index2].weight)
                            self.weight[index].append(weight)
                            let rate1 = Int(kpi[index].subTopicList[index2].rate1)
                            self.rate1[index].append(rate1!)
                            let rate2 = Int(kpi[index].subTopicList[index2].rate2)
                            self.rate2[index].append(rate2!)
                            let rate3 = Int(kpi[index].subTopicList[index2].rate3)
                            self.rate3[index].append(rate3!)
                            let rate4 = Int(kpi[index].subTopicList[index2].rate4)
                            self.rate4[index].append(rate4!)
                            
                            let isLower = kpi[index].subTopicList[index2].isLowerBetter
                            self.isLower[index].append(isLower)
                        }
                        // เพิ่มหัวข้อ
                        self.mTopicArray.append(kpi[index].name)
                    }
                    
                    // เพื่อรีเฟรชตาราง
                    
                    self.calculateScore()
                    self.mTableView.reloadData()
                }catch{
                    
                }
            case .failure(let error):
                print("network error: \(error.localizedDescription)")
            }
        }
    }
    
    func calculateScore(){
        var totalActual: Double = 0
        var score = -1
        
        for index in 0..<self.actualScore.count{
            self.scores.append([])
            for index2 in 0..<self.actualScore[index].count{
                var num = Int(self.actualScore[index][index2])
                
                if self.isLower[index][index2] == 0{
                    if num! <= self.rate1[index][index2]{
                        score = 1
                    }else if  num! <= self.rate2[index][index2] {
                        score = 2
                    }else if  num! <= self.rate3[index][index2] {
                        score = 3
                    }else if  num! <= self.rate4[index][index2] {
                        score = 4
                    }else{
                        score = 5
                    }
                }else{
                    if num! >= self.rate1[index][index2]{
                        score = 1
                    }else if  num! >= self.rate2[index][index2] {
                        score = 2
                    }else if  num! >= self.rate3[index][index2] {
                        score = 3
                    }else if  num! >= self.rate4[index][index2] {
                        score = 4
                    }else{
                        score = 5
                    }
                }
                self.scores[index].append(String(score))
                totalActual += Double(score*(weight[index][index2]/5))
            }
        }
        self.totalScore = totalActual
        self.kpiRate = totalActual*5/100
    }
}

extension SummaryScoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mSubTopicArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "summary_table_cell") as! SummaryScoreTableViewCell
        if indexOfTopic < self.mTopicArray.count{
            cell.mSubTopic.text = self.mSubTopicArray[self.indexOfTopic][indexPath.row]
            cell.mActual.text = self.actualScore[self.indexOfTopic][indexPath.row]
            cell.mScore.text = self.scores[self.indexOfTopic][indexPath.row]
            if indexPath.row == self.mSubTopicArray[self.indexOfTopic].count - 1{
                self.indexOfTopic += 1
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.mTopicArray[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mTopicArray.count
    }
    
    
}
