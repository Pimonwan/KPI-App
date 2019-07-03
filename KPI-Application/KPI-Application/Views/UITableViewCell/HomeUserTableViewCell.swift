//
//  HomeTableViewCell.swift
//  KPI-Application
//
//  Created by Thammanoon Wethanyaporn on 3/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class HomeUserTableViewCell: UITableViewCell {

    @IBOutlet weak var Actual: UILabel!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var Year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
