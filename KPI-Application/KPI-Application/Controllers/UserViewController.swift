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
    let nameList = ["Pimonwan Sutmee", "Maneekan Yanvisit","Marut Maluleem","Nontapat Tapprasan","Thammanoon Wethanyaporn","Thanapong Supalak","Pattaragun Chimphet"]

    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Users List"
    }
}

extension UserViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! UserTableViewCell
        cell.mUserName.text = nameList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "scoring_view", sender: nameList[indexPath.row])
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetVC = segue.destination as? ScoringViewController{
            targetVC.name = sender as! String
        }
    }
    
}
