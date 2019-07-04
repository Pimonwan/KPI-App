//
//  SummaryViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/4/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//
import UIKit

class SummaryViewController: UIViewController {
    
    var mes : [String] = []
    
    @IBOutlet weak var actual1 : UILabel!
    @IBOutlet weak var actual2 : UILabel!
    @IBOutlet weak var actual3 : UILabel!
    @IBOutlet weak var actual4 : UILabel!
    @IBOutlet weak var actual5 : UILabel!
    @IBOutlet weak var actual6 : UILabel!
    @IBOutlet weak var actual7 : UILabel!
    @IBOutlet weak var actual8 : UILabel!
    
    @IBOutlet weak var score1 : UILabel!
    @IBOutlet weak var score2 : UILabel!
    @IBOutlet weak var score3 : UILabel!
    @IBOutlet weak var score4 : UILabel!
    @IBOutlet weak var score5 : UILabel!
    @IBOutlet weak var score6 : UILabel!
    @IBOutlet weak var score7 : UILabel!
    @IBOutlet weak var score8 : UILabel!

    @IBOutlet weak var ta : UILabel!
    @IBOutlet weak var ts : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Summary"
        self.actual1.text = self.mes[0]
        self.actual2.text = self.mes[1]
        self.actual3.text = self.mes[2]
        self.actual4.text = self.mes[3]
        self.actual5.text = self.mes[4]
        self.actual6.text = self.mes[5]
        self.actual7.text = self.mes[6]
        self.actual8.text = self.mes[7]
        
        calSum(actual: self.mes)
    }
    
    func calSum(actual : [String]){
        var weight = [20,10,10,10,15,15,10,10]
        var rate1 = [20,1,1,1,50,50,9,1]
        var rate2 = [40,4,4,4,60,60,7,4]
        var rate3 = [60,6,6,6,70,70,5,6]
        var rate4 = [80,8,8,8,80,80,3,8]
        var totalActual: Double = 0
        var kpirate: Double = 0
        
        var score:[Int] = []
        
        for i in 0..<actual.count {
            var num = Int(actual[i])!
            if i == 6{
                if num>=rate1[i]{
                    score.append(1)
                }else if num>=rate2[i] {
                    score.append(2)
                }else if num>=rate3[i] {
                    score.append(3)
                }else if num>=rate4[i] {
                    score.append(4)
                }else{
                    score.append(5)
                }
            }else{
                if num<=rate1[i]{
                    score.append(1)
                }else if num<=rate2[i] {
                    score.append(2)
                }else if num<=rate3[i] {
                    score.append(3)
                }else if num<=rate4[i] {
                    score.append(4)
                }else{
                    score.append(5)
                }
            }
            
            totalActual += Double(score[i]*weight[i]/5)
        }
        kpirate = totalActual*5/100
        
        self.score1.text = String(score[0])
        self.score2.text = String(score[1])
        self.score3.text = String(score[2])
        self.score4.text = String(score[3])
        self.score5.text = String(score[4])
        self.score6.text = String(score[5])
        self.score7.text = String(score[6])
        self.score8.text = String(score[7])
        
        self.ta.text = String(totalActual)
        self.ts.text = String(kpirate)
        
    }
    
    @IBAction func onClickSaveButton(){
//        self.navigationController?.popToRootViewController(animated: true)
//        self.navigationController?.popToViewController(UserViewController, animated: true)
        print("click")
        self.performSegue(withIdentifier: "teste", sender: self)
//        self.navigationController?.popToViewController(UserViewController.init(), animated: true)
//        self.navigationController?.popToViewController(UserViewController(), animated: true)
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let targetVC = segue.destination as? UserViewController{
//
//        }
//    }
}
