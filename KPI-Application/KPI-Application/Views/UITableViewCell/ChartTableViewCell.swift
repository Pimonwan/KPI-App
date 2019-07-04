//
//  ChartTableViewCell.swift
//  KPI-Application
//
//  Created by Thammanoon Wethanyaporn on 4/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class ChartTableViewCell: UITableViewCell {
    @IBOutlet weak var mChart: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
