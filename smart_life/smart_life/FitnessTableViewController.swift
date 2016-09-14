//
//  FitnessTableViewController.swift
//  smart_life
//
//  Created by 张留刚 on 16/7/13.
//  Copyright © 2016年 张留刚. All rights reserved.
//

import UIKit
import PNChartSwift
import Alamofire
import SwiftyJSON
import MBProgressHUD
import SwiftDate

class FitnessTableViewController: UITableViewController {
    let Center = NSNotificationCenter.defaultCenter()
    
    var page = 1//下拉加载后的页数
    var rank_num = 0
    var named:String = "daily"
    var loadMoreText = UILabel()
    var tableFooterView = UIView()//列表的底部，用于显示“上拉查看更多”的提示，当上拉后显示类容为“松开加载更多”。
    
    var dataArray = [Float]()
    var timeLine = [String]()
    var chartname = String()
    @IBOutlet weak var averagelabel: UILabel!
    @IBOutlet weak var stepnumber: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var persentLabel: UILabel!

    @IBOutlet weak var chartview: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    let LineChart = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    let LineChart0 = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    let LineChart1 = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    let LineChart2 = PNLineChart(frame: CGRectMake(-20, 120, UIScreen.mainScreen().bounds.width+20, UIScreen.mainScreen().bounds.width/3))
    
    var ranking = [String]()
    var username = [String]()
    var userimage = [String]()
    var step = [String]()
    
    override func viewWillAppear(animated: Bool) {
        Center.addObserver(self, selector: Selector("Command:"), name: String(classForCoder), object: nil)
    }
    
    deinit {
        Center.removeObserver(self)
    }
    
    func Command(notification:NSNotification){
        self.LineChart(self.LineChart,dataArray: dataArray, timeLine: timeLine)
        print(dataArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: Selector(self.Rank("daily")), forControlEvents: UIControlEvents.ValueChanged)
//        self.refreshControl = refreshControl
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
        view.backgroundColor=UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.50)
        self.navigationController?.view.addSubview(view)
        
        stepDayly("daily")
        Rank("daily")
        //去除cell下划线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //隐藏滚动条
        self.tableView.showsVerticalScrollIndicator = false
        
        segmentedControl.selectedSegmentIndex = 0 //默认选中第二项
        segmentedControl.tintColor = UIColor.init(red: 1.00, green: 0.55, blue: 0.00, alpha: 1.00)
        
        alphaColor()
//        LineChart(LineChart,dataArray: dataArray, timeLine: timeLine)
        
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
        if userimage[indexPath.row].isEmpty == true {
            cell.userImage.image = UIImage(named: "个人中心-29")
        }else{
            cell.userImage.imageFromURL((userimage[indexPath.row]),placeholder: (UIImage(named:"个人中心-29")?.roundCornersToCircle(border: 40,
            color: UIColor.orangeColor())!)!)
        }
        if username[indexPath.row].isEmpty == true {
            cell.userNameLabel.text = "昵称为空"
        }else{
            cell.userNameLabel.text = username[indexPath.row]
        }
        cell.stepLabel.text = step[indexPath.row]
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
        LineChart.exclusiveTouch = false
        
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
            
            page = 1
            rank_num = 0
            named = "daily"
            self.ranking = []
            self.username = []
            self.userimage = []
            self.step = []
            
            self.stepDayly("daily")
            self.Rank("daily")
        case 1 :
            LineChart.removeFromSuperview()
            LineChart1.removeFromSuperview()
            LineChart2.removeFromSuperview()
            
            page = 1
            rank_num = 0
            named = "weekly"
            self.ranking = []
            self.username = []
            self.userimage = []
            self.step = []
            self.stepDayly("weekly")
            self.Rank("weekly")
        case 2 :
            LineChart0.removeFromSuperview()
            LineChart.removeFromSuperview()
            LineChart2.removeFromSuperview()
            
            page = 1
            rank_num = 0
            named = "monthly"
            self.ranking = []
            self.username = []
            self.userimage = []
            self.step = []
            self.stepDayly("monthly")
            self.Rank("monthly")
        default:
            LineChart0.removeFromSuperview()
            LineChart1.removeFromSuperview()
            LineChart.removeFromSuperview()
            
