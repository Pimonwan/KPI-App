import UIKit

class UserHistoryViewController: UIViewController {
    
    @IBOutlet weak var mTableView : UITableView!
    @IBOutlet weak var mName : UILabel!
    @IBOutlet weak var mID : UILabel!
    @IBOutlet weak var mAvataImage : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mName.text = "Thammanoon Wethanyaporn"
        self.mID.text = "00000"
      
    }
    


}
