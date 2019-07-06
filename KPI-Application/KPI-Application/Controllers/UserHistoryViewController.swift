import UIKit

class UserHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var mTableView: UITableView!
    
    var yearArr = ["2019","2018","2017","2016","2015","2014","2013","2012"]
    var actualscoreArr = ["19","18","17","16","15","14","13","12"]
    var kpirateArr = ["29","28","27","26","25","24","23","22"]
    var name = "Thammanoon Wethanyaporn"
    var id = "12345"
    
    var SelectedIndex = -1
    var isCoolapce = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == 0 {return 100}
        if row == 1 {return 163}
        else{
            if self.SelectedIndex == indexPath.row && isCoolapce == true
            {
                return 335
            }else{
                return 50
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let year = yearArr.count
        let row = 2 + year
        return row
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailViewCell") as! UserDetailTableViewCell
            cell.mName.text! = name
            cell.mID.text! = id
            return cell
        }
        if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChartViewCell") as! ChartTableViewCell
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropViewCell") as! DropTableViewCell
            cell.mYear.text! = yearArr[indexPath.row - 2]
            cell.mActualScore.text! = actualscoreArr[indexPath.row - 2]
            cell.mKPI.text! = kpirateArr[indexPath.row - 2]
            mTableView.rowHeight = UITableView.automaticDimension
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if SelectedIndex == indexPath.row
        {
            if self.isCoolapce == false
            {
                self.isCoolapce = true
            }else{
                self.isCoolapce = false
            }
        }else{
            self.isCoolapce = true
        }
        self.SelectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
