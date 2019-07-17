//
//  SummaryScoreTableViewCell.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/16/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class SummaryScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mSubTopic : UILabel!
    @IBOutlet weak var mActual: UILabel!
    @IBOutlet weak var mScore: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
