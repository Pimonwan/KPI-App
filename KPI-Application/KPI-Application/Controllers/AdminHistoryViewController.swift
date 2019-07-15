import UIKit
import DynamicColor

class AdminHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var AdminTableView: UITableView!
    @IBOutlet weak var Search: UISearchBar!
    
    
    //Data
    var yearArr = ["2019","2018","2017","2016","2015","2014","2013","2012","2011","2010","2009","2008","2007"]
    var idArr = ["19000","18000","17000","16000","15000","14000","13000","12000","11000","10000","11100","10090","10200"]
    var nameArr = ["Pimonwan Sutmee", "Maneekan Yanvisit","Marut Maluleem","Nontapat Tapprasan","Thammanoon Wethanyaporn","Thanapong Supalak","Pattaragun Chimphet", "Olivia Sophia","Isabella Emma", "Emily Ava", "Abigail Madison", "Chloe Mia" ,"Lily Grace"]
    
    var searching = false
    var searchID = [String]()
    
    var SelectedIndex = -1
    var isCoolapce = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSearchBar()
        alterLayout()
    }
    
   
    
//    func setupSearchBar(){
//        Search.delegate = self
//    }
//
    func alterLayout() {
        AdminTableView.tableHeaderView = UIView()
        // search bar in section header
        AdminTableView.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.titleView = Search
        Search.showsScopeBar = false // you can show/hide this dependant on your layout
        Search.placeholder = "Search by Name"
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if self.SelectedIndex == indexPath.row && isCoolapce == true
            {
                return 360
            }else{
                return 90            }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchID.count
        } else {
            return idArr.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell") as! AdminTableViewCell
            cell.Year.text! = yearArr[indexPath.row]
            cell.name.text! = nameArr[indexPath.row]
            cell.id.text! = idArr[indexPath.row]
            AdminTableView.rowHeight = UITableView.automaticDimension
        
//        if searching {
//            cell?.textLabel?.text = searchedCountry[indexPath.row]
//        } else {
//            cell?.textLabel?.text = countryNameArr[indexPath.row]
//        }
//        return cell!
        
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchID = idArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        AdminTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        AdminTableView.reloadData()
    }
    
}
