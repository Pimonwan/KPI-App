//
//  UserViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/2/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit
import Alamofire

class UserViewController: UIViewController {
    
    @IBOutlet weak var mTableView : UITableView!
//    let nameList = ["Pimonwan Sutmee", "Maneekan Yanvisit","Marut Maluleem","Nontapat Tapprasan","Thammanoon Wethanyaporn","Thanapong Supalak","Pattaragun Chimphet", "Olivia Sophia","Isabella Emma", "Emily Ava", "Abigail Madison", "Chloe Mia" ,"Lily Grace"]
    var selectedPerson: String = ""
    var getUser: [Da] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Users List"
        
        feedData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetVC = segue.destination as? ScoringViewController{
            targetVC.name = self.selectedPerson
        }
    }
    
    func feedData(){
        AF.request("http://ec2-52-221-195-185.ap-southeast-1.compute.amazonaws.com:8089/api/user/getProfileLists/11", method: .get).responseJSON
            { (response) in
                
                switch response.result{
                case .success:
                    
                    do{
                        let result = try JSONDecoder().decode(GetUserName.self, from: response.data!)
                        let data = result.data
                        print(data)
                        self.getUser = data
                        self.mTableView.reloadData()
                    }catch{
                    }
                case .failure(let error):
                    print("network error: \(error.localizedDescription)")
                    
                }
        }
    }

}

extension UserViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! UserTableViewCell
        let item = self.getUser[indexPath.row]
        
        cell.mUserName.text = "\(item.firstNameEn)  \(item.lastNameEn)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPerson = "\(self.getUser[indexPath.row].firstNameEn) \(self.getUser[indexPath.row].lastNameEn)"
        performSegue(withIdentifier: "scoring_view", sender: self)
    }
    
    
}
