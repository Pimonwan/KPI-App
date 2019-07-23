//
//  kpiScoreMiniTableViewCell.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/21/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class kpiScoreMiniTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mActual: UILabel!
    @IBOutlet weak var mKPI: UILabel!
    @IBOutlet weak var mRemark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
