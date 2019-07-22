//
//  PopUpViewController.swift
//  KPI-Application
//
//  Created by พิมลวรรณ สุดมี on 7/4/19.
//  Copyright © 2019 พิมลวรรณ สุดมี. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var mTableView: UITableView!
    
    var kpiForm: [TopicList] = []
    var mTopicArray: [String] = []
    var mSubTopicArray: [[String]] = []
    var mRate1Array: [[String]] = []
    var mRate2Array: [[String]] = []
    var mRate3Array: [[String]] = []
    var mRate4Array: [[String]] = []
    var mRate5Array: [[String]] = []
    var mWeightArray: [[Int]] = []
    
    var selectedindex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showAnimate()
        prepareDataForTableView()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(sender:)))
        view.addGestureRecognizer(pinch)

    }
    
    @objc func handlePinch(sender: UIPinchGestureRecognizer){
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        }
    }
    
    @IBAction func closePopUp(sender: AnyObject) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        self.removeAnimate()
    }
    
    func prepareDataForTableView(){
        let kpi = self.kpiForm
        for (index, _) in kpi.enumerated(){
            // การเพิ่มข้อมูลครั้งแรกจำเป็นต้องเพิ่มอาเรย์เปล่าก่อนที่จะเพิ่มข้อมูล
            self.mSubTopicArray.append([])
            self.mRate1Array.append([])
            self.mRate2Array.append([])
            self.mRate3Array.append([])
            self.mRate4Array.append([])
            self.mRate5Array.append([])
            self.mWeightArray.append([])
            
            for(index2, _) in kpi[index].subTopicList.enumerated(){
                // เพิ่มหัวข้อย่อยลงในอาเรย์
                let subTopic = kpi[index].subTopicList[index2].name
                self.mSubTopicArray[index].append(subTopic)
                self.mRate1Array[index].append(kpi[index].subTopicList[index2].rate1)
                self.mRate2Array[index].append(kpi[index].subTopicList[index2].rate2)
                self.mRate3Array[index].append(kpi[index].subTopicList[index2].rate3)
                self.mRate4Array[index].append(kpi[index].subTopicList[index2].rate4)
                self.mRate5Array[index].append(kpi[index].subTopicList[index2].rate5)
                self.mWeightArray[index].append(kpi[index].subTopicList[index2].weight)
            }
            // เพิ่มหัวข้อ
            self.mTopicArray.append(kpi[index].name)
        }
        self.mTableView.reloadData()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 5.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.navigationController?.popViewController(animated: true)
            }
        });
    }
}
extension PopUpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mSubTopicArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kpi_rate_table") as! KpiRateTableViewCell
        cell.mSubTopic.text = self.mSubTopicArray[indexPath.section][indexPath.row]
        cell.mRate1.text = self.mRate1Array[indexPath.section][indexPath.row]
        cell.mRate2.text = self.mRate2Array[indexPath.section][indexPath.row]
        cell.mRate3.text = self.mRate3Array[indexPath.section][indexPath.row]
        cell.mRate4.text = self.mRate4Array[indexPath.section][indexPath.row]
        cell.mRate5.text = self.mRate5Array[indexPath.section][indexPath.row]
        cell.mWeight.text = "\(self.mWeightArray[indexPath.section][indexPath.row])"

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.mTopicArray[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mTopicArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel!.font = UIFont.boldSystemFont(ofSize: 13)
            header.textLabel!.textColor = UIColor.black
            header.textLabel?.font = UIFont(name: "Kanit", size: 13)
        }
    }
}
