import UIKit
import Alamofire
import Charts
import DynamicColor

class UserHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var mTableView: UITableView!
    
    //Data
    var yearArr = ["2019","2018","2017","2016","2015","2014","2013","2012"]
    var actualscoreArr = ["19","18","17","16","15","14","13","12"]
    var kpirateArr = ["29","28","27","26","25","24","23","22"]
    var name = "Thammanoon Wethanyaporn"
    var id = "12345"
    
    var SelectedIndex = -1
    var isCoolapce = false
    
    //Chart
    var formatter: ChartFormatter = ChartFormatter()
    var xaxis: XAxis = XAxis()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedData()
//        self.createLineChart()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == 0 {return 100}
        if row == 1 {return 220}
        else{
            if self.SelectedIndex == indexPath.row && isCoolapce == true
            {
                return 335
            }else{
                return 72
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let year = yearArr.count
        let row = 2 + year
        return row
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailViewCell") as! UserDetailTableViewCell
            cell.mName.text! = name
            cell.mID.text! = id
            return cell
        }
        if row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChartViewCell") as! ChartTableViewCell
            

            
                // Common configures
                cell.mLineChartView.noDataText = "You need to provide data for the chart."
                cell.mLineChartView.chartDescription?.text = ""
                cell.mLineChartView.chartDescription?.font = UIFont.boldSystemFont(ofSize: 10)
                cell.mLineChartView.chartDescription?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                cell.mLineChartView.leftAxis.enabled = true;
                cell.mLineChartView.leftAxis.axisLineColor = #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 1).withAlphaComponent(0.12)
                cell.mLineChartView.leftAxis.gridColor =  #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 1).withAlphaComponent(0.12)
                cell.mLineChartView.leftAxis.labelTextColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.57)
                cell.mLineChartView.rightAxis.enabled = false;
                cell.mLineChartView.xAxis.enabled = true;
                cell.mLineChartView.xAxis.gridColor =   #colorLiteral(red: 0.6156862745, green: 0.5725490196, blue: 0.4470588235, alpha: 1).withAlphaComponent(0.12)
                cell.mLineChartView.xAxis.labelPosition = .bottom
                cell.mLineChartView.xAxis.labelTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.3)
                
                // Common Animation
                cell.mLineChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
                
                // Set Background Color
                cell.mLineChartView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                cell.mLineChartView.gridBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            //Actual
                
            let values1: [Double] = [19,18,17,16,15,14,13,12]
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
                
                // Start Prepare Score
                let values2: [Double] = [29,28,27,26,25,24,23,22]
                var dataEntries2: [ChartDataEntry] = []
                
                for i in 0..<ChartFormatter.dataPoints.count {
                    let dataEntry2 = ChartDataEntry(x: Double(i), y: values2[i])
                    dataEntries2.append(dataEntry2)
                }
                
                // Set X-Axis Label
                cell.mLineChartView.xAxis.valueFormatter = formatter
                
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
//                chartDataSet2.colors = ChartColorTemplates.colorful() // Multiple Colors
            
                // Assign Data
                cell.mLineChartView.data = chartData
            
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropViewCell") as! DropTableViewCell
            cell.mYear.text! = yearArr[indexPath.row - 2]
            cell.mActualScore.text! = actualscoreArr[indexPath.row - 2]
            cell.mKPI.text! = kpirateArr[indexPath.row - 2]
            mTableView.rowHeight = UITableView.automaticDimension
            return cell
        }
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
    
    func feedData(){
        AF.request("http://192.168.43.225:8081/api/kpi/5", method: .get).responseJSON { (response) in
            switch response.result{
            case .success :
                do{
                    let result = try JSONDecoder().decode(KpiFormResponse.self, from: response.data!)
                    print(result)
//                    let kpi = result.data.data.topicList
                    
//                    for (index, _) in kpi.enumerated(){
//                        self.mSubTopicArray.append([])
//                        for(index2, _) in kpi[index].subTopicList.enumerated(){
//                            let subTopic = kpi[index].subTopicList[index2].name
//                            self.mSubTopicArray[index].append(subTopic)
//                        }
//                        self.mTopicArray.append(kpi[index].name)
//                    }
                    
//                    self.mTableView.reloadData()
                }catch{
                    
                }
            case .failure(let error):
                print("network error: \(error.localizedDescription)")
            }
        }
    }
    
}

@objc(ChartFormatter)
public class ChartFormatter: NSObject, IAxisValueFormatter{
    
//    static var dataPoints: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    static var dataPoints: [String] = ["2019","2018","2017","2016","2015","2014","2013","2012"]
    
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
