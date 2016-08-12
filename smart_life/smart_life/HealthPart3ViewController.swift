//
//  HealthPart3ViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import PNChartSwift
import Alamofire
import MBProgressHUD
import SwiftyJSON

class HealthPart3ViewController: UITableViewController {
    var chartname = String()
    var name = String()
    var reporthistoryArray = [ReportHistory]()
    
    @IBOutlet weak var chartview: UIView!
    @IBOutlet weak var chartName: UILabel!
    let LineChart = PNLineChart(frame: CGRectMake(-20, 50, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    var dataArray = [Float]()
    var timeLine = [String]()
    
//    var time = ["2016.06.01","2016.05.16","2016.05.04","2016.04.21","2016.04.01","2016.03.21","2016.03.05","2016.02.21","2016.02.11","2016.02.01","2016.01.11"]
//    var value = ["22.00","26.20","22.80","14.90","19.77","18.33","24.20","18.27","19.34","18.88","19.00"]
    var time = [String]()
    var value = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //去除cell下划线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false
        
        chartName.text = chartname
        alphaColor()
        
        getRport(name)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reporthistoryArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1.每当点中TableViewCell之后, 都会恢复原来的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart31", forIndexPath: indexPath) as! HealthPart3TableViewCell
            cell.timeLabel.text = reporthistoryArray[indexPath.row].time
            cell.valueLabel.text = reporthistoryArray[indexPath.row].value
            if reporthistoryArray[indexPath.row].state == "low" {
                cell.rangepic.image = UIImage(named: "健康报告-3")
            }else if reporthistoryArray[indexPath.row].state == "high" {
                //原始图片
                let srcImage = UIImage(named: "健康报告-3")!
                
                //翻转图片的方向
                var flipImageOrientation = (srcImage.imageOrientation.rawValue + 4) % 8
                flipImageOrientation += flipImageOrientation%2==0 ? 1 : -1
                //翻转图片
                let flipImage =  UIImage(CGImage:srcImage.CGImage!,
                                         scale:srcImage.scale,
                                         orientation:UIImageOrientation(rawValue: flipImageOrientation)!
                )
                
                //图片显示
                cell.rangepic.image = flipImage
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart32", forIndexPath: indexPath) as! HealthPart3TableViewCell
            cell.timeLabel.text = time[indexPath.row]
            cell.valueLabel.text = reporthistoryArray[indexPath.row].value
            if reporthistoryArray[indexPath.row].state == "low" {
                cell.rangepic.image = UIImage(named: "健康报告-3")
            }else if reporthistoryArray[indexPath.row].state == "high" {
                //原始图片
                let srcImage = UIImage(named: "健康报告-3")!
                
                //翻转图片的方向
                var flipImageOrientation = (srcImage.imageOrientation.rawValue + 4) % 8
                flipImageOrientation += flipImageOrientation%2==0 ? 1 : -1
                //翻转图片
                let flipImage =  UIImage(CGImage:srcImage.CGImage!,
                                         scale:srcImage.scale,
                                         orientation:UIImageOrientation(rawValue: flipImageOrientation)!
                )
                
                //图片显示
                cell.rangepic.image = flipImage
            }
            return cell
        }
    }

    
    
    //创建图表渐变色背景
    func alphaColor() {
        
        //绿色
        
        let TColor = UIColor.orangeColor()
        
        //蓝色
        
        let BColor = UIColor.yellowColor()
        
        //将颜色和颜色的位置定义在数组内
        
        let gradientColors: [CGColor] = [TColor.CGColor, BColor.CGColor]
        
        //创建并实例化CAGradientLayer
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        //渲染的起始位置
        
        gradientLayer.startPoint = CGPointMake(0, 0)
        
        //渲染的终止位置
        
        gradientLayer.endPoint = CGPointMake(0, 1.2)
        
        //设置frame和插入view的layer
        
        gradientLayer.frame = chartview.bounds
        
        chartview.layer.insertSublayer(gradientLayer, atIndex: 0)
        
    }
    
    //运用PNChart绘制折线图
    //运用PNChart绘制折线图
    func LineCharts(LineChart: PNLineChart, dataArray:NSArray, timeLine:NSArray) {
        let LineData = PNLineChartData()
        LineData.color = UIColor.whiteColor()
        //        LineData.inflexionPointStyle = PNLineChartData.PNLineChartPointStyle.PNLineChartPointStyleCycle
        //        LineData.inflexionPointWidth = 0
        LineData.itemCount = (Int)(dataArray.count)
        LineData.getData = ({(index:Int) ->PNLineChartDataItem in
            let y:CGFloat = (CGFloat)(dataArray[(Int)(index)] as! NSNumber)
            return PNLineChartDataItem(y: y)
        })
        
        LineChart.showLabel = true
        LineChart.yLabelHeight = 0
        LineChart.axisWidth = 0
        LineChart.backgroundColor = UIColor.clearColor()
        LineChart.xLabels = timeLine
        LineChart.showCoordinateAxis = true
        LineChart.exclusiveTouch = false
        
        LineChart.chartData = [LineData]
        LineChart.strokeChart()
        
        chartview.addSubview(LineChart)
        
    }
    
    
    func getRport(name:String) {
        
        let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
        let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
        let id:Int = NSUserDefaults.standardUserDefaults().valueForKey("userId") as! Int
        
        let headers = ["Accept":"application/json",
                       "X-User-Phone": phone,
                       "X-User-Token": token]
        
        let url = "http://220.163.125.158:8081/reports/" + "\(name)"
        print(url)
        Alamofire.request(.GET, url, headers: headers)
            .responseString { response in
                var json = JSON(data: response.data!)
                var info = json["list"]
                
                if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                    
                    for i in 0..<info.count {
                        var dict = [String : AnyObject]()
                        dict["time"] = info[i]["date"].stringValue
                        dict["value"] = "\(info[i]["value"])"
                        dict["state"] = "\(info[i]["state"])"
                        // 字典转模型并将模型添加到模型数组中
                        self.reporthistoryArray.append(ReportHistory(dict: dict))
                    }
                    
                    for (_, value) in info {
                        self.dataArray.append(value["value"].floatValue)
                        self.timeLine.append("\(value["date"])")
                    }
                    
                    self.tableView.reloadData()
                    dispatch_async(dispatch_get_main_queue(), {
                        self.LineCharts(self.LineChart, dataArray: self.dataArray, timeLine: self.timeLine)
                    })
                    
                }else{
                    
                    var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "添加昵称失败！"
                    //延迟隐藏
                    hud.hide(true, afterDelay: 0.8)
                    
                }
                
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
