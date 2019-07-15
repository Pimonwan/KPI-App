import UIKit
import DynamicColor

class AdminHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var AdminTableView: UITableView!
    @IBOutlet weak var Search: UISearchBar!
    
    
  
    
    var UserArray = [User]()
    var currentUserArray = [User]()
    
    var searching = false
//    var searchID = [String]()
    
    var SelectedIndex = -1
    var isCoolapce = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        alterLayout()
        setUpUser()
    }
    
    //Data
    
    private func setUpUser() {
        UserArray.append(User(name: "Pimonwan Sutmee", id: "12341", year: "2019"))
        UserArray.append(User(name: "Pimonwan Sutmee", id: "12341", year: "2018"))
        UserArray.append(User(name: "Maneekan Yanvisit", id: "34593", year: "2019"))
        UserArray.append(User(name: "Marut Maluleem", id: "34432", year: "2019"))
        UserArray.append(User(name: "Marut Maluleem", id: "34432", year: "2018"))
        UserArray.append(User(name: "Marut Maluleem", id: "34432", year: "2017"))
        UserArray.append(User(name: "Nontapat Tapprasan", id: "54321", year: "2019"))
        UserArray.append(User(name: "Thammanoon Wethanyaporn", id: "57321", year: "2019"))
        UserArray.append(User(name: "Thanapong Supalak", id: "57901", year: "2019"))
        UserArray.append(User(name: "Pattaragun Chimphet", id: "07901", year: "2019"))
        UserArray.append(User(name: "Olivia Sophia", id: "07671", year: "2019"))
        UserArray.append(User(name: "Isabella Emma", id: "08901", year: "2019"))
        UserArray.append(User(name: "Emily Ava", id: "12301", year: "2019"))
        UserArray.append(User(name: "Abigail Madison", id: "09321", year: "2019"))
        
        currentUserArray = UserArray
    }
    
   
    
    func setupSearchBar(){
        Search.delegate = self
    }

    func alterLayout() {
        AdminTableView.tableHeaderView = UIView()
        // search bar in section header
        AdminTableView.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.titleView = Search
        Search.showsScopeBar = false // you can show/hide this dependant on your layout
        Search.placeholder = "Search Bar"
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if self.SelectedIndex == indexPath.row && isCoolapce == true
            {
                return 360
            }else{
                return 90            }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currentUserArray.count
//            return idArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell") as! AdminTableViewCell

        cell.Year.text! = currentUserArray[indexPath.row].year
        cell.name.text! = currentUserArray[indexPath.row].name
        cell.id.text! = currentUserArray[indexPath.row].id
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
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty
        {
        }
        currentUserArray = UserArray.filter({ User -> Bool in
            if User.id.range(of: searchText) != nil {
                return true
            }
            if User.name.range(of: searchText) != nil {
                return true
            }
            if User.year.range(of: searchText) != nil {
                return true
            }
            else
            {
                return false
            }
//            switch searchBar.selectedScopeButtonIndex {
//            case 0:
//                if searchText.isEmpty { return true }
////                return User.id.lowercased().contains(searchText.lowercased()) &&
//            return  User.name.lowercased().contains(searchText.lowercased())
//            default:
//                return false
//            }
        })
        AdminTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentUserArray = UserArray
        default:
            break
        }
        AdminTableView.reloadData()
    }
}

class NAME {
    let name: String
    let image: String
    let id: Int
    let year: Int
    
    init(name: String, image: String, id:Int, year: Int) {
        self.name = name
        self.image = image
        self.id = id
        self.year = year
    }
}

extension AdminHistoryViewController: UISearchBarDelegate {
}

class User {
    let name: String
    let id: String
    let year: String
    
    init(name: String, id: String, year: String) {
        self.name = name
        self.id = id
        self.year = year
    }
}
