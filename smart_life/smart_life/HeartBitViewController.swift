//
//  HeartBitViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/6/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import CoreMotion
import PNChartSwift
import MBProgressHUD

//定义个全局变量  如果不是全局变量会报错
let pedonmeter:CMPedometer = CMPedometer()

class HeartBitViewController: UIViewController {
    
    var timer:NSTimer!
//    let LineChart = PNLineChart(frame: CGRectMake(-10, 100, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width/3))
//    var dataArray = [0,0,523,812,202,950,520,345,123,712,602,850]
//    var timeLine = ["2","4","6","8","10","12","14","16","18","20","22","24"]
    
//    @IBOutlet weak var segmentedControl: UISegmentedControl!
//    @IBOutlet weak var chartView: UIView!
//    @IBAction func IndexChange(sender: UISegmentedControl) {
//        switch segmentedControl.selectedSegmentIndex
//        {
//        case 0:
//            dataArray = [0,0,523,812,202,950,520,345,123,712,602,850];
//            timeLine = ["2","4","6","8","10","12","14","16","18","20","22","24"]
//        case 1:
//            dataArray = [0,20,23,82,22,90,50];
//            timeLine = ["一", "二", "三", "四", "五", "六", "日"]
//        case 2:
//            dataArray = [10,120,123,182,122,190,150,145,113,172,162,150];
//            timeLine = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
//        case 3:
//            dataArray = [20,220,223,282,222];
//            timeLine = ["3月", "4月", "5月", "6月", "7月"]
//        default:
//            break; 
//        }
//        paintPge()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5,target:self,selector:#selector(HeartBitViewController.getStepsNumber),userInfo:nil,repeats:true)
//        segmentedControl.selectedSegmentIndex = 0
//        paintPge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func paintPge(){
    
//        alphaColor()
//        LineChart(LineChart)
        
//    }
    
    //创建图表渐变色背景
//    func alphaColor() {
//        
//        //绿色
//        
//        let TColor = UIColor.orangeColor()
//        
//        //蓝色
//        
//        let BColor = UIColor.yellowColor()
//        
//        //将颜色和颜色的位置定义在数组内
//        
//        let gradientColors: [CGColor] = [TColor.CGColor, BColor.CGColor]
//        
//        //创建并实例化CAGradientLayer
//        
//        let gradientLayer: CAGradientLayer = CAGradientLayer()
//        
//        gradientLayer.colors = gradientColors
//        
//        //渲染的起始位置
//        
//        gradientLayer.startPoint = CGPointMake(0, 0)
//        
//        //渲染的终止位置
//        
//        gradientLayer.endPoint = CGPointMake(0, 1.5)
//        
//        //设置frame和插入view的layer
//        
//        gradientLayer.frame = chartView.bounds
//        
//        chartView.layer.insertSublayer(gradientLayer, atIndex: 0)
//        
//    }
    
    //运用PNChart绘制折线图
//    func LineChart(LineChart: PNLineChart) {
//        let LineData = PNLineChartData()
//        LineData.color = UIColor.whiteColor()
//        LineData.itemCount = (Int)(dataArray.count)
//        LineData.getData = ({(index:Int) ->PNLineChartDataItem in
//            let y:CGFloat = (CGFloat)(self.dataArray[(Int)(index)] as NSNumber)
//            return PNLineChartDataItem(y: y)
//        })
//        
//        LineChart.showLabel = true
//        LineChart.yLabelHeight = 0
//        LineChart.axisWidth = 0
//        LineChart.backgroundColor = UIColor.clearColor()
//        LineChart.xLabels = timeLine
//        LineChart.showCoordinateAxis = true
//        
//        LineChart.chartData = [LineData]
//        LineChart.strokeChart()
//        
//        chartView.addSubview(LineChart)
//        
//    }
    
    func getStepsNumber() {
        //判断该设备是否支持计步功能
        if CMPedometer.isStepCountingAvailable(){
            
            //开始时间
            let startTime = getStartTime()
            //结束时间
            let endTime = getEndTime()
            
            //第二种
            
            //获取指定开始时间到当前时间的数据  参数 开始时间, 一个闭包
            pedonmeter.startPedometerUpdatesFromDate(startTime, withHandler: { (pedometerData:CMPedometerData?, error:NSError?) -> Void in
                if error != nil{
                    print("error:\(error)")
                }
                else{
                    print("开始时间:\(startTime)")
                    print("结束时间:\(endTime)")
                    print("步数===\(pedometerData!.numberOfSteps)")
                    print("距离===\(pedometerData!.distance)")
                }
            })
            
        } else {
            print("there has something with CMPedometer")
        }
    }
    
        /**
     获取当前时区的时间
     */
    func getEndTime() -> NSDate
    {
        let date = NSDate()
        //转换成本地时区
        let numberOfDays = -8
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value: numberOfDays, toDate: date, options: NSCalendarOptions.init(rawValue: 0))
        
        let zone = NSTimeZone.systemTimeZone()
        let interval = zone.secondsFromGMTForDate(calculatedDate!)
        let nowDate = calculatedDate!.dateByAddingTimeInterval(Double(interval))
        print("获取当前时区的时间:\(nowDate)")
        return nowDate
    }
    /**
     获取开始时间 当天0时0分0秒
     */
    func getStartTime() -> NSDate
    {
        let datef = NSDateFormatter()
        datef.dateFormat = "yyyy-MM-dd"
        let stringdate = datef.stringFromDate(getEndTime())
        print("当天日期:\(stringdate)")
        let tdate = datef.dateFromString(stringdate)
        //获取本地时区的当天0时0分0秒
        let numberOfDays = -8
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value: numberOfDays, toDate: tdate!, options: NSCalendarOptions.init(rawValue: 0))
        
        let zone = NSTimeZone.systemTimeZone()
        let interval = zone.secondsFromGMTForDate(calculatedDate!)
        let nowday = calculatedDate!.dateByAddingTimeInterval(Double(interval))
        
        print("当天开始时间:\(nowday)")
        return nowday
    }



}

