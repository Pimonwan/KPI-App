import UIKit
import Alamofire
import Charts
import DynamicColor

class UserHistoryViewController: UIViewController {
    
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mLineChartView: LineChartView!
    @IBOutlet weak var mName: UILabel!
    @IBOutlet weak var mID: UILabel!
    
    //Mock
    var GetUser: [Datum] = []
    var newestHistory: [ScoreHistoryList] = []
    var FinalactualScores: [[Int]] = []
    var FinalratingScores: [[Int]] = []
    var actualScores: [[Int]] = []
    var ratingScores: [[Int]] = []
    var remarks: [[String]] = []
    
    //Mock2
    var KpiForm: [TopicList] = []
    var mSubTopicArray: [[String]] = []
    var mTopicArray: [String] = []
    
    //Data
    var yearArr = ["2019"]
    var name = "Thammanoon Wethanyaporn"
    var id = "12345"
    
    var SelectedIndex = -1
    var isCoolapce = false
    
    //Chart
    var formatter: ChartFormatter = ChartFormatter()
    var xaxis: XAxis = XAxis()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedData()
        self.createLineChart()
        UserDetail()
    }
    
    func UserDetail(){
        mName.text! = name
        mID.text! = id
    }
        
        //Chart
    func createLineChart(){
            // Common configures
            mLineChartView.noDataText = "You need to provide data for the chart."
            mLineChartView.chartDescription?.text = ""
            mLineChartView.chartDescription?.font = UIFont.boldSystemFont(ofSize: 10)
            mLineChartView.chartDescription?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            mLineChartView.leftAxis.enabled = true;
            mLineChartView.leftAxis.axisLineColor = #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 1).withAlphaComponent(0.12)
            mLineChartView.leftAxis.gridColor =  #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 1).withAlphaComponent(0.12)
            mLineChartView.leftAxis.labelTextColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.57)
            mLineChartView.rightAxis.enabled = false;
            mLineChartView.xAxis.enabled = true;
            mLineChartView.xAxis.gridColor =   #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 1).withAlphaComponent(0.12)
            mLineChartView.xAxis.labelPosition = .bottom
            mLineChartView.xAxis.labelTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.3)
            
            // Common Animation
            mLineChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
            
            // Set Background Color
            mLineChartView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            mLineChartView.gridBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            //Actual

//            let finalValue = GetUser[indexPath.row]
//            let AcValue1 = finalValue.finalActualScore
//            let RcValue1 = finalValue.finalRatingScore
        
        

            let values1: [Double] = [65,90,90]
//            let values1: [Double] = [Double(AcValue1)]
            var dataEntries1: [ChartDataEntry] = []
    
        
    
            
            for i in 0..<ChartFormatter.dataPoints.count {
                let dataEntry1 = ChartDataEntry(x: Double(i) , y: values1[i])
                dataEntries1.append(dataEntry1)
            }
            
            let chartDataSet1 = LineChartDataSet(entries: dataEntries1, label: "Actual")
            chartDataSet1.circleHoleColor = UIColor.red
            chartDataSet1.setCircleColor(UIColor.yellow)
            chartDataSet1.circleRadius = 5
            chartDataSet1.circleHoleRadius = 2
            chartDataSet1.valueColors = [UIColor(hexString: "#ffffff").withAlphaComponent(0.3)]
            chartDataSet1.drawFilledEnabled = true
            chartDataSet1.fillColor = UIColor(hexString: "#6D95E8")
            chartDataSet1.fillAlpha = 0.1
            chartDataSet1.lineWidth = 3
            
            //end Actual
            
