import UIKit

class UserDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mAvata: UIImageView!
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
