//
//  DropTableViewCell.swift
//  KPI-Application
//
//  Created by Thammanoon Wethanyaporn on 4/7/2562 BE.
//  Copyright © 2562 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class DropTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mYear: UILabel!
    @IBOutlet weak var mActualScore: UILabel!
    @IBOutlet weak var mKPI: UILabel!
    

    
    @IBOutlet weak var TechAc: UILabel!
    @IBOutlet weak var TechSc: UILabel!
    @IBOutlet weak var TechRm: UILabel!
    @IBOutlet weak var InnoAc: UILabel!
    @IBOutlet weak var InnoSc: UILabel!
    @IBOutlet weak var InnoRm: UILabel!
    @IBOutlet weak var PreAc: UILabel!
    @IBOutlet weak var PreSc: UILabel!
    @IBOutlet weak var PreRm: UILabel!
    @IBOutlet weak var PraAc: UILabel!
    @IBOutlet weak var PraSc: UILabel!
    @IBOutlet weak var PraRm: UILabel!
    @IBOutlet weak var BuildAc: UILabel!
    @IBOutlet weak var BuildSc: UILabel!
    @IBOutlet weak var BuildRm: UILabel!
    @IBOutlet weak var AutoAc: UILabel!
    @IBOutlet weak var AutoSc: UILabel!
    @IBOutlet weak var AutoRe: UILabel!
    @IBOutlet weak var OnAc: UILabel!
    @IBOutlet weak var OnSc: UILabel!
    @IBOutlet weak var OnRe: UILabel!
    @IBOutlet weak var ProAc: UILabel!
    @IBOutlet weak var ProSc: UILabel!
    @IBOutlet weak var ProRe: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
