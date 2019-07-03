import UIKit

class UserHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var mName : UILabel!
    @IBOutlet weak var mID : UILabel!
    @IBOutlet weak var mAvataImage : UILabel!
    @IBOutlet weak var HomeTableView: UITableView!
    
    
var yearArr = ["2016","2017","2018"]
    
    var SelectedIndex = -1
    var isCoolapce = false
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mName.text = "Thammanoon Wethanyaporn"
        self.mID.text = "00000"
        
        HomeTableView.estimatedRowHeight = 301
        HomeTableView.rowHeight = UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.SelectedIndex == indexPath.row && isCoolapce == true
        {
            return 301
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yearArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeusertableViewCell") as! HomeUserTableViewCell
        cell.Year.text! = yearArr[indexPath.row]
        //12.19
        
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
