//
//  KpiRateTableViewCell.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/18/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class KpiRateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mSubTopic: UILabel!
    @IBOutlet weak var mRate1: UILabel!
    @IBOutlet weak var mRate2: UILabel!
    @IBOutlet weak var mRate3: UILabel!
    @IBOutlet weak var mRate4: UILabel!
    @IBOutlet weak var mRate5: UILabel!
    @IBOutlet weak var mWeight: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
