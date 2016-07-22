//
//  HealthPart3ViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import PNChartSwift

class HealthPart3ViewController: UITableViewController {
    var chartname = String()
    @IBOutlet weak var chartview: UIView!
    @IBOutlet weak var chartName: UILabel!
    let LineChart = PNLineChart(frame: CGRectMake(-20, 50, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    var dataArray = [0,22,390,523,812,202,950,520,345,123,712]
    var timeLine = ["","2016.4","","","","2016.5","","","","2016.6",""]
    
    var time = ["2016.06.01","2016.05.16","2016.05.04","2016.04.21","2016.04.01","2016.03.21","2016.03.05","2016.02.21","2016.02.11","2016.02.01","2016.01.11"]
    var value = ["22.00","26.20","22.80","14.90","19.77","18.33","24.20","18.27","19.34","18.88","19.00"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //去除cell下划线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false
        
        chartName.text = chartname
        alphaColor()
        LineChart(LineChart)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return time.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1.每当点中TableViewCell之后, 都会恢复原来的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart31", forIndexPath: indexPath) as! HealthPart3TableViewCell
            cell.timeLabel.text = time[indexPath.row]
            cell.valueLabel.text = value[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("HealthPart32", forIndexPath: indexPath) as! HealthPart3TableViewCell
            cell.timeLabel.text = time[indexPath.row]
            cell.valueLabel.text = value[indexPath.row]
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
    func LineChart(LineChart: PNLineChart) {
        let LineData = PNLineChartData()
        LineData.color = UIColor.whiteColor()
//        LineData.inflexionPointStyle = PNLineChartData.PNLineChartPointStyle.PNLineChartPointStyleCycle
//        LineData.inflexionPointWidth = 0
        LineData.itemCount = (Int)(dataArray.count)
        LineData.getData = ({(index:Int) ->PNLineChartDataItem in
            let y:CGFloat = (CGFloat)(self.dataArray[(Int)(index)] as NSNumber)
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
