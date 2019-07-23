import UIKit
import DynamicColor
import Alamofire
import MJRefresh

class AdminHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var Search: UISearchBar!
    @IBOutlet weak var mTableView: UITableView!
    
    
  //mock
    var GetUser: [Ddatum] = []
    var arr: [[String]] = []
    var searching = false
//    var searchID = [String]()
    
    var SelectedIndex = -1
    var isCoolapce = false
    let mPageSize = 10
    var mPageIndex = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        alterLayout()
        feedData(isRefresh: false)
        setupLoadmore()
    }
    
    func setupLoadmore(){
        self.mTableView.mj_footer = MJRefreshAutoNormalFooter()
        self.mTableView.mj_footer.setRefreshingTarget(self, refreshingAction: #selector(loadmore))
    }
    
    @objc func loadmore(){
        feedData(isRefresh: false)
    }
    
    func feedData(isRefresh: Bool){
        AF.request("http://ec2-52-221-195-185.ap-southeast-1.compute.amazonaws.com:8089/api/user/getProfileLists/\(mPageIndex)", method: .get).responseJSON
            { (response) in
                
                switch response.result{
                case .success:
                    do{
                        let result = try JSONDecoder().decode(UserProfile.self, from: response.data!)
                        let data = result.data
                        
                        for (index, _) in data.enumerated(){
//                            self.GetUser.append("\(data[index].firstNameEn) \(data[index].lastNameEn)")
                        }
                          self.GetUser.append(contentsOf: data as! [Ddatum])
                        
                        if data.count < self.mPageSize{
                            self.mTableView.mj_footer.endRefreshingWithNoMoreData()//ถ้าcountเกินขึ้นnomredata
                        }else{
                            self.mTableView.mj_footer.endRefreshing()
                            self.mPageIndex += 1
                        }
                        
//                        self.mTableView.mj_header.endRefreshing()
                        
                        self.mTableView.reloadData()
                    }catch{
                        print("error1")
                    }
                case .failure(let error):
                    print("network error: \(error.localizedDescription)")
                    
                }
        }
    }
   
    func setupSearchBar(){
        Search.delegate = self
    }

    func alterLayout() {
        mTableView.tableHeaderView = UIView()
        // search bar in section header
        mTableView.estimatedSectionHeaderHeight = 50
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
//            return currentUserArray.count
        return GetUser.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdminCell") as! AdminTableViewCell
//        let item2 = GetUser[indexPath.row]


//        cell.id.text = "\(item2.userID)"
        cell.name.text! = "\(GetUser[indexPath.row].firstNameEn)    \(GetUser[indexPath.row].lastNameEn)"
        mTableView.rowHeight = UITableView.automaticDimension
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
    
////     Search Bar
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty
//        {
//        }
//        arr = GetUser.filter({ User -> Bool in
//            if GetUser.range(of: searchText) != nil {
//                return true
//            }
////            if User.name.range(of: searchText) != nil {
////                return true
////            }
//            else
//            {
//                return false
//            }
//
//
////            switch searchBar.selectedScopeButtonIndex {
////            case 0:
////                if searchText.isEmpty { return true }
//////                return User.id.lowercased().contains(searchText.lowercased()) &&
////            return  User.name.lowercased().contains(searchText.lowercased())
////            default:
////                return false
////            }
//        })
//       mTableView.reloadData()
//    }
//
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        switch selectedScope {
//        case 0:
//            arr = [self.GetUser]
//        default:
//            break
//        }
//        mTableView.reloadData()
//    }
}



extension AdminHistoryViewController: UISearchBarDelegate {
}
