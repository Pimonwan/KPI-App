//
//  ScoringViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/2/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class ScoringViewController: UIViewController {
    
    @IBOutlet weak var mTableView : UITableView!
    @IBOutlet weak var mName : UILabel!
    @IBOutlet weak var mID : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mName.text = "Pimonwan  Sutmee"
        self.mID.text = "89503"
    }
}

extension ScoringViewController: UITextViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoringTableCell") as! ScoringTableViewCell
        cell.mTopic.text = "Build the Product"
        cell.mSubTopic1.text = "Unit Test Converage"
        cell.mSubTopic2.text = "Automate Testing"
        cell.mSubTopic3.text = "On time delivery (story point deviation)"
        cell.mSubTopic4.text = "Product Demo"
        
        return cell
//        @IBOutlet weak var mName : UILabel!
//        @IBOutlet weak var mID : UILabel!
//        @IBOutlet weak var mTopic : UILabel!
//        @IBOutlet weak var mSubTopic1 : UILabel!
//        @IBOutlet weak var mSubTopic2 : UILabel!
    }
    
    
}
