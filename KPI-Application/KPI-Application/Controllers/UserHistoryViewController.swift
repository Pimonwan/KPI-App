import UIKit

class UserHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var mTableView: UITableView!
    
    var yearArr = ["2019","2018","2017","2016","2015","2014","2013","2012"]
    var name = "Thammanoon Wethanyaporn"
    var id = "12345"
    
    var SelectedIndex = -1
    var isCoolapce = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //        mTableView.estimatedRowHeight = 301
        //        mTableView.rowHeight = UITableView.automaticDimension
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
        return yearArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailViewCell") as! UserDetailTableViewCell
            return cell
        }
        if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChartViewCell") as! ChartTableViewCell
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropViewCell") as! DropTableViewCell
            cell.mYear.text! = yearArr[indexPath.row]
            mTableView.rowHeight = UITableView.automaticDimension
            //12.19
            
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
