import UIKit
import Alamofire

class SummaryScoreViewController: UIViewController {
    
    var actualScore: [[String]] = []
    var scores: [[Int]] = []
    var KpiForm : [TopicList] = []
    
    var totalScore: Double = 0
    var kpiRate: Double = 0
    var mTopicArray: [String] = []
    var mSubTopicArray: [[String]] = []
    var indexOfTopic: Int = 0
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mTotalScoreLabel : UILabel!
    @IBOutlet weak var mKpiRateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareDataForTableView()
    }
    
    func prepareDataForTableView(){
        let kpi = self.KpiForm
        for (index, _) in kpi.enumerated(){
            // การเพิ่มข้อมูลครั้งแรกจำเป็นต้องเพิ่มอาเรย์เปล่าก่อนที่จะเพิ่มข้อมูล
            self.mSubTopicArray.append([])
            for(index2, _) in kpi[index].subTopicList.enumerated(){
                // เพิ่มหัวข้อย่อยลงในอาเรย์
                let subTopic = kpi[index].subTopicList[index2].name
                self.mSubTopicArray[index].append(subTopic)
            }
            // เพิ่มหัวข้อ
            self.mTopicArray.append(kpi[index].name)
        }
        calculateScore()
        self.mTableView.reloadData()
    }
    
    func calculateScore(){
        var totalActual: Double = 0
        var score = -1
        
        for index in 0..<self.actualScore.count{
            self.scores.append([])
            for index2 in 0..<self.actualScore[index].count{
                let num = Int(self.actualScore[index][index2])!
                let rate1 = Int(self.KpiForm[index].subTopicList[index2].rate1)!
                let rate2 = Int(self.KpiForm[index].subTopicList[index2].rate2)!
                let rate3 = Int(self.KpiForm[index].subTopicList[index2].rate3)!
                let rate4 = Int(self.KpiForm[index].subTopicList[index2].rate4)!
                let weight = self.KpiForm[index].subTopicList[index2].weight
                let isLower = self.KpiForm[index].subTopicList[index2].isLowerBetter
                
                if isLower == 0{
                    if num <= rate1{
                        score = 1
                    }else if  num <= rate2{
                        score = 2
                    }else if  num <= rate3 {
                        score = 3
                    }else if  num <= rate4 {
                        score = 4
                    }else{
                        score = 5
                    }
                }else{
                    if num >= rate1 {
                        score = 1
                    }else if  num >= rate2 {
                        score = 2
                    }else if  num >= rate3 {
                        score = 3
                    }else if  num >= rate4 {
                        score = 4
                    }else{
                        score = 5
                    }
                }
                self.scores[index].append(score)
                totalActual += Double(score*(weight/5))
            }
        }
        self.totalScore = totalActual
        self.kpiRate = totalActual*5/100
        
        self.mTotalScoreLabel.text = "Total Score : \(self.totalScore)"
        self.mKpiRateLabel.text = "KPI Rate : \(self.kpiRate)"
    }
    
    @IBAction func onClickSaveBtn(){
        let data = prepareDataForPost(actual: self.actualScore, kpiRate: self.scores)
        postScore(body: data
        )    }
    
    func postScore(body: [String:Any]){
        let headers: HTTPHeaders = ["Content-Type": "application/json", "id" : "1", "user_id": "1"]
        AF.request("http://localhost:8081/kpi/score", method: .post, parameters: body, encoding: JSONEncoding.default ,headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                print(response)
            case .failure:
                print("fail")
            }
        }
    }
    
    func prepareDataForPost(actual: [[String]], kpiRate: [[Int]]) -> [String: Any]{
        var data: [String: Any] = ["form_id" : 1, "final_actual_score" : 70 , "final_rating_score": 3.5 , "score_history_list": []]
//        let dic : [String : Any] = ["topic_id": 1,
//                   "sub_topic_id": 1,
//                   "actual_score": 60,
//                   "rating_score": 3,
//                   "remark": ""]
        do {
            for index in 0...self.KpiForm.count - 1 {
                print(self.KpiForm[index].name)
                for indexSubTopic in 0...self.KpiForm[index].subTopicList.count - 1{
                    print("\(index)")
                    print("\(indexSubTopic)")
                    print(self.KpiForm[index].subTopicList[indexSubTopic].name)
                    let dic : [String : Any] = ["topic_id": self.KpiForm[index].id,
                                                "sub_topic_id": self.KpiForm[index].subTopicList[indexSubTopic].id,
                                                "actual_score": Int(self.actualScore[index][indexSubTopic]),
                                                "rating_score": self.scores[index][indexSubTopic],
                                                "remark": ""]
                    let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                    var existingItems = data["score_history_list"] as? [Any] ?? [Any]()
                    let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    existingItems.append(decoded)
                    data["score_history_list"] = existingItems
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        return data
    }
}

extension SummaryScoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mSubTopicArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "summary_table_cell") as! SummaryScoreTableViewCell
        if indexOfTopic < self.mTopicArray.count{
            cell.mSubTopic.text = self.mSubTopicArray[self.indexOfTopic][indexPath.row]
            cell.mActual.text = self.actualScore[self.indexOfTopic][indexPath.row]
            cell.mScore.text = "\(self.scores[self.indexOfTopic][indexPath.row])"
            if indexPath.row == self.mSubTopicArray[self.indexOfTopic].count - 1{
                self.indexOfTopic += 1
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.mTopicArray[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mTopicArray.count
    }
}
