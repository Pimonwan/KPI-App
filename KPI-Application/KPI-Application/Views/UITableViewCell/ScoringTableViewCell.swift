//
//  ScoringTableViewCell.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/2/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class ScoringTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mTopic : UILabel!
    @IBOutlet weak var mSubTopic1 : UILabel!
    @IBOutlet weak var mSubTopic2 : UILabel!
    @IBOutlet weak var mSubTopic3 : UILabel!
    @IBOutlet weak var mSubTopic4 : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
