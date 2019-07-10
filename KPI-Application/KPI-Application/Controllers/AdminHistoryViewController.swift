import UIKit
import DynamicColor

class AdminHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var AdminTableView: UITableView!
    @IBOutlet weak var Search: UISearchBar!
    
    
    //Data
    var yearArr = ["2019","2018","2017","2016","2015","2014","2013","2012"]
    var idArr = ["19000","18000","17000","16000","15000","14000","13000","12000"]
    var nameArr = ["ham","kai","nick","tiger","sari","mon","sai","kai"]
    var name = "Thammanoon Wethanyaporn"
    var id = "12345"
    
    var nameArray = [NAME]()
    var currentNameArray = [NAME]()
    var searching = false
    
    var SelectedIndex = -1
    var isCoolapce = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupSearchBar()
        alterLayout()
    }
    
    private func setUpData() {
        // CATS
        nameArray.append(NAME(name: "Amber", image: "test", id: 13, year: 1))
        nameArray.append(NAME(name: "Ham", image: "test", id: 12, year: 11))
        nameArray.append(NAME(name: "Amber", image: "test", id: 14, year: 1))
        
        currentNameArray = nameArray
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
        let row = nameArr.count
        return row
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell") as! AdminTableViewCell
            cell.Year.text! = yearArr[indexPath.row]
            cell.name.text! = nameArr[indexPath.row]
            cell.id.text! = idArr[indexPath.row]
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

//Search Edit (red)

//extension AdminHistoryViewController: UISearchBarDelegate{
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        currentNameArray = nameArray.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
//        searching = true
//        AdminTableView.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searching = false
//        searchBar.text = ""
//        tblView.reloadData()
//    }

//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        currentNameArray = nameArray.filter({ animal -> Bool in
//            switch searchBar.selectedScopeButtonIndex {
//            case 0:
//                if searchText.isEmpty { return true }
//                return animal.name.lowercased().contains(searchText.lowercased())
//            case 1:
//                if searchText.isEmpty { return animal.category == .dog }
//                return animal.name.lowercased().contains(searchText.lowercased()) &&
//                    animal.category == .dog
//            case 2:
//                if searchText.isEmpty { return animal.category == .cat }
//                return animal.name.lowercased().contains(searchText.lowercased()) &&
//                    animal.category == .cat
//            default:
//                return false
//            }
//        })
//        table.reloadData()
//    }
//
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        switch selectedScope {
//        case 0:
//            currentAnimalArray = animalArray
//        case 1:
//            currentAnimalArray = animalArray.filter({ animal -> Bool in
//                animal.category == AnimalType.dog
//            })
//        case 2:
//            currentAnimalArray = animalArray.filter({ animal -> Bool in
//                animal.category == AnimalType.cat
//            })
//        default:
//            break
//        }
//        table.reloadData()
//    }
//}



