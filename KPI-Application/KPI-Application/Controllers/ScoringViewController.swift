//
//  ScoringViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/2/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class ScoringViewController: UIViewController {
    
//    @IBOutlet weak var mTableView : UITableView!
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mName.text = "Name : Pimonwan  Sutmee"
        self.mID.text = "ID : 89503"
        
      
    }
    
    @IBAction func onClickSubmit(){
        let input1 = self.mInput1.text
        let input2 = self.mInput2.text
        let input3 = self.mInput3.text
        let input4 = self.mInput4.text
        let input5 = self.mInput5.text
        let input6 = self.mInput6.text
        let input7 = self.mInput7.text
        let input8 = self.mInput8.text
        
        print(input1)
        print(input2)
        print(input3)
        print(input4)
        print(input5)
        print(input6)
        print(input7)
        print(input8)
        
        let arr = [input1, input2, input3, input4, input5, input6, input7, input8]
        
        let vc = SummaryViewController()
        vc.mes = arr as! [String]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showPopup(_ sender: AnyObject) {
        let popOverVC = self.storyboard!.instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
        
    }
}

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
