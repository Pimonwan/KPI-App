//
//  ScoringViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/2/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit
import Alamofire

class ScoringViewControllerMock: UIViewController {
    
//    @IBOutlet weak var mTableView : UITableView!
    var name : String = ""
    @IBOutlet weak var mName : UILabel!
    @IBOutlet weak var mID : UILabel!
    @IBOutlet weak var mInput1 : UITextField!
    @IBOutlet weak var mInput2 : UITextField!
    @IBOutlet weak var mInput3 : UITextField!
    @IBOutlet weak var mInput4 : UITextField!
    @IBOutlet weak var mInput5 : UITextField!
    @IBOutlet weak var mInput6 : UITextField!
    @IBOutlet weak var mInput7 : UITextField!
    @IBOutlet weak var mInput8 : UITextField!
//    @IBOutlet weak var mTableView : UITableView!
//    var mTopicArray: [String] = []
//    var mSubTopicArray: [[String]] = []
//    var indexOfTopic: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
         view.backgroundColor = UIColor.black
         self.title = "Scoring Page"
        self.mName.text = self.name
        self.mID.text = "ID : 89503"
        
//        feedData()
      
    }
    
//    func feedData(){
////        AF.request("http://192.168.43.225:8081/api/kpi/5", method: .get).responseJSON { (response) in
//        AF.request("http://172.20.10.13:8081/api/kpi/5", method: .get).responseJSON { (response) in
//            switch response.result{
//            case .success :
//                do{
//                    let result = try JSONDecoder().decode(KpiFormResponse.self, from: response.data!)
//                    let kpi = result.data.data.topicList
//
//                    for (index, _) in kpi.enumerated(){
//                        self.mSubTopicArray.append([])
//                        for(index2, _) in kpi[index].subTopicList.enumerated(){
//                            let subTopic = kpi[index].subTopicList[index2].name
//                            self.mSubTopicArray[index].append(subTopic)
//                        }
//                        self.mTopicArray.append(kpi[index].name)
//                    }
//
//                    self.mTableView.reloadData()
//                }catch{
//
//                }
//            case .failure(let error):
//                print("network error: \(error.localizedDescription)")
//            }
//        }
//    }
    
    @IBAction func onClickSubmit(){
        let input1 = self.mInput1.text
        let input2 = self.mInput2.text
        let input3 = self.mInput3.text
        let input4 = self.mInput4.text
        let input5 = self.mInput5.text
        let input6 = self.mInput6.text
        let input7 = self.mInput7.text
        let input8 = self.mInput8.text

        if input1?.isEmpty ?? true || input2?.isEmpty ?? true || input3?.isEmpty ?? true || input4?.isEmpty ?? true || input5?.isEmpty ?? true || input6?.isEmpty ?? true || input7?.isEmpty ?? true || input8?.isEmpty ?? true{

            let alert = UIAlertController(title: "Can not submit", message: "Please enter all of score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }else if Int(input1!)! > 100 || Int(input1!)! < 0 {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input2!)! > 10 || Int(input2!)! < 0  {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input3!)! > 10 || Int(input3!)! < 0 {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input4!)! > 10 || Int(input4!)! < 0 {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input5!)! > 100 || Int(input5!)! < 0  {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input6!)! > 100 || Int(input6!)! < 0 {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input7!)! > 10 || Int(input7!)! < 0 {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if Int(input8!)! > 10 || Int(input8!)! < 0 {
            let alert = UIAlertController(title: "Wrong Score", message: "Some Score doesn't in range of full score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let arr = [input1, input2, input3, input4, input5, input6, input7, input8]
            self.performSegue(withIdentifier: "summary_kpi", sender: arr)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetVC = segue.destination as? SummaryViewController{
            targetVC.mes = sender as! [String]
        }
    }

    @IBAction func showPopup(_ sender: AnyObject) {
        let popOverVC = self.storyboard!.instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController

        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)

    }
    

}



//extension ScoringViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.mSubTopicArray[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! ScoringTableViewCell
//        
//        print(" indexOfTppic : \(self.indexOfTopic)")
//        print(" indexPath : \(indexPath.row)")
//        cell.mText.text = self.mSubTopicArray[self.indexOfTopic][indexPath.row]
//        if indexPath.row == self.mSubTopicArray[self.indexOfTopic].count - 1{
//            self.indexOfTopic += 1
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.mTopicArray[section]
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.mTopicArray.count
//    }
//    
//
//}

//extension ScoringViewController: UITextViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "scoringTableCell") as! ScoringTableViewCell
//
//        if indexPath.row == 0 {
//            cell.mTopic.text = "Build the Product"
//            cell.mSubTopic1.text = "Unit Test Converage"
//            cell.mSubTopic2.text = nil
//            cell.mSubTopic3.text = nil
//            cell.mSubTopic4.text = nil
//
//            cell.mFull1.text = "10"
//            cell.mFull2.text = nil
//            cell.mFull3.text = nil
//            cell.mFull4.text = nil
//
//            cell.mInput1.isHidden = true;
//
//
//        }else if indexPath.row == 1 {
//            cell.mTopic.text = "Build the Product"
//            cell.mSubTopic1.text = "Unit Test Converage"
//            cell.mSubTopic2.text = "Automate Testing"
//            cell.mSubTopic3.text = "On time delivery (story point deviation)"
//            cell.mSubTopic4.text = nil
//
//            cell.mFull1.text = "10"
//            cell.mFull2.text = "10"
//            cell.mFull3.text = "10"
//            cell.mFull4.text = nil
//        }else{
//            cell.mTopic.text = "Build the Product"
//            cell.mSubTopic1.text = "Unit Test Converage"
//            cell.mSubTopic2.text = "Automate Testing"
//            cell.mSubTopic3.text = "On time delivery (story point deviation)"
//            cell.mSubTopic4.text = "Product Demo"
//
//            cell.mFull1.text = "10"
//            cell.mFull2.text = "10"
//            cell.mFull3.text = "10"
//            cell.mFull4.text = "10"
//        }
//
//
//        cell.mSubTopic3.numberOfLines = 0
//        cell.mSubTopic3.preferredMaxLayoutWidth = 700
//        cell.mSubTopic3.lineBreakMode = NSLineBreakMode.byWordWrapping
//        cell.mSubTopic3.sizeToFit()
//
//        return cell
//    }
//
//
//}
