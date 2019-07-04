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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("from summary : \(self.mes)")
        print(self.mes[0])
        
        let t = type(of: mes[0])
        print("'type '\(t)'")
        
        let s = self.mes[0]
        print("s : \(s)")
        self.actual1.text = "12345678"
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
        let num1 = Int(actual[0])!
        let num2 = Int(actual[1])!
        let num3 = Int(actual[2])!
        let num4 = Int(actual[3])!
        let num5 = Int(actual[4])!
        let num6 = Int(actual[5])!
        let num7 = Int(actual[6])!
        let num8 = Int(actual[7])!
        
        print(num1+num2+num3+num4+num5+num6+num7+num8)
        
    }
}
