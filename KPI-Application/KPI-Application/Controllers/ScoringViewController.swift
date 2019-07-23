//
//  ScoringViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/15/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit
import Alamofire

class ScoringViewController: UIViewController {
    var name : String = ""
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mNameLable: UILabel!
    var mTopicArray: [String] = []
    var mSubTopicArray: [[String]] = []
    var mFullScore: [[String]] = []
    var mScore: [String] = []
    
    var KpiForm: [TopicList] = []
    
    var allScore: [String] = []
    var scoreTags: [Int] = []
    var scores: [[String]] = []
    
    var tagForTextField = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scoring Page"
        
        self.mNameLable.text = self.name
        self.feedData()
    }
    
        func feedData(){
            AF.request("http://192.168.111.96:8081/kpi/5", method: .get).responseJSON { (response) in
                switch response.result{
                case .success :
                    do{
                        let result = try JSONDecoder().decode(KpiFormResponse.self, from: response.data!)
                        let kpi = result.data.topicList
                        self.KpiForm = kpi

                        var tag = 0
                        for (index, _) in kpi.enumerated(){
                            // การเพิ่มข้อมูลครั้งแรกจำเป็นต้องเพิ่มอาเรย์เปล่าก่อนที่จะเพิ่มข้อมูล
                            self.mSubTopicArray.append([])
                            self.mFullScore.append([])
                            for(index2, _) in kpi[index].subTopicList.enumerated(){
                                // ตรวจสอบคะแนนเต็มของแต่ละหัวข้อย่อย
                                let rateUnit = kpi[index].subTopicList[index2].rateUnit
                                if rateUnit == "n" {
                                    self.mFullScore[index].append("10")
                                }else{
                                    self.mFullScore[index].append("100")
                                }
                                // เพิ่มหัวข้อย่อยลงในอาเรย์
                                let subTopic = kpi[index].subTopicList[index2].name
                                self.mSubTopicArray[index].append(subTopic)
                                self.allScore.append("")
                                self.scoreTags.append(tag)
                                tag += 1
                            }
                            // เพิ่มหัวข้อ
                            self.mTopicArray.append(kpi[index].name)
                            print(self.mTopicArray)
                        }
                        // เพื่อรีเฟรชตาราง
                        self.mTableView.reloadData()
                    }catch{
                        print("error")
                    }
                case .failure(let error):
                    print("network error: \(error.localizedDescription)")
                    self.alertMessage(title: "Network error.", msg: "Could not connect to the server.")
//                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    
    @IBAction func onClickSubmit(){
        var indexScore = 0
        self.scores = []
        for (index, _) in self.mSubTopicArray.enumerated(){
            self.scores.append([])
            for (index2, _) in self.mSubTopicArray[index].enumerated(){
                let score = self.allScore[indexScore]
                if score == ""{
                    self.alertMessage(title: "Can not submit.", msg: "Please fill all scores.")
                }else{
                    let isLower = self.KpiForm[index].subTopicList[index2].isLowerBetter
                    if isLower == 1 {
                        let full = Int(self.KpiForm[index].subTopicList[index2].rate1)!
                        if Int(score)! < 0 || Int(score)! > full {
                            self.alertMessage(title: "Can not submit.", msg: "Some scores not correct.")
                        }else{
                            self.scores[index].append(score)
                            indexScore += 1
                        }
                    }else{
                        let full = Int(self.KpiForm[index].subTopicList[index2].rate5)!
                        if Int(score)! < 0 || Int(score)! > full {
                            self.alertMessage(title: "Can not submit.", msg: "Some scores not correct.")
                        }else{
                            self.scores[index].append(score)
                            indexScore += 1
                        }
                    }
                    
                }
            }
        }
    }
    
    @IBAction func showPopup(_ sender: AnyObject) {
        print("show popup")
        let popOverVC = self.storyboard!.instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "summary_kpi":
            let targetVC = segue.destination as! SummaryScoreViewController
                targetVC.actualScore = self.scores
                targetVC.KpiForm = self.KpiForm
                targetVC.name = self.name

        case "sbPopUpID":
            let targetPopup = segue.destination as! PopUpViewController
                targetPopup.kpiForm = self.KpiForm

        default: break
        }
    }
    
    func alertMessage(title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        if title.elementsEqual("Network error."){
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {(action:UIAlertAction!) in
                self.navigationController?.popViewController(animated: true)
            }))
        }else{
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension ScoringViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mSubTopicArray[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! ScoringTableViewCell
        let isLower = self.KpiForm[indexPath.section].subTopicList[indexPath.row].isLowerBetter
        if isLower == 1 {
            cell.mSubTopic.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
        cell.mSubTopic.text = self.mSubTopicArray[indexPath.section][indexPath.row]
        cell.mFullScoreLabel.text = self.mFullScore[indexPath.section][indexPath.row]

        cell.mScore.delegate = self
        if self.tagForTextField < self.scoreTags.count {
            cell.mScore.tag = self.tagForTextField
            self.tagForTextField += 1
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.mTopicArray[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mTopicArray.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.textColor = UIColor.black
            header.textLabel?.font = UIFont(name: "Kanit", size: 17)
        }
    }
  
}

extension ScoringViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = self.scoreTags.firstIndex(of:textField.tag)
        if(textField.tag == scoreTags[indexOf!]){
            if( indexOf! <= (self.allScore.count - 1)){
                self.allScore.remove(at: indexOf!)
            }
            self.allScore.insert(textField.text!, at: indexOf!)
        }
        print(self.allScore)
    }
}

