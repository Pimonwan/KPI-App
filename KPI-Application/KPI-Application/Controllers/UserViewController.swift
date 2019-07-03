//
//  UserViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/2/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var mTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UserViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! UserTableViewCell
        cell.mUserName.text = "Pimonwan"
        return cell
    }
    
    
}
