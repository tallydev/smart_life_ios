//
//  FitnessTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import PNChartSwift

class FitnessTableViewController: UITableViewController {
    var chartname = String()
    
    @IBOutlet weak var chartview: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    let LineChart = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    let LineChart0 = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    let LineChart1 = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    let LineChart2 = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    
    var dataArray = [0.00,22.00,390.00,523.00,812.00,202.00,950.00,520.00,345.00,123.00,712.00]
    var timeLine = ["","2016.4","","","","2016.5","","","","2016.6",""]
    
    var dataArray0 = [0.00,22.00,90.00,53.00,812.00,202.00,90.00,520.00,345.00,123.00,72.00]
    var timeLine0 = ["","16.4","","","","16.5","","","","16.6",""]
    
    var dataArray1 = [0.00,22.00,30.00,523.00,12.00,22.00,950.00,20.00,345.00,23.00,712.00]
    var timeLine1 = ["","216.4","","","","216.5","","","","216.6",""]
    
    var dataArray2 = [0.00,22.00,0.00,23.00,812.00,202.00,90.00,52.00,35.00,13.00,712.00]
    var timeLine2 = ["","2.4","","","","2.5","","","","2.6",""]
    
    var ranking = ["5","1","2","3","4","6","7","8","9","10"]
    var username = ["Loda","Saber","Dendi","Jhon","Ending","Jason","Ema","Jacbo","May","Ken"]
    var userimage = ["健步达人-4","健步达人-5","健步达人-6","健步达人-7","健步达人-8","健步达人-4","健步达人-5","健步达人-6","健步达人-7","健步达人-8"]
    var step = ["9030","11000","10980","10000","9603","8900","8820","5032","4890","2000"]
    var support = ["59","10","22","0","34","10","11","0","2","9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        //去除cell下划线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false
        
        segmentedControl.selectedSegmentIndex = 0 //默认选中第二项
        segmentedControl.tintColor = UIColor.init(red: 1.00, green: 0.55, blue: 0.00, alpha: 1.00)
        
        alphaColor()
        LineChart(LineChart,dataArray: dataArray, timeLine: timeLine)
        
        segmentedControl.addTarget(self, action: #selector(FitnessTableViewController.segmentChange(_:)),
                                forControlEvents: UIControlEvents.ValueChanged)  //添加值改变监听
        // Do any additional setup after loading the view.
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ranking.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1.每当点中TableViewCell之后, 都会恢复原来的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Fitness", forIndexPath: indexPath) as! FitnessTableViewCell
        cell.rankingLabel.text = ranking[indexPath.row]
        cell.userImage.image = UIImage(named: userimage[indexPath.row])
        cell.userNameLabel.text = username[indexPath.row]
        cell.stepLabel.text = step[indexPath.row]
        if Int(support[indexPath.row]) > 0 {
            cell.supportIcon.image = UIImage(named: "健步达人-1")
        }else{
            cell.supportIcon.image = UIImage(named: "健步达人-3")
        }
        cell.supportNumber.text = support[indexPath.row]
        return cell
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
    func LineChart(LineChart: PNLineChart, dataArray:NSArray, timeLine:NSArray) {
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
        
        LineChart.chartData = [LineData]
        LineChart.strokeChart()
        
        chartview.addSubview(LineChart)
        
    }
    
    func segmentChange(segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0 :
            LineChart0.removeFromSuperview()
            LineChart1.removeFromSuperview()
            LineChart2.removeFromSuperview()
            LineChart(LineChart,dataArray: dataArray, timeLine: timeLine)
        case 1 :
            LineChart.removeFromSuperview()
            LineChart1.removeFromSuperview()
            LineChart2.removeFromSuperview()
            LineChart(LineChart0,dataArray: dataArray0, timeLine: timeLine0)
        case 2 :
            LineChart0.removeFromSuperview()
            LineChart.removeFromSuperview()
            LineChart2.removeFromSuperview()
            LineChart(LineChart1,dataArray: dataArray1, timeLine: timeLine1)
        default:
            LineChart0.removeFromSuperview()
            LineChart1.removeFromSuperview()
            LineChart.removeFromSuperview()
            LineChart(LineChart2,dataArray: dataArray2, timeLine: timeLine2)
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