//             Start Prepare Score
//            let values2: [Double] = [Double(RcValue1)]
            let values2: [Double] = [3,5,5]
            var dataEntries2: [ChartDataEntry] = []
            
            for i in 0..<ChartFormatter.dataPoints.count {
                let dataEntry2 = ChartDataEntry(x: Double(i), y: values2[i])
                dataEntries2.append(dataEntry2)
            }
            
            // Set X-Axis Label
            mLineChartView.xAxis.valueFormatter = formatter
            
            let chartDataSet2 = LineChartDataSet(entries: dataEntries2, label: "Score")
            
            chartDataSet2.drawFilledEnabled = true
            chartDataSet2.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            chartDataSet2.fillAlpha = 0.1
            chartDataSet2.circleRadius = 5
            chartDataSet2.circleHoleRadius = 2
            chartDataSet2.valueColors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.3)]
            chartDataSet2.lineWidth = 3
            
            
            let chartData = LineChartData()
            chartDataSet1.mode = .cubicBezier
            chartDataSet2.mode = .cubicBezier
            
            chartData.addDataSet(chartDataSet1)
            chartData.addDataSet(chartDataSet2)
            
            
            chartDataSet1.colors = [UIColor(hexString: "#00FF00")] // Single Color
            chartDataSet2.colors = [UIColor(hexString: "#0000FF")]
            
            // Assign Data
            mLineChartView.data = chartData
    }
    
    func feedData(){
//        self.getKpiForm()
        self.getUserScore()
        self.prepareDataForTable()
    }
    

    func getUserScore(){
        let headers: HTTPHeaders = ["id": "1"]
        AF.request("http://192.168.108.82:8081/kpi/user/year/2019",method: .get,encoding: JSONEncoding.default, headers: headers).responseJSON{ (response) in
            switch response.result{
            case .success :
                do{
                    let result = try JSONDecoder().decode(UserHistory.self, from: response.data!)
                    let data = result.data
                    self.GetUser = data
                    self.newestHistory = data[0].scoreHistoryList
                    self.getKpiForm()
                }catch{
                    print("error1")
                }
            case .failure(let error):
                print("network error: \(error.localizedDescription)")
            }
        }
    }
    
    func getKpiForm(){
        AF.request("http://192.168.108.82:8081/kpi/5", method: .get).responseJSON { (response) in
            switch response.result{
            case .success :
                do{
                    let result = try JSONDecoder().decode(KpiFormResponse.self, from: response.data!)
                    let kpi = result.data.topicList
                    self.KpiForm = kpi
                    for (index, _) in kpi.enumerated(){
                        self.mSubTopicArray.append([])
                        for(index2, _) in kpi[index].subTopicList.enumerated(){
                            let subTopic = kpi[index].subTopicList[index2].name
                            self.mSubTopicArray[index].append(subTopic)
                        }
                        self.mTopicArray.append(kpi[index].name)
                    }
                    self.prepareDataForTable()
                    self.mTableView.reloadData()
                }catch{
                    print("error")
                }
            case .failure(let error):
                print("network error: \(error.localizedDescription)")
            }
        }
    }
    
    func prepareDataForTable(){
        for (index, _) in self.KpiForm.enumerated(){
            self.actualScores.append([])
            self.ratingScores.append([])
            self.remarks.append([])
            let topicId = self.KpiForm[index].id
            for (index2, _) in self.KpiForm[index].subTopicList.enumerated(){
                let subTopicId = self.KpiForm[index].subTopicList[index2].id
                for (i, _) in self.newestHistory.enumerated(){
                    if self.newestHistory[i].topicID == topicId && self.newestHistory[i].subTopicID == subTopicId{
                        self.actualScores[index].append(self.newestHistory[i].actualScore)
                        self.ratingScores[index].append(self.newestHistory[i].ratingScore)
                    }
                }
            }
        }
    }
}

extension UserHistoryViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 0{
            return 500
        }else{
            return 55
            }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return self.GetUser.count
        }else{
            return self.mSubTopicArray[section].count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.tag == 0 {
            return ""
        }else{
            return self.mTopicArray[section]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 100 {
            return self.mTopicArray.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "KPIscore") as! KPIscoreTableViewCell
            let item2 = GetUser[indexPath.row]
            
            cell.mYear.text! = yearArr[indexPath.row]
            cell.mActual.text = "\(item2.finalActualScore)"
            cell.mKPI.text = "\(item2.finalRatingScore)"
            mTableView.rowHeight = UITableView.automaticDimension

            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "miniKpiScoreView") as! kpiScoreMiniTableViewCell
            cell.mTitle.text = self.mSubTopicArray[indexPath.section][indexPath.row]
            cell.mActual.text = "\(self.actualScores[indexPath.section][indexPath.row])"
            cell.mKPI.text = "\(self.ratingScores[indexPath.section][indexPath.row])"
//            if self.remarks[indexPath.section][indexPath.row] == nil{cell.mRemark.text = "-"}else{cell.mRemark.text = "\(self.remarks[indexPath.section][indexPath.row])"}
            cell.mRemark.text = "-"
            
            return cell
        }
      }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if SelectedIndex == indexPath.row
//            if tableView.tag == 100
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
    
    

    

@objc(ChartFormatter)
public class ChartFormatter: NSObject, IAxisValueFormatter{
    
    static var dataPoints: [String] = ["2019"]

    
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String{
        return ChartFormatter.dataPoints[Int(value)]
    }
}

@objc(ValueFormatter)
public class ValueFormatter: NSObject, IValueFormatter{
    
    public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return "\(value) %"
    }
}


