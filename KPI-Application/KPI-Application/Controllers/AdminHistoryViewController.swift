import UIKit
import DynamicColor

class AdminHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var AdminTableView: UITableView!
    
    
    //Data
    var yearArr = ["2019","2018","2017","2016","2015","2014","2013","2012"]
    var idArr = ["19000","18000","17000","16000","15000","14000","13000","12000"]
    var nameArr = ["ham","kai","nick","tiger","sari","mon","sai","kai"]
    var name = "Thammanoon Wethanyaporn"
    var id = "12345"
    
    var SelectedIndex = -1
    var isCoolapce = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if self.SelectedIndex == indexPath.row && isCoolapce == true
            {
                return 360
            }else{
                return 90            }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let row = yearArr.count
        return row
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell") as! AdminTableViewCell
            cell.Year.text! = yearArr[indexPath.row]
            AdminTableView.rowHeight = UITableView.automaticDimension
            return cell
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

