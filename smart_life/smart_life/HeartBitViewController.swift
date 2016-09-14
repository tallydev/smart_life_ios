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
import SwiftDate

////定义个全局变量  如果不是全局变量会报错
//let pedonmeter:CMPedometer = CMPedometer()

class HeartBitViewController: UIViewController {
    
//    var timer:NSTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
//        timer = NSTimer.scheduledTimerWithTimeInterval(5,target:self,selector:#selector(HeartBitViewController.getStepsNumber),userInfo:nil,repeats:true)
//        segmentedControl.selectedSegmentIndex = 0
//        paintPge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getStepsNumber() {
        //判断该设备是否支持计步功能
        if CMPedometer.isStepCountingAvailable(){
            
            let now = NSDate()
            let nextWeek = now + 1.weeks
            let dayAfterTomorrow = now + 2.days
            
            print("+++++++++++++++++++++++++")
            print(now)
            print(nextWeek-1.hours)
            print(dayAfterTomorrow)
            
            //开始时间
            let startTime = getStartTime()
            //结束时间
            let endTime = getEndTime()
            
            pedonmeter.queryPedometerDataFromDate(_: startTime, toDate: endTime, withHandler: { (pedometerData:CMPedometerData?, error:NSError?) -> Void in
                    if error != nil{
                        print("error:\(error)")
                    }else{
                        print("开始时间:\(startTime)")
                //                    print("结束时间:\(endTime)")
                        print("步数===\(pedometerData!.numberOfSteps)")
                        print("距离===\(pedometerData!.distance)")
                        
                    }
                })
            //第二种
            
            //获取指定开始时间到当前时间的数据  参数 开始时间, 一个闭包
//            pedonmeter.startPedometerUpdatesFromDate(startTime, withHandler: { (pedometerData:CMPedometerData?, error:NSError?) -> Void in
//                if error != nil{
//                    print("error:\(error)")
//                }
//                else{
//                    print("开始时间:\(startTime)")
////                    print("结束时间:\(endTime)")
//                    print("步数===\(pedometerData!.numberOfSteps)")
//                    print("距离===\(pedometerData!.distance)")
//                }
//            })
            
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

