//
//  HeaderTableViewCell.swift
//  KPI-Application
//
//  Created by Thammanoon Wethanyaporn on 21/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

   
    @IBOutlet weak var mYear: UILabel!
    @IBOutlet weak var mActual: UILabel!
    @IBOutlet weak var mKPI: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
