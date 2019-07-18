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
    let nameList = ["Pimonwan Sutmee", "Maneekan Yanvisit","Marut Maluleem","Nontapat Tapprasan","Thammanoon Wethanyaporn","Thanapong Supalak","Pattaragun Chimphet", "Olivia Sophia","Isabella Emma", "Emily Ava", "Abigail Madison", "Chloe Mia" ,"Lily Grace"]
    var selectedPerson: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Users List"
        
        view.backgroundColor = UIColor.black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetVC = segue.destination as? ScoringViewController{
            targetVC.name = self.selectedPerson
        }
    }

}

extension UserViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! UserTableViewCell
        cell.mUserName.text = nameList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(type(of: nameList[indexPath.row]))
        print(nameList[indexPath.row])
        self.selectedPerson = nameList[indexPath.row]
        performSegue(withIdentifier: "scoring_view", sender: self)
    }
    
}