            page = 1
            rank_num = 0
            named = "yearly"
            self.ranking = []
            self.username = []
            self.userimage = []
            self.step = []
            self.stepDayly("yearly")
            self.Rank("yearly")
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

extension FitnessTableViewController {
    func Rank(name:String) {
        
        let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
        let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
        
        print(phone)
        print(token)
        
        let headers = ["Accept":"application/json",
                       "X-User-Phone": phone,
                       "X-User-Token": token]
        let body = [
            "page": page,
            "per_page": "10"
        ]
        let url = "http://elive.clfsj.com:8081/ranks/" + name
        
        Alamofire.request(.GET, url, headers: headers, parameters: body as! [String : AnyObject])
            .responseString { response in
                var json = JSON(data: response.data!)
                var info = json["top"]
                
//                print(json)
                
                if json["errors"].isEmpty == true && json["error"].isEmpty == true{
                    for (_, value1) in info {
                        self.rank_num += 1
                        self.ranking.append("\(self.rank_num)")
                        self.username.append(value1["nickname"].stringValue)
                        self.userimage.append(value1["avatar"].stringValue)
                        self.step.append("\(value1["count"])")
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        print(self.userimage)
                        self.tableView?.reloadData()
//                        self.refreshControl?.endRefreshing()
                        return
                    })
                }else{
                    
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "添加昵称失败！"
                    //延迟隐藏
                    hud.hide(true, afterDelay: 0.8)
                    
                }
                
        }
    }
    
    func stepDayly(name:String) {
        let token:String = NSUserDefaults.standardUserDefaults().valueForKey("userToken") as! String
        let phone:String = NSUserDefaults.standardUserDefaults().valueForKey("userphone") as! String
        
        print(phone)
        print(token)
        
        let headers = ["Accept":"application/json",
                       "X-User-Phone": phone,
                       "X-User-Token": token]
        let url = "http://elive.clfsj.com:8081/sports/" + name
        print(url)
        Alamofire.request(.GET, url, headers: headers)
            .responseString { response in
                var json = JSON(data: response.data!)
                
                print(json)
                
                var stepSelf = json["self"]
                var dataArray1 = [Float]()
                var timeLine1 = [String]()
                if json["errors"].isEmpty == true && json["error"].isEmpty == true {
                    for (_, value) in json["detail"] {
                        dataArray1.append(value["count"].floatValue)
                        timeLine1.append("")
                    
                    }
                    self.averagelabel.text = "日平均值:" + json["self"]["avg_count"].stringValue + "步"
                    self.stepnumber.text = json["self"]["today_count"].stringValue + "步"
                    let datef = NSDateFormatter()
                    datef.dateFormat = "HH:mm:ss"
                    self.time.text = datef.stringFromDate(NSDate())
                    self.stepNumberLabel.text = json["self"]["count"].stringValue
                    var persent = json["self"]["rank_percent"]
                    self.persentLabel.text = "\(persent.float!*100)%"
                    if name == "daily" {
                        self.getStepsNumber()
                    }else if name == "weekly" {
                        self.LineChart(self.LineChart0,dataArray: dataArray1, timeLine: timeLine1)
                    }else if name == "monthly" {
                        self.LineChart(self.LineChart1,dataArray: dataArray1, timeLine: timeLine1)
                    }else{
                        self.LineChart(self.LineChart2,dataArray: dataArray1, timeLine: timeLine1)
                    }
                }else{
                    
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "获取信息失败！"
                    //延迟隐藏
                    hud.hide(true, afterDelay: 0.8)
                    
                }
                
        }
    }
}

extension FitnessTableViewController {
    func getStepsNumber() {
        //判断该设备是否支持计步功能
        if CMPedometer.isStepCountingAvailable(){

            let datef = NSDateFormatter()
            datef.dateFormat = "yyyy-MM-dd"
            let stringdate = datef.stringFromDate(getEndTime())
            //获取指定开始时间到当前时间的数据  参数 开始时间, 一个闭包
            //开始时间
            var startTime = getStartTime()
            //结束时间
            let endT = NSDate()
            let number = endT.hour
            self.dataArray = []
            self.timeLine = []
                for i in 0...number {
                  var endTime = startTime + 1.hours
                    pedonmeter.queryPedometerDataFromDate(_: startTime, toDate: endTime, withHandler: { (pedometerData:CMPedometerData?, error:NSError?) -> Void in
                        if error != nil{
                            print("error:\(error)")
                        }else{
                            print("============+++++++==============")
                            self.dataArray.append(pedometerData!.numberOfSteps.floatValue)
                            let datef = NSDateFormatter()
                            datef.dateFormat = "HH"
                            self.timeLine.append("")
                            print("\(pedometerData!.numberOfSteps)")
                            if i == number {
                                self.Center.postNotificationName(String(self.classForCoder), object: true)
                            }
                        }
                    })
                    startTime = endTime
                }
            
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
        let tdate = datef.dateFromString(stringdate)
        //获取本地时区的当天0时0分0秒
        let numberOfDays = -8
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Hour, value: numberOfDays, toDate: tdate!, options: NSCalendarOptions.init(rawValue: 0))
        
        let zone = NSTimeZone.systemTimeZone()
        let interval = zone.secondsFromGMTForDate(calculatedDate!)
        let nowday = calculatedDate!.dateByAddingTimeInterval(Double(interval))
        return nowday
    }
    
    
    /*上拉到一定程度松开后开始加载更多*/
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool){
        loadMoreText.text = "加载。。。。。。"
        if scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height + 30){
            page += 1
            self.Rank(named)
            self.tableView.reloadData()
        }
    }
    

    
}

