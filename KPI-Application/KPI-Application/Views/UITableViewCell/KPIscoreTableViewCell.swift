//
//  KPIscoreTableViewCell.swift
//  KPI-Application
//
//  Created by Thammanoon Wethanyaporn on 18/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class KPIscoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mYear: UILabel!
    @IBOutlet weak var mActual: UILabel!
    @IBOutlet weak var mKPI: UILabel!
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Actual: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Remark: UILabel!
    
    @IBOutlet weak var mTableView: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
